<script setup lang="ts">
import {onMounted} from "vue";

const items = [
  [{
    label: 'Zaloguj się',
    to: '/login'
  }],

  [{
    label: 'Zarejestruj się',
    to: '/register'

  }]
]

let isLogged = ref(false);
onMounted(() => {
  if (process.client) {
    isLogged.value = !!localStorage.getItem('access_token');
  }
});

function logout() {
  localStorage.setItem('access_token', '')
  localStorage.setItem('user_id', '')
  window.location.reload()
}
</script>

<template>
  <Title>Strona główna</Title>
<!--  TODO wymienić? na https://ui.nuxt.com/components/horizontal-navigation-->
  <div class="flex items-center justify-center p-3 m-3">
    <img src="/favicon.ico">
    <UButton to="/" class="ml-4">Strona główna</UButton>
    <UButton to="/mountains"  class="ml-4">Wszystkie szczyty</UButton>

    <UButton to="/user/collection"  class="ml-4">Kolekcja</UButton>
    <UButton to="/user/achievements"  class="ml-4">Osiągnięcia</UButton>
    <UButton to="/ranking" class="ml-4">Ranking</UButton>

    <div class="absolute right-2">
      <UDropdown v-if="!isLogged" :items="items" :popper="{ placement: 'bottom-start' }">
        <UButton color="white" label="Moje konto" trailing-icon="i-heroicons-chevron-down-20-solid" />
      </UDropdown>
      <UButton v-else @click="logout" to="/" class="ml-4">Wyloguj się</UButton>
    </div>



  </div>



</template>

<style scoped>

</style>