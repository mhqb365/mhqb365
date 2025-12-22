<template>
  <div class="projects-page">
    <section class="section-padding">
      <div class="container">
        <div class="page-header">
          <h1><span class="text-accent">/</span>projects</h1>
          <p>List of my projects</p>
        </div>

        <div class="projects-section">
          <h2 class="category-title"><span class="text-accent">#</span>complete-apps</h2>
          <div class="projects-grid">
            <ProjectCard
              v-for="project in completeApps"
              :key="project.id"
              :project="project"
            />
          </div>
        </div>

        <div class="projects-section">
          <h2 class="category-title"><span class="text-accent">#</span>small-projects</h2>
          <div class="projects-grid">
            <ProjectCard
              v-for="project in smallProjects"
              :key="project.id"
              :project="project"
            />
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import ProjectCard from '../components/ProjectCard.vue'

const completeApps = ref([
  {
    id: 1,
    title: 'ChertNodes',
    description: 'Minecraft servers hosting',
    tech: ['HTML', 'SCSS', 'Python', 'Flask'],
    image: '/project_preview_1_1766333969542.png',
    liveUrl: 'https://example.com',
    githubUrl: 'https://github.com'
  },
  {
    id: 2,
    title: 'ProtectX',
    description: 'Discord anti-crash bot',
    tech: ['React', 'Express', 'Discord.js', 'Node.js'],
    image: '/project_preview_2_1766334000304.png',
    liveUrl: 'https://example.com'
  },
  {
    id: 3,
    title: 'Kahoot Answers Viewer',
    description: 'Get answers to your kahoot quiz',
    tech: ['CSS', 'Express', 'Node.js'],
    image: '/project_preview_3_1766334029717.png',
    githubUrl: 'https://github.com'
  }
])

const smallProjects = ref([
  {
    id: 4,
    title: 'Portfolio',
    description: 'You are here!',
    tech: ['Vue', 'Vite'],
    image: '/project_preview_1_1766333969542.png',
    githubUrl: 'https://github.com'
  },
  {
    id: 5,
    title: 'Pixel Perfect',
    description: 'Landing page for design agency',
    tech: ['HTML', 'CSS', 'JavaScript'],
    image: '/project_preview_2_1766334000304.png',
    liveUrl: 'https://example.com'
  }
])
</script>

<style scoped>
.page-header {
  margin-bottom: 48px;
}

.page-header h1 {
  font-size: 32px;
  margin: 0 0 16px 0;
}

.page-header p {
  color: var(--gray);
  margin: 0;
}

.projects-section {
  margin-bottom: 64px;
}

.category-title {
  font-size: 24px;
  margin: 0 0 32px 0;
}

.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 24px;
}

@media (max-width: 768px) {
  .page-header h1 {
    font-size: 24px;
  }

  .page-header p {
    font-size: 14px;
  }

  .category-title {
    font-size: 20px;
  }

  .projects-grid {
    grid-template-columns: 1fr;
  }

  .projects-section {
    margin-bottom: 48px;
  }
}

@media (max-width: 480px) {
  .page-header h1 {
    font-size: 20px;
  }

  .category-title {
    font-size: 18px;
  }
}
</style>
