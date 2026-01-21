<script setup lang="ts">
import { defineProps } from 'vue';

// Definiowanie właściwości
const props = defineProps({
  username: {
    type: String,
    required: true
  },
  count: {
    type: Number,
    required: true
  },
  rank: {
    type: Number,
    required: true
  }
});

let color = 'text-white-600';
</script>

<template>
  <UCard class="w-3/4 m-1.5 p-1.5" :class="color">
    <div class="flex justify-between">
      <div>
        <h2 class="text-left">{{ rank }}.</h2>
      </div>
      <div class="flex items-center">
        <div>
          <h2 class="text-center">{{ username }}</h2>
        </div>
      </div>
      <div class="flex items-center">
        <div>
          <p class="text-right">Osiągnięcia: {{ count }}</p>
        </div>
      </div>
    </div>
  </UCard>
</template>

<style scoped>
</style>