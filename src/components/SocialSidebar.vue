<template>
  <div class="social-sidebar">
    <div class="line"></div>
    <div class="social-icons">
      <a href="https://www.tiktok.com/@mhqb365" target="_blank" rel="noopener noreferrer" class="social-link"
        title="TikTok">
        <TikTokIcon :size="24" />
      </a>
      <a href="https://www.youtube.com/@mhqb365" target="_blank" rel="noopener noreferrer" class="social-link"
        title="YouTube">
        <Youtube :size="24" />
      </a>
      <a href="https://github.com/mhqb365" target="_blank" rel="noopener noreferrer" class="social-link" title="GitHub">
        <Github :size="24" />
      </a>
    </div>
  </div>
</template>

<script setup>
import { Github, Youtube } from 'lucide-vue-next'
import TikTokIcon from './TikTokIcon.vue'
</script>

<style scoped>
.social-sidebar {
  position: fixed;
  left: 20px;
  top: 0;
  height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  z-index: 50;
}

.line {
  width: 1px;
  flex: 1;
  background: var(--gray);
}

.social-icons {
  display: flex;
  flex-direction: column;
  gap: 16px;
  padding: 20px 0;
}

.social-link {
  color: var(--gray);
  transition: color 0.3s;
}

.social-link:hover {
  color: var(--accent);
}

@media (max-width: 768px) {
  .social-sidebar {
    display: none;
  }
}
</style>
