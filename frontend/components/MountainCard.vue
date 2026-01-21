<script setup lang="ts">
import { defineProps } from 'vue';

defineProps({
  mountain: {
    type: Object,
    required: true
  }
});

let config = useRuntimeConfig()
let serverUrl = config.public.serverUrl
</script>


<template>
  <UCard class="w-1/5 m-1">
    <template #header>
      <h1>{{ mountain.mountain_name }}</h1>
    </template>
    <template #default>
      <NuxtImg :src="`${serverUrl}/${mountain.image_path}`" :alt="mountain.mountain_name" class="" />
        <p>{{ mountain.description }}</p>
    </template>
    <template #footer>
      <UButton :to="'/mountain/' + mountain.mountain_id">
        Więcej
      </UButton>
    </template>
  </UCard>
</template>

