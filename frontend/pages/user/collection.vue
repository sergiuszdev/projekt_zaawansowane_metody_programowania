<script setup lang="ts">
import { ref, onMounted } from 'vue';
import MountainCard from "~/components/MountainCard.vue";

const config = useRuntimeConfig();
const serverUrl = config.public.serverUrl;

const achievedMountains = ref([]);
const notAchievedMountains = ref([]);
const collectedByUser = ref(0);
const collectionSize = ref(0);
const isLogged = ref(false);

onMounted(() => {
  if (process.client) {
    isLogged.value = !!localStorage.getItem('access_token');
  }
});

async function getMountains() {
  try {
    const response = await $fetch(`${serverUrl}/api/mountains/users_mountains`, {
      method: 'GET',
      headers: {
        'Authorization': `Bearer ${localStorage.getItem("access_token")}`,
        'Accept': 'application/json'
      },
      mode: 'cors'
    });
    achievedMountains.value = response.achieved;
    notAchievedMountains.value = response.not_achieved;
    collectedByUser.value = response.achieved_count;
    collectionSize.value = response.achieved_count + response.not_achieved_count;
  } catch (error) {
    if (!isLogged.value) {
      await navigateTo('/login');
    }
    console.log(error);
  }
}

onMounted(() => {
  getMountains();
});
</script>

<template>
  <div class="p-2.5 m-2.5">
    <h2>Twoje postępy: {{ collectedByUser }} / {{ collectionSize }}</h2>
    <UProgress :value="collectedByUser" :max="collectionSize" />
  </div>

  <div class="overflow-x-auto flex flex-wrap justify-items-center justify-center">
    <MountainCard v-for="mountain in achievedMountains" :key="mountain.mountain_id" :mountain="mountain" />
  </div>
</template>

<style scoped>
</style>