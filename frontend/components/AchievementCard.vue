<script setup lang="ts">
import { defineProps, computed } from 'vue';

const props = defineProps({
  achievement: {
    type: Object,
    required: true
  },
  achieved: {
    type: Boolean,
    required: true
  }
});

const icon = computed(() => props.achieved ? 'i-heroicons-lock-open' : 'i-heroicons-lock-closed');
const color = computed(() => props.achieved ? 'text-green-600' : 'text-red-600');
</script>

<template>
  <UCard class="w-3/4 m-1.5 p-1.5" :class="color">
    <div class="flex justify-between">
      <div class="flex items-center">
        <div class="mr-1">
          <UIcon class="size-6" :name="icon"/>
        </div>
        <div>
          <h2 class="text-center">{{ achievement.name }}</h2>
        </div>
      </div>
      <div class="flex items-center">
        <div>
          <p class="text-left">{{ achievement.description }}</p>
        </div>
      </div>
    </div>
  </UCard>
</template>

<style scoped>
</style>