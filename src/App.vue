<template>
  <SplashScreen v-if="isLoading" @loaded="handleSplashLoaded" />
  <div class="app-wrapper">
    <Navbar />
    <SocialSidebar />
    <main class="main-content">
      <router-view />
    </main>
    <Footer />
    <BuyMeACoffee />
  </div>
</template>

<script setup>
import SplashScreen from "./components/SplashScreen.vue";
import Navbar from "./components/Navbar.vue";
import SocialSidebar from "./components/SocialSidebar.vue";
import Footer from "./components/Footer.vue";
import BuyMeACoffee from "./components/BuyMeACoffee.vue";
import { ref } from "vue";

const isLoading = ref(true);

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
