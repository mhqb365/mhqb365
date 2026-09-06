<template>
  <div class="coffee-cat" :class="{ open: isOpen }">
    <button
      class="cat-button"
      type="button"
      :aria-expanded="isOpen"
      aria-label="Buy me a coffee"
      @click="isOpen = !isOpen"
    >
      <span class="cat-ear cat-ear-left"></span>
      <span class="cat-ear cat-ear-right"></span>
      <span class="cat-face">
        <span class="cat-eye"></span>
        <span class="cat-eye"></span>
        <span class="cat-nose"></span>
      </span>
      <span class="cat-paw"></span>
    </button>

    <div v-if="isOpen" class="coffee-popover">
      <div class="popover-head">
        <p>{{ t("title") }}</p>
        <button type="button" :aria-label="t('close')" @click="isOpen = false">
          x
        </button>
      </div>

      <div class="donation-tabs" aria-label="Donation options">
        <button
          v-for="option in donationOptions"
          :key="option.id"
          type="button"
          :class="{ active: option.id === selected.id }"
          @click="selectedId = option.id"
        >
          {{ option.label }}
        </button>
      </div>

      <div class="qr-frame" :class="{ loading: isQrLoading }">
        <div v-if="isQrLoading" class="qr-loading" aria-hidden="true">
          <span></span>
        </div>
        <img
          class="qr-image"
          :class="{ loaded: !isQrLoading }"
          :src="qrSrc"
          :alt="`QR donation ${selected.label}`"
          @load="isQrLoading = false"
          @error="isQrLoading = false"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed, ref, watch } from "vue";
import { donationOptions, getDonationOption } from "../data/donationOptions";
import { useLang } from "../composables/useLang";

const isOpen = ref(false);
const isQrLoading = ref(true);
const selectedId = ref(donationOptions[0].id);
const { lang } = useLang();

const dictionary = {
  title: {
    vi: "Nếu thấy các đóng góp của tui hữu ích, thì mời tui ly cafe đi!",
    en: "If you find my contributions useful, please buy me a coffee!",
  },
  close: { vi: "Đóng mã QR donation", en: "Close donation QR" },
};

const selected = computed(() => getDonationOption(selectedId.value));
const qrSrc = computed(
  () =>
    `https://api.qrserver.com/v1/create-qr-code/?size=220x220&margin=12&data=${encodeURIComponent(selected.value.value)}`,
);
const t = (key) => dictionary[key][lang.value];

watch(qrSrc, () => {
  isQrLoading.value = true;
});
</script>

<style scoped>
.coffee-cat {
  position: fixed;
  right: 0;
  bottom: 32px;
  z-index: 120;
}

.cat-button {
  position: relative;
  width: 76px;
  height: 70px;
  border: 0;
  background: transparent;
  cursor: pointer;
  transform: translateX(34px);
  animation: peek-cat 3.8s ease-in-out infinite;
}

.coffee-cat.open .cat-button,
.cat-button:hover {
  animation-play-state: paused;
  transform: translateX(8px);
}

.cat-face {
  position: absolute;
  inset: 12px 6px 2px 2px;
  display: flex;
  justify-content: center;
  gap: 14px;
  padding-top: 24px;
  border: 2px solid #f3d7a4;
  border-right: 0;
  border-radius: 30px 0 0 30px;
  background: #f0b95b;
  box-shadow: 0 8px 22px rgba(0, 0, 0, 0.28);
}

.cat-ear {
  position: absolute;
  top: 5px;
  z-index: 1;
  width: 24px;
  height: 24px;
  background: #f0b95b;
  border: 2px solid #f3d7a4;
  transform: rotate(45deg);
}

.cat-ear-left {
  left: 14px;
}

.cat-ear-right {
  left: 42px;
}

.cat-eye {
  width: 7px;
  height: 10px;
  border-radius: 50%;
  background: #282c33;
}

.cat-nose {
  position: absolute;
  left: 33px;
  top: 39px;
  width: 8px;
  height: 6px;
  border-radius: 50%;
  background: #8f3b5f;
}

.cat-paw {
  position: absolute;
  right: 2px;
  bottom: 0;
  width: 28px;
  height: 18px;
  border-radius: 16px 0 0 16px;
  background: #f3d7a4;
}

.coffee-popover {
  position: absolute;
  right: 16px;
  bottom: 82px;
  width: min(300px, calc(100vw - 32px));
  padding: 14px;
  border: 1px solid var(--accent);
  background: #282c33;
  box-shadow: 0 18px 46px rgba(0, 0, 0, 0.38);
}

.popover-head {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 12px;
}

.popover-head p {
  margin: 0;
  color: var(--white);
  font-family: var(--font-mono);
}

.popover-head button {
  border: 1px solid var(--gray);
  background: transparent;
  color: var(--gray);
  cursor: pointer;
}

.donation-tabs {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin: 14px 0;
}

.donation-tabs button {
  padding: 6px 10px;
  border: 1px solid rgba(171, 178, 191, 0.6);
  background: transparent;
  color: var(--gray);
  cursor: pointer;
}

.donation-tabs button.active,
.donation-tabs button:hover {
  border-color: var(--accent);
  color: var(--white);
}

.qr-frame {
  position: relative;
  width: 220px;
  max-width: 100%;
  aspect-ratio: 1;
  margin: 0 auto;
  padding: 10px;
  overflow: hidden;
  background: var(--white);
}

.qr-loading {
  position: absolute;
  inset: 10px;
  display: grid;
  place-items: center;
  background:
    linear-gradient(90deg, transparent, rgba(199, 120, 221, 0.18), transparent),
    repeating-linear-gradient(0deg, #f4f5f8 0 10px, #ffffff 10px 20px);
  background-size:
    160% 100%,
    100% 100%;
  animation: qr-shimmer 1.15s ease-in-out infinite;
}

.qr-loading span {
  width: 34px;
  height: 34px;
  border: 3px solid rgba(40, 44, 51, 0.16);
  border-top-color: var(--accent);
  border-radius: 50%;
  animation: qr-spin 0.75s linear infinite;
}

.qr-image {
  display: block;
  width: 100%;
  height: 100%;
  opacity: 0;
  object-fit: contain;
  transition: opacity 0.2s ease;
}

.qr-image.loaded {
  opacity: 1;
}

@keyframes qr-shimmer {
  0% {
    background-position:
      120% 0,
      0 0;
  }

  100% {
    background-position:
      -120% 0,
      0 0;
  }
}

@keyframes qr-spin {
  to {
    transform: rotate(360deg);
  }
}

@keyframes peek-cat {
  0%,
  42%,
  100% {
    transform: translateX(34px);
  }

  12%,
  28% {
    transform: translateX(8px);
  }
}

@media (max-width: 768px) {
  .coffee-cat {
    bottom: 28px;
  }
}
</style>
