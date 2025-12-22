<template>
  <div class="app-wrapper">
    <Navbar />
    <SocialSidebar />
    <main class="main-content">
      <router-view />
    </main>
    <Footer />
  </div>
</template>

<script setup>
import Navbar from './components/Navbar.vue'
import SocialSidebar from './components/SocialSidebar.vue'
import Footer from './components/Footer.vue'
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
