<script setup lang="ts">
const links = [{
  label: 'Odblokowane',
  icon: "i-heroicons-lock-open"
},
  {
    label: 'Do odblokowania',
    icon: "i-heroicons-lock-closed"
  }

]

const config = useRuntimeConfig();
const serverUrl = config.public.serverUrl;

const achievedAchievements = ref([]);
const notAchievedAchievements = ref([]);
const achievedCount = ref(0);
const totalAchievements = ref(0);

async function getAchievements() {
  try {
    const response = await fetch(`${serverUrl}/achievements/users_achievements`, {
    headers: {
    'Authorization': `Bearer ${localStorage.getItem("access_token")}`,
    'Accept': 'application/json'
  }
});

    if (response.status === 401) {
          throw new Error('Unauthorized');
        }
    const data = await response.json();
    achievedAchievements.value = data.achieved;
    notAchievedAchievements.value = data.not_achieved;
    achievedCount.value = data.achieved_count;
    totalAchievements.value = data.achieved_count + data.not_achieved_count;
  } catch (error) {
    if (error.message === 'Unauthorized') {
        try {
          const response = await fetch(`${serverUrl}/achievements/all`);
          const data = await response.json();
          achievedAchievements.value = [];
          notAchievedAchievements.value = data.achievements; 
          achievedCount.value = 0;
          totalAchievements.value = data.achievements.length;
          console.log(data);
        } catch (fetchError) {
          console.error('Error fetching all achievements:', fetchError);
        }
      }
      console.log(error);
    }
}

onMounted(() => {
  getAchievements();
});


</script>
<!--https://ui.nuxt.com/components/tabs#slots-->
<template>
  <div class="p-2.5 m-2.5">
    <h2>Twoje postępy: {{achievedCount}}/{{totalAchievements}}</h2>
    <UProgress :value="achievedCount" :max="totalAchievements"/>
  </div>
  <div class="flex justify-center">
    <div class="flex flex-col items-center w-5/6">
      <h3>Zdobyte osiągnięcia</h3>
      <AchievementCard 
        v-for="achievement in achievedAchievements" 
        :key="achievement.achievement_id" 
        :achievement="achievement" 
        :achieved="true" 
      />
      
      <h3>Niezdobyte osiągnięcia</h3>
      <AchievementCard v-for="achievement in notAchievedAchievements" 
        :key="achievement.achievement_id" 
        :achievement="achievement" 
        :achieved="false" 
      />
    </div>
  </div>
</template>

<style scoped>

</style>