<template>
  <div class="buy-me-coffee-page">
    <div class="container">
      <SectionTitle :title="t('title')" />
      <div class="content-wrapper">
        <p class="intro-text">
          {{ t("intro") }}
        </p>

        <div class="qr-container">
          <img
            src="https://img.vietqr.io/image/vietcombank-1057930000-compact.jpg"
            alt="Mã QR Vietcombank"
            class="qr-image"
          />
        </div>

        <div class="bank-details">
          <div class="detail-row">
            <span class="label">{{ t("bank") }}:</span>
            <span class="value">Vietcombank</span>
          </div>
          <div class="detail-row">
            <span class="label">{{ t("accountName") }}:</span>
            <span class="value">MAI HOANG QUOC BAO</span>
          </div>
          <div class="detail-row">
            <span class="label">{{ t("accountNumber") }}:</span>
            <span class="value">1057930000</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from "vue";
import { useLang } from "../composables/useLang";
import SectionTitle from "../components/SectionTitle.vue";

const { lang } = useLang();

const translations = {
  title: {
    vi: "Mời tui một ly cà phê",
    en: "Buy me a coffee",
  },
  intro: {
    vi: "Nếu bạn thấy các dự án hoặc nội dung của tui hữu ích, bạn có thể ủng hộ tui một ly cà phê nhé. Cảm ơn bạn rất nhiều!",
    en: "If you find my projects or content useful, consider buying me a coffee. Thank you so much!",
  },
  bank: {
    vi: "Ngân hàng",
    en: "Bank",
  },
  accountName: {
    vi: "Chủ tài khoản",
    en: "Account Name",
  },
  accountNumber: {
    vi: "Số tài khoản",
    en: "Account Number",
  },
};

const t = (key) => computed(() => translations[key][lang.value]).value;
</script>

<style scoped>
.buy-me-coffee-page {
  padding: 80px 0;
  display: flex;
  justify-content: center;
}

.content-wrapper {
  max-width: 600px;
  margin: 0 auto;
  text-align: center;
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid var(--gray);
  padding: 40px;
  border-radius: 12px;
}

.intro-text {
  color: var(--gray);
  line-height: 1.6;
  margin-bottom: 32px;
}

.qr-container {
  display: flex;
  justify-content: center;
  margin-bottom: 32px;
}

.qr-image {
  max-width: 100%;
  width: 300px;
  height: auto;
  border-radius: 8px;
  background: var(--white);
  padding: 16px;
}

.bank-details {
  text-align: left;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  padding-top: 24px;
}

.detail-row {
  display: flex;
  justify-content: space-between;
  margin-bottom: 12px;
  padding-bottom: 12px;
  border-bottom: 1px dashed rgba(255, 255, 255, 0.1);
}

.detail-row:last-child {
  border-bottom: none;
  margin-bottom: 0;
  padding-bottom: 0;
}

.label {
  color: var(--gray);
  font-weight: 500;
}

.value {
  color: var(--white);
  font-weight: bold;
  font-family: var(--font-mono);
}

@media (max-width: 768px) {
  .buy-me-coffee-page {
    padding: 40px 0;
  }

  .content-wrapper {
    padding: 24px;
  }

  .detail-row {
    flex-direction: column;
    gap: 4px;
  }
}
</style>
