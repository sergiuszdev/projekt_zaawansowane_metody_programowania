<script setup lang="ts">
const route = useRoute()
</script>

<template>
  <div class="flex flex-col h-screen">
    <div class="relative flex-1">
      <div class="absolute top-0 left-0 w-full h-full bg-cover bg-center" style="background-image: url('tatry_szlaki.jpeg');">
        <div class="absolute inset-0 bg-black opacity-30"></div>

        <div class="absolute inset-0 flex flex-col justify-center items-center text-center text-white">
          <h1 class="text-8xl font-bold mb-4">Korona Gór Polski</h1>
          <p class="text-lg max-w-lg mb-8">Witaj w naszej aplikacji poświęconej Koronie Gór Polski. Marzyłeś kiedyś o podbijaniu górskich szczytów? Nasza aplikacja przenosi twoją pasję do świata wirtualnego, oferując ci informacje o górskich szczytach oraz pozwala ci poznać osoby, które również łączy pasja do gór.</p>
        </div>
      </div>
    </div>

    <div class="text-white">
      <div class="mx-auto flex flex-col">
        <div class="flex justify-center flex-wrap text-center">
          <div class="max-w-sm mx-2">
            <h2 class="text-xl font-bold mb-2">Staw czoła wyzwaniom</h2>
            <p class="text-lg">Zdobywanie szczytów w naszej aplikacji to nie tylko przyjemność z eksploracji, ale także szansa na zdobycie unikalnych osiągnięć, które będą widoczne w Twoim profilu.</p>
          </div>
          <div class="max-w-sm mx-2">
            <h2 class="text-xl font-bold mb-2">Chwal się swoimi osiągnięciami</h2>
            <p class="text-lg">Czy uda Ci się zdobyć najwyższe szczyty Tatr? Czy pokonasz wszystkie szczyty w Sudetach? Spróbuj swoich sił i pnij się w rankingach.</p>
          </div>
          <div class="max-w-sm mx-2">
            <h2 class="text-xl font-bold mb-2">Dołącz do Społeczności Pasjonatów Gór</h2>
            <p class="text-lg">Dziel się swoimi wrażeniami z wypraw, wymieniaj się wskazówkami i inspiruj innych do odkrywania piękna polskich gór oraz miejsc wartych odwiedzenia, które mogą być mniej znane.</p>
          </div>
          <div class="max-w-sm mx-2">
            <h2 class="text-xl font-bold mb-2">Rozpocznij górską przygodę już dziś!</h2>
            <p class="text-lg">Nie zwlekaj - stwórz konto i rozpocznij swoją przygodę już dziś! Zdobywaj szczyty, odblokowuj osiągnięcia, uczestnicz w dyskusjach na forum oraz zdobądź bezcenne wspomnienia, które zostaną z Tobą na zawsze.</p>
          </div>
        </div>
        <nuxt-link to="/register" class="bg-primary-500 hover:bg-primary-600 text-black font-bold py-3 px-6 rounded-lg mt-8 mx-auto">Zapisz się już teraz!</nuxt-link>
      </div>
    </div>
  </div>
</template>

