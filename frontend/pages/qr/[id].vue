<script setup lang="ts">
import { ref, onMounted } from 'vue';
const config = useRuntimeConfig();
const serverUrl = config.public.serverUrl
const clientUrl = config.public.clientUrl
let mountain_id = null;
const mountainData = ref();
const route = useRoute();
const isLogged = ref(false);

onMounted(() => {
  mountain_id = route.params.id as string;
  getMountainById(mountain_id);
  if (process.client) {
    isLogged.value = !!localStorage.getItem('access_token');
  }
});

async function getMountainById(id: string) {
  try {
    const response = await $fetch(`${serverUrl}/api/mountains/id/${id}`);
    mountainData.value = response.mountain;
    console.log(response);
  } catch (error) {
    console.error('Error:', error);
  }
}
const toast = useToast()

async function addToCollection() {
  try {
    let user_id = localStorage.getItem('user_id')
    let mountain_id = mountainData.value.mountain_id
    console.log(user_id, mountain_id)
    const response = await $fetch(`${serverUrl}/qr/${mountain_id}`, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${localStorage.getItem("access_token")}`,
        'Accept': 'application/json'
      },
      body: JSON.stringify({
        user_id : user_id,
        mountain_id : mountain_id,
      }),
      mode: 'cors'
    })
    console.log(response)
    if (response.status === 'success') {

      toast.add({
        title: 'Sukces',
        description: 'Udało się dodać do kolekcji!.',
        type: 'success'
      })
      await navigateTo(`/user/collection`)
    }
  } catch (error) {
    console.error('Error:', error);
  }
}
</script>

<template>
  <div>
    <UDivider>Gratulacje! Odblokowałeś:</UDivider>
    <div v-if="mountainData" class="flex items-start">
      <NuxtImg
          :src="`${serverUrl}/${mountainData.image_path || 'mountain.webp'}`"
          class="h-1/4 w-1/4 mr-2 mt-1"
      />
      <div>
        <h2 class="font-bold">{{ mountainData.mountain_name || 'Nazwa góry' }}</h2>
        <p>{{ mountainData.description || 'Opis góry' }}</p>
      </div>
    </div>
    <div v-else>
      <p>Ładowanie...</p>
      <USkeleton class="h-[150px] w-[550px]" :ui="{ rounded: 'rounded-full' }" />
    </div>

    <div>
      <UButton v-if="isLogged" @click="addToCollection">Dodaj do kolekcji</UButton>
      <UButton v-else to="/login">Zaloguj się</UButton>
    </div>
  </div>
</template>