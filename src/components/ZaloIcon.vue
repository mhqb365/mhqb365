<template>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    :width="size"
    :height="size"
    viewBox="0 0 24 24"
    fill="none"
    aria-hidden="true"
  >
    <path
      d="M5.5 4h13A2.5 2.5 0 0 1 21 6.5v8A2.5 2.5 0 0 1 18.5 17h-5.8L8 20v-3H5.5A2.5 2.5 0 0 1 3 14.5v-8A2.5 2.5 0 0 1 5.5 4z"
      stroke="currentColor"
      stroke-width="1.8"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M6.6 8.6h5.1l-3.1 5.2h3.2m1.1 0 2.3-5.2 2.3 5.2m-3.7-1.4h2.8"
      stroke="currentColor"
      stroke-width="1.55"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
  </svg>
</template>

<script setup>
defineProps({
  size: {
    type: Number,
    default: 24,
  },
});
</script>
