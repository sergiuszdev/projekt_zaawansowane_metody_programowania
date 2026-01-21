<script setup lang="ts">
import {ref, onMounted, defineProps} from 'vue';
const config = useRuntimeConfig();
const serverUrl = config.public.serverUrl;

const isLogged = ref(false);
const toast = useToast();
const content = ref('');

onMounted(() => {
  if (process.client) {
    isLogged.value = !!localStorage.getItem('access_token');
  }
});

const props = defineProps({
  mountain_id: {
    type: String,
    required: true
  }
});

async function addComment() {
  let user_id = localStorage.getItem('user_id');

  try {
    const response = await $fetch(`${serverUrl}/comments/add`, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('access_token')}`,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        user_id: user_id,
        mountain_id: props.mountain_id,
        root_comment_id: '',
        content: content.value,
      }),
    });
    if (response == 200) {
      toast.add({
        title: 'Sukces',
        description: 'Udało się dodać komentarz!',
        type: 'success',
      });
      window.location.reload();
    } else {
      toast.add({
        title: 'Błąd',
        description: 'Nie udało się dodać komentarza.',
        type: 'error',
      });
    }
  } catch (error) {
    console.error('Error:', error);
    toast.add({
      title: 'Błąd',
      description: 'Wystąpił błąd podczas dodawania komentarza.',
      type: 'error',
    });
  }
}
</script>

<template>
  <UForm class="p-1 m-1">
    <div v-if="isLogged">
      <UTextarea v-model="content" placeholder="Podziel się swoją opinią" />
      <UButton class="mt-2" @click="addComment">
        Dodaj komentarz
      </UButton>
    </div>
    <div v-else>
      <UTextarea placeholder="Musisz się najpierw zalogować" disabled />
      <NuxtLink to="/login">
        <UButton class="mt-2">
          Zaloguj się
        </UButton>
      </NuxtLink>
    </div>
  </UForm>
</template>