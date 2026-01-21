<script setup lang="ts">
import { ref } from 'vue';
import { defineProps } from 'vue';

// Definicja typów dla właściwości komponentu
const props = defineProps({
  comment: {
    type: Object,
    required: true
  }
});

// // Pobieranie właściwości (props) w komponencie
// const isFormVisible = ref(false);

// // Funkcja do przełączania widoczności formularza
// const toggleFormVisibility = () => {
//   isFormVisible.value = !isFormVisible.value;
// };
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
  </div>
</template>