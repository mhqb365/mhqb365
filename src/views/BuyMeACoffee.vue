<template>
  <div class="coffee-page section-padding">
    <div class="container">
      <div class="header-nav">
        <RouterLink to="/" class="back-link">
          <ArrowLeft :size="20" />
          {{ t("backToHome") }}
        </RouterLink>
      </div>

      <section class="coffee-layout">
        <div class="coffee-copy">
          <div class="title-line">
            <Coffee :size="28" />
            <h1>{{ t("title") }}</h1>
          </div>
          <p>{{ t("description") }}</p>

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
        </div>

        <div class="qr-panel border-box">
          <p class="selected-label">{{ selected.label }}</p>
          <div class="qr-frame">
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
          <!-- <p class="wallet-value">{{ selected.value }}</p> -->
        </div>
      </section>
    </div>
  </div>
</template>

<script setup>
import { computed, ref, watch } from "vue";
import { ArrowLeft, Coffee } from "lucide-vue-next";
import { donationOptions, getDonationOption } from "../data/donationOptions";
import { useLang } from "../composables/useLang";

const { lang } = useLang();
const selectedId = ref(donationOptions[0].id);
const isQrLoading = ref(true);

const dictionary = {
  backToHome: { vi: "Quay lại", en: "Back" },
  title: { vi: "mời tui ly cafe", en: "buy me a coffee" },
  description: {
    vi: "Nếu thấy các đóng góp của tui hữu ích, bạn có thể ủng hộ tui qua các hình thức sau",
    en: "If you find my contributions useful, you can support me with the following options",
  },
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
.coffee-page {
  padding-top: 60px;
}

.header-nav {
  margin-bottom: 32px;
}

.back-link {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  color: var(--gray);
  font-family: var(--font-mono);
  font-weight: 500;
  text-decoration: none;
  transition: color 0.3s ease;
}

.back-link:hover {
  color: var(--accent);
}

.coffee-layout {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 292px;
  gap: 40px;
  align-items: start;
}

.coffee-copy {
  display: grid;
  gap: 20px;
}

.title-line {
  display: flex;
  align-items: center;
  gap: 12px;
  color: var(--accent);
}

.title-line h1 {
  margin: 0;
  font-size: 32px;
  line-height: 1.25;
}

.coffee-copy p {
  max-width: 620px;
  margin: 0;
  color: var(--gray);
  line-height: 1.7;
}

.donation-tabs {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-top: 6px;
}

.donation-tabs button {
  padding: 8px 12px;
  border: 1px solid rgba(171, 178, 191, 0.6);
  background: transparent;
  color: var(--gray);
  cursor: pointer;
  font-family: var(--font-mono);
  transition:
    border-color 0.2s ease,
    color 0.2s ease,
    background 0.2s ease;
}

.donation-tabs button.active,
.donation-tabs button:hover {
  border-color: var(--accent);
  color: var(--white);
  background: rgba(199, 120, 221, 0.1);
}

.qr-panel {
  display: grid;
  justify-items: center;
  gap: 14px;
  background: rgba(255, 255, 255, 0.02);
}

.selected-label {
  margin: 0;
  color: var(--white);
  font-family: var(--font-mono);
}

.qr-frame {
  position: relative;
  width: 220px;
  max-width: 100%;
  aspect-ratio: 1;
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

.wallet-value {
  width: 100%;
  margin: 0;
  color: var(--gray);
  overflow-wrap: anywhere;
  text-align: center;
  font-size: 13px;
  line-height: 1.5;
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

@media (max-width: 768px) {
  .coffee-page {
    padding-top: 32px;
  }

  .coffee-layout {
    grid-template-columns: 1fr;
    gap: 28px;
  }

  .title-line h1 {
    font-size: 26px;
  }
}
</style>
