<template>
  <footer class="footer">
    <div class="container">
      <div class="footer-content">
        <div class="footer-left">
          <div class="footer-logo">
            <span class="text-accent">mhqb365.com</span>
            <p>{{ tagline }}</p>
          </div>
        </div>
        <div class="footer-right">
          <div class="footer-block">
            <h3>{{ t("social") }}</h3>
            <div class="footer-social">
              <a
                href="https://www.tiktok.com/@mhqb365"
                target="_blank"
                rel="noopener noreferrer"
                title="TikTok"
              >
                <TikTokIcon :size="20" />
              </a>
              <a
                href="https://www.youtube.com/@mhqb365"
                target="_blank"
                rel="noopener noreferrer"
                title="YouTube"
              >
                <Youtube :size="20" />
              </a>
              <a
                href="https://github.com/mhqb365"
                target="_blank"
                rel="noopener noreferrer"
                title="GitHub"
              >
                <Github :size="20" />
              </a>
            </div>
          </div>
          <!-- <div class="footer-block">
            <h3>{{ t("legal") }}</h3>
            <div class="legal-links">
              <RouterLink to="/privacy.html">{{ t("privacy") }}</RouterLink>
              <RouterLink to="/terms.html">{{ t("terms") }}</RouterLink>
            </div>
          </div> -->
        </div>
      </div>
      <div class="footer-bottom">
        <p>{{ copyright }}</p>
      </div>
    </div>
  </footer>
</template>

<script setup>
import { Github, Youtube } from "lucide-vue-next";
import TikTokIcon from "./TikTokIcon.vue";
import { computed } from "vue";
import { useLang } from "../composables/useLang";

const { lang } = useLang();

const copy = {
  tagline: {
    vi: "sửa laptop nhưng thích vibe coding",
    en: "laptop repair but loves vibe coding",
  },
  social: { vi: "Mạng xã hội", en: "Social" },
  legal: { vi: "Pháp lý", en: "Legal" },
  privacy: { vi: "Quyền riêng tư", en: "Privacy policy" },
  terms: { vi: "Điều khoản dịch vụ", en: "Terms of service" },
  copyright: {
    vi: "© 2026. Tạo bởi Antigravity & tui. Mẫu bởi EliasDevis",
    en: "© 2026. Created by Antigravity & me. Template by EliasDevis",
  },
};

const t = (key) => copy[key][lang.value];
const tagline = computed(() => t("tagline"));
const copyright = computed(() => t("copyright"));
</script>

<style scoped>
.footer {
  border-top: 1px solid var(--gray);
  padding: 32px 0;
  margin-top: 80px;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 48px;
  gap: 32px;
}

.footer-left {
  flex: 1;
}

.footer-right {
  display: flex;
  gap: 40px;
  flex-wrap: wrap;
  align-items: flex-start;
}

.footer-block {
  min-width: 180px;
}

.footer-logo {
  font-weight: 700;
  font-size: 16px;
}

.footer-logo p {
  margin: 8px 0 0 0;
  color: var(--gray);
  font-size: 14px;
  font-weight: 400;
}

.footer-right h3 {
  font-size: 24px;
  margin: 0 0 12px 0;
}

.footer-social {
  display: flex;
  gap: 16px;
}

.footer-social a {
  color: var(--gray);
  transition: color 0.3s;
}

.footer-social a:hover {
  color: var(--accent);
}

.legal-links {
  display: grid;
  gap: 8px;
}

.legal-links a {
  color: var(--gray);
}

.legal-links a:hover {
  color: var(--white);
}

.footer-bottom {
  text-align: center;
  padding-top: 32px;
  border-top: 1px solid var(--gray);
}

.footer-bottom p {
  margin: 0;
  color: var(--gray);
  font-size: 14px;
}

@media (max-width: 768px) {
  .footer {
    padding: 24px 0;
    margin-top: 48px;
  }

  .footer-content {
    flex-direction: column;
    margin-bottom: 32px;
  }

  .footer-right {
    width: 100%;
  }

  .footer-logo {
    font-size: 14px;
  }

  .footer-right h3 {
    font-size: 20px;
  }

  .footer-bottom p {
    font-size: 12px;
  }
}

@media (max-width: 480px) {
  .footer-logo p {
    font-size: 12px;
  }

  .footer-right h3 {
    font-size: 18px;
  }
}
</style>
