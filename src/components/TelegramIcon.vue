<template>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    :width="size"
    :height="size"
    viewBox="0 0 24 24"
    fill="currentColor"
  >
    <path
      d="M21.94 4.51 18.73 19.6c-.24 1.06-.88 1.32-1.78.82l-4.93-3.63-2.37 2.28c-.26.26-.48.48-.99.48l.35-5 9.11-8.23c.4-.35-.09-.55-.61-.2L6.25 13.21l-4.86-1.52c-1.05-.33-1.07-1.05.22-1.56L20.6 2.81c.88-.33 1.65.21 1.34 1.7z"
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
