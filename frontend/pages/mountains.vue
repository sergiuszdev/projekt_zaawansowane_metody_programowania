<script setup lang="ts">
import { ref, onMounted } from 'vue';
import MountainCard from '~/components/MountainCard.vue';
const config = useRuntimeConfig();
const serverUrl = config.public.serverUrl;

const mountains = ref([]);

async function getMountains() {
  try {
    const response = await fetch(`${serverUrl}/api/mountains/`);
    const data = await response.json();
    mountains.value = data.mountains;
    console.log(mountains.value)
  } catch (error) {
    console.error('Error fetching mountains:', error);
  }
}

onMounted(() => {
  getMountains();
});
</script>

<template>
  <!-- https://ui.nuxt.com/components/progress -->
  <!-- https://ui.nuxt.com/components/skeleton to można dodać aby był placeholder w trakcie pobierania danych -->
  <!-- https://ui.nuxt.com/components/notification -->
  <div class="overflow-x-auto flex flex-wrap justify-items-center justify-center">
    <MountainCard v-for="mountain in mountains" :key="mountain.mountain_id" :mountain="mountain" />
  </div>
</template>

<style scoped>
</style>
