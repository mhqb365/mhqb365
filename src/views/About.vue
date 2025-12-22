<template>
  <div class="about-page">
    <section class="section-padding">
      <div class="container">
        <div class="page-header">
          <h1><span class="text-accent">/</span>about-me</h1>
          <p>Who am I?</p>
        </div>

        <div class="about-content">
          <div class="about-text">
            <p>Hello, I'm Elias!</p>
            <p>
              I'm a self-taught front-end developer based in Kyiv, Ukraine. I can
              develop responsive websites from scratch and raise them into modern
              user-friendly web experiences.
            </p>
            <p>
              Transforming my creativity and knowledge into websites has been my
              passion for over a year. I have been helping various clients to
              establish their presence online. I always strive to learn about the
              newest technologies and frameworks.
            </p>
          </div>
          <div class="about-image">
            <div class="image-placeholder"></div>
          </div>
        </div>

        <div class="skills-section">
          <h2><span class="text-accent">#</span>skills</h2>
          <div class="skills-grid">
            <SkillBox
              v-for="skill in skills"
              :key="skill.category"
              :category="skill.category"
              :skills="skill.items"
            />
          </div>
        </div>

        <div class="fun-facts-section">
          <h2><span class="text-accent">#</span>my-fun-facts</h2>
          <div class="facts-grid">
            <div class="fact-item" v-for="(fact, index) in funFacts" :key="index">
              {{ fact }}
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import SkillBox from '../components/SkillBox.vue'

const skills = ref([
  {
    category: 'Languages',
    items: ['TypeScript', 'Lua', 'Python', 'JavaScript']
  },
  {
    category: 'Databases',
    items: ['SQLite', 'PostgreSQL', 'Mongo']
  },
  {
    category: 'Other',
    items: ['HTML', 'CSS', 'EJS', 'SCSS', 'REST', 'Jinja']
  },
  {
    category: 'Tools',
    items: ['VSCode', 'Figma', 'Font Awesome', 'Git']
  },
  {
    category: 'Frameworks',
    items: ['React', 'Vue', 'Disnake', 'Discord.js', 'Flask', 'Express.js']
  }
])

const funFacts = ref([
  'I like winter more than summer',
  'I often bike with my friends',
  'I like pizza and pasta',
  'I was in Egypt, Poland and Turkey',
  'My favorite movie is The Green Mile',
  'I am still in school',
  'I don\'t have any siblings'
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

.about-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 48px;
  margin-bottom: 80px;
}

.about-text p {
  color: var(--gray);
  margin: 0 0 16px 0;
  line-height: 1.6;
}

.image-placeholder {
  width: 100%;
  height: 400px;
  border: 1px solid var(--gray);
  background: rgba(199, 120, 221, 0.1);
}

.skills-section,
.fun-facts-section {
  margin-bottom: 64px;
}

.skills-section h2,
.fun-facts-section h2 {
  font-size: 24px;
  margin: 0 0 32px 0;
}

.skills-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 16px;
}

.facts-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 16px;
}

.fact-item {
  padding: 8px;
  border: 1px solid var(--gray);
  color: var(--gray);
}

@media (max-width: 768px) {
  .page-header h1 {
    font-size: 24px;
  }

  .page-header p {
    font-size: 14px;
  }

  .about-content {
    grid-template-columns: 1fr;
  }

  .image-placeholder {
    height: 250px;
  }

  .skills-section h2,
  .fun-facts-section h2 {
    font-size: 20px;
  }

  .facts-grid {
    grid-template-columns: 1fr;
  }

  .skills-grid {
    grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
  }
}

@media (max-width: 480px) {
  .page-header h1 {
    font-size: 20px;
  }

  .about-text p {
    font-size: 14px;
  }

  .skills-grid {
    grid-template-columns: 1fr;
  }
}
</style>
