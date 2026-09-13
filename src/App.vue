<template>
  <SplashScreen v-if="isLoading" @loaded="handleSplashLoaded" />
  <div class="app-wrapper">
    <Navbar />
    <SocialSidebar />
    <BuyMeCoffeeCat v-if="showCoffeeWidget" />
    <main class="main-content">
      <router-view />
    </main>
    <Footer />
  </div>
</template>

<script setup>
import SplashScreen from "./components/SplashScreen.vue";
import Navbar from "./components/Navbar.vue";
import SocialSidebar from "./components/SocialSidebar.vue";
import BuyMeCoffeeCat from "./components/BuyMeCoffeeCat.vue";
import Footer from "./components/Footer.vue";
import { computed, ref } from "vue";
import { useRoute } from "vue-router";

const isLoading = ref(true);
const route = useRoute();
const showCoffeeWidget = computed(() => route.name !== "BuyMeACoffee");

const handleSplashLoaded = () => {
  isLoading.value = false;
};
</script>

<style>
.app-wrapper {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.main-content {
  flex: 1;
  padding-left: 60px;
}

@media (max-width: 768px) {
  .main-content {
    padding-left: 0;
  }
}
</style>
