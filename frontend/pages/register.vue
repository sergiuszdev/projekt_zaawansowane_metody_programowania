<script setup lang="ts">

import type {FormSubmitEvent} from "#ui/types";
import {object, custom, forward, email, type Input, minLength, objectAsync, string, ValiError, customAsync,} from "valibot";


const schema = objectAsync({
  email: string([email('Niepoprawny email')]),
  password: string([minLength(8, "Hasło powinno mieć minimum 8 znaków")]),
  username: string([minLength(3, "Nazwa musi się składać z ponad trzech znaków")]),
  repeatPassword: string([minLength(1, 'Powtórz hasło')])
    },
    [
      forward(
          custom((input) => {
            return input.password === input.repeatPassword;
          }, 'Hasła się od siebie różnią'),
          ['repeatPassword']
      ),
    ]
)

type Schema = Input<typeof schema>
const toast = useToast()

const state = reactive({
  email: '',
  password: '',
  repeatPassword: '',
  username: ''
})
const config = useRuntimeConfig();

async function onSubmit(event: FormSubmitEvent<Schema>) {
  console.log(event.data)

  const serverUrl = config.public.serverUrl
  const clientUrl = config.public.clientUrl
  const toast = useToast()

  try {
    let result = await $fetch(`${serverUrl}/register`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        username: event.data.username,
        email: event.data.email,
        password: event.data.password,
        repeat_password: event.data.repeatPassword
      }),
      mode: 'cors'
    })

    if (result['status'] === 'success') {
      await navigateTo(`${clientUrl}/login`, { external: true })
    } else {
      toast.add({
        title: 'Wystąpił błąd',
        description: 'Nie udało się stworzyć nowego konta.',
        type: 'error'
      })
    }
  } catch (error) {
    console.error('Error:', error)
    toast.add({
      title: 'Błąd',
      description: 'Wystąpił błąd podczas rejestracji. Spróbuj ponownie.',
      type: 'error'
    })
  }
}

</script>

<template>
  <div class="w-full flex justify-center mt-10">
    <div class="w-1/4">
      <UForm :schema="schema" :state="state" @submit="onSubmit" class="space-y-4">
        <UFormGroup label="Nazwa użytkownika" name="username">
          <UInput v-model="state.username" placeholder="Podaj swoją nazwę" icon="i-heroicons-user"></UInput>
        </UFormGroup>
        <UFormGroup label="Email" name="email">
          <UInput v-model="state.email" placeholder="Podaj swój email" icon="i-heroicons-envelope"></UInput>
        </UFormGroup>

        <UFormGroup label="Hasło" name="password">
          <UInput type="password" v-model="state.password" placeholder="Wpisz hasło" icon="i-heroicons-lock-closed"></UInput>
        </UFormGroup>

        <UFormGroup label="Powtórz hasło" name="repeatPassword">
          <UInput type="password" v-model="state.repeatPassword" placeholder="Powtórz hasło" icon="i-heroicons-check-circle"></UInput>
        </UFormGroup>

        <UButton type="submit">
          Stwórz konto
        </UButton>

      </UForm>
    </div>
  </div>
</template>
