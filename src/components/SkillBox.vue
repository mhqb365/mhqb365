<template>
  <div class="skill-box">
    <div class="skill-header">{{ category }}</div>
    <div class="skill-list">{{ skills.join(' ') }}</div>
  </div>
</template>

<script setup>
defineProps({
  category: {
    type: String,
    required: true
  },
  skills: {
    type: Array,
    required: true
  }
})
</script>

<style scoped>
.skill-box {
  border: 1px solid var(--gray);
}

.skill-header {
  padding: 8px;
  border-bottom: 1px solid var(--gray);
  font-weight: 600;
  color: var(--white);
}

.skill-list {
  padding: 8px;
  color: var(--gray);
  font-size: 14px;
}
</style>
