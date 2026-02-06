<template>
  <div class="section-title">
    <h2>
      <span class="text-accent">#</span>{{ title }}
    </h2>
    <div class="line"></div>
  </div>
</template>

<script setup>
defineProps({
  title: {
    type: String,
    required: true
  }
})
</script>

<style scoped>
.section-title {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 48px;
}

.section-title h2 {
  font-size: 32px;
  font-weight: 500;
  margin: 0;
  white-space: nowrap;
}

.line {
  flex: 1;
  height: 1px;
  background: var(--accent);
}

@media (max-width: 768px) {
  .section-title {
    margin-bottom: 32px;
  }

  .section-title h2 {
    font-size: 24px;
  }
}

@media (max-width: 480px) {
  .section-title {
    margin-bottom: 24px;
  }

  .section-title h2 {
    font-size: 20px;
  }
}
</style>
