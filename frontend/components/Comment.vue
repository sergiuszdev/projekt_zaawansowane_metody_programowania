<script setup lang="ts">
import { ref } from 'vue';
import { defineProps } from 'vue';
const config = useRuntimeConfig();
const serverUrl = config.public.serverUrl

const content = ref('');

const toast = useToast();

// Definicja typów dla właściwości komponentu
const props = defineProps({
  comment: {
    type: Object,
    required: true
  }
});

// Pobieranie właściwości (props) w komponencie
const isFormVisible = ref(false);

// Funkcja do przełączania widoczności formularza
const toggleFormVisibility = () => {
  isFormVisible.value = !isFormVisible.value;
};
async function answer() {
  let user_id = localStorage.getItem('user_id');
  console.log(user_id,props.comment.mountain_id, props.comment.root_comment_id, props.comment.content)
  try {
    const response = await $fetch(`${serverUrl}/comments/answer`, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('access_token')}`,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        user_id: user_id,
        mountain_id: props.comment.mountain_id,
        root_comment_id: props.comment.comment_id,
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
  <div class="comment border border-gray-300 p-4 mb-4 rounded-lg bg-slate-900">
    <div class="comment-header flex justify-between mb-2">
      <span class="comment-username font-bold">{{ comment.username }}</span>
      <span class="comment-date text-gray-400 text-sm">{{ comment.created_at }}</span>
    </div>
    <div class="comment-content text-base leading-relaxed">
      {{ comment.content }}
    </div>
    <!-- Toggle button to show/hide the form -->
    <button @click="toggleFormVisibility" class="mt-2 text-gray-400 hover:text-gray-200">
      <span v-if="isFormVisible"> ▼ Schowaj odpowiedzi</span>
      <span v-else> ▶ Pokaż odpowiedzi</span>
    </button>
    <UForm v-if="isFormVisible" class="p-1 m-1">
      <CommentReply v-for="reply in comment.responses" :key="reply.comment_id" :comment="reply" />
      <UTextarea v-model="content" placeholder="Wpisz odpowiedź"></UTextarea>
      <UButton class="mt-2" @click="answer">Odpowiedz</UButton>
    </UForm>
  </div>
</template>
