<script setup lang="ts">
import { ref, onMounted } from 'vue'

const config = useRuntimeConfig();
const serverUrl = config.public.serverUrl;

const route = useRoute();
const mountainData = ref();
const commentsData = ref([]);

async function getMountainById(id: string) {
  try {
    const response = await $fetch(`${serverUrl}/api/mountains/id/${id}`);
    mountainData.value = response.mountain;
    commentsData.value = response.comments;
    console.log(response);
  } catch (error) {
    console.error('Error:', error);
  }
}

onMounted(() => {
  const id = route.params.id as string;
  getMountainById(id);
})
</script>

<template>
  <div>
    <UDivider>Nazwa góry</UDivider>
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
      <USkeleton class="h-[150px] w-[550px]" :ui="{ rounded: 'rounded-full' }"/>
    </div>

    <div v-if="mountainData" class="p-2.5 m-2.5">
      <CommentInput :mountain_id="mountainData.mountain_id" />

    </div>

    <UDivider>Sekcja komentarzy</UDivider>
    <div class="p-2.5 m-2.5">
      <Comment v-for="comment in commentsData" :key="commentsData.comment_id" :comment="comment" />
    </div>
  </div>
</template>

