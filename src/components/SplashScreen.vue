<template>
    <Transition name="splash-fade">
        <div v-if="visible" class="splash-screen">
            <div class="splash-content">
                <!-- Logo -->
                <div class="splash-logo">
                    <div class="logo-wrapper">
                        <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="100" cy="100" r="80" fill="none" stroke="currentColor" stroke-width="4"
                                class="logo-circle" />
                            <path d="M70 100 L90 120 L130 80" fill="none" stroke="currentColor" stroke-width="6"
                                stroke-linecap="round" stroke-linejoin="round" class="logo-check" />
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </Transition>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const visible = ref(true)
const emit = defineEmits(['loaded'])

onMounted(() => {
    // Simulate loading time (minimum 1.5 seconds)
    const minLoadTime = 1500
    const startTime = Date.now()

    // Wait for all resources to load
    Promise.all([
        // Wait for DOM content to be loaded
        new Promise((resolve) => {
            if (document.readyState === 'complete') {
                resolve()
            } else {
                window.addEventListener('load', resolve)
            }
        }),
        // Minimum loading time
        new Promise((resolve) => setTimeout(resolve, minLoadTime)),
    ]).then(() => {
        const elapsedTime = Date.now() - startTime
        const remainingTime = Math.max(0, minLoadTime - elapsedTime)

        setTimeout(() => {
            visible.value = false
            setTimeout(() => {
                emit('loaded')
            }, 500) // Wait for fade out animation
        }, remainingTime)
    })
})
</script>

<style scoped lang="scss">
.splash-screen {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: #282c33;
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
  overflow: hidden;
}

.splash-content {
  position: relative;
  text-align: center;
  color: white;
  z-index: 1;
}

.splash-logo {
  margin-bottom: 0; /* Updated from 2rem to 0 since title is gone */
  animation: pulse 2s ease-in-out infinite;

  .logo-wrapper {
    width: 100px;
    height: 100px;
    margin: 0 auto;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    backdrop-filter: blur(10px);
    
    svg {
      width: 60px;
      height: 60px;
      color: white;
    }
  }

  .logo-circle {
    animation: draw-circle 2s ease-in-out infinite;
  }

  .logo-check {
    animation: draw-check 2s ease-in-out infinite;
    animation-delay: 0.5s;
  }
}

// Animations
@keyframes pulse {
  0%,
  100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.05);
  }
}

@keyframes draw-circle {
  0%,
  100% {
    stroke-dasharray: 0 500;
  }
  50% {
    stroke-dasharray: 500 500;
  }
}

@keyframes draw-check {
  0%,
  100% {
    stroke-dasharray: 0 100;
  }
  50% {
    stroke-dasharray: 100 100;
  }
}

// Transition
.splash-fade-enter-active {
  transition: opacity 0.3s ease;
}

.splash-fade-leave-active {
  transition: opacity 0.5s ease;
}

.splash-fade-enter-from,
.splash-fade-leave-to {
  opacity: 0;
}
</style>
