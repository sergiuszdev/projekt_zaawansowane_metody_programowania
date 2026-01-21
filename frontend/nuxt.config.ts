// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ['@nuxt/ui', '@pinia/nuxt', "@nuxt/image"],


  runtimeConfig: {
    public: {
//       serverUrl: 'https://kgpserver1.vercel.app',
      serverUrl: 'http://localhost:8000',
//       clientUrl: 'https://koronagorpolskich.vercel.app'
      clientUrl: 'http://localhost:3000'
    }
  },

  // ui: {
  //   notifications: {
  //     position: 'top-0 bottom-auto'
  //   }
  // }
})