<template>
  <div class="project-card">
    <div class="project-tech">
      {{ project.tech.join(' ') }}
    </div>
    <div class="project-content">
      <h3>{{ project.title }}</h3>
      <p>{{ project.description }}</p>
      <div class="project-links">
        <a v-if="project.liveUrl" :href="project.liveUrl" target="_blank" class="btn">
          Xem
        </a>

      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  project: {
    type: Object,
    required: true
  }
})
</script>

<style scoped>
.project-card {
  border: 1px solid var(--gray);
  display: flex;
  flex-direction: column;
  transition: transform 0.3s;
}

.project-card:hover {
  transform: translateY(-4px);
}

.project-image {
  width: 100%;
  height: 200px;
  overflow: hidden;
  border-bottom: 1px solid var(--gray);
}

.project-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.project-tech {
  padding: 8px;
  border-bottom: 1px solid var(--gray);
  font-size: 14px;
  color: var(--gray);
}

.project-content {
  padding: 16px;
  flex: 1;
  display: flex;
  flex-direction: column;
}

.project-content h3 {
  font-size: 24px;
  margin: 0 0 16px 0;
  color: var(--white);
}

.project-content p {
  color: var(--gray);
  margin: 0 0 16px 0;
  flex: 1;
}

.project-links {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
}
</style>
