<script setup lang="ts">

import type {FormSubmitEvent} from "#ui/types";
import {email, type Input, minLength, objectAsync, string} from "valibot";

const route = useRoute()

const schema = objectAsync({
  email: string([email('Niepoprawny email')]),
  password: string([])
})

type Schema = Input<typeof schema>

const state = reactive({
  email: '',
  password: ''
})
const config = useRuntimeConfig();

async function onSubmit(event: FormSubmitEvent<Schema>) {
  const serverUrl = config.public.serverUrl
  const toast = useToast()

  console.log(event.data)
  try {
    const result = await $fetch(`${serverUrl}/token`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: new URLSearchParams({
        username: event.data.email,
        password: event.data.password,
      }),
    });

    if (result.access_token) {
      toast.add({
        title: 'Sukces',
        description: 'Logowanie się udało.',
        type: 'success',
      });

      localStorage.setItem('access_token', result.access_token)
      localStorage.setItem('user_id', result.user_id)

      await navigateTo('/')
    }
  } catch (error) {
    console.error('Błąd:', error);
    toast.add({
      title: 'Nie udało się zalogować',
      description: 'Upewnij się, że podałeś poprawne dane logowania.',
      type: 'error',
    });
  }
}
</script>

<template>
  <div class="w-full flex justify-center mt-10">
    <div class="w-1/4">
      <UForm :schema="schema" :state="state" @submit="onSubmit" class="space-y-4">
        <UFormGroup label="Email" name="email">
          <UInput v-model="state.email" placeholder="Podaj swój email" icon="i-heroicons-envelope"></UInput>
        </UFormGroup>

        <UFormGroup label="Hasło" name="password">
          <UInput type="password" v-model="state.password" placeholder="Wpisz hasło" icon="i-heroicons-lock-closed"></UInput>
        </UFormGroup>

        <UButton type="submit">
          Zaloguj się
        </UButton>
      </UForm>
    </div>
  </div>
</template>
