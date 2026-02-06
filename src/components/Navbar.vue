<template>
  <nav class="navbar">
    <div class="container navbar-content">
      <a href="/#home" class="logo" @click.prevent="scrollToSection('home')">
        <span class="text-accent">mhqb365.com</span>
      </a>

      <button
        class="mobile-menu-toggle"
        @click="toggleMenu"
        aria-label="Toggle menu"
      >
        <span class="hamburger-line"></span>
        <span class="hamburger-line"></span>
        <span class="hamburger-line"></span>
      </button>

      <div class="nav-links" :class="{ 'mobile-open': mobileMenuOpen }">
        <a
          href="/#home"
          class="nav-link"
          @click.prevent="scrollToSection('home')"
        >
          <span class="text-accent">#</span>{{ t("home") }}
        </a>
        <a
          href="/#projects"
          class="nav-link"
          @click.prevent="scrollToSection('projects')"
        >
          <span class="text-accent">#</span>{{ t("projects") }}
        </a>
        <a
          href="/#skills"
          class="nav-link"
          @click.prevent="scrollToSection('skills')"
        >
          <span class="text-accent">#</span>{{ t("skills") }}
        </a>
        <a
          href="/#about-me"
          class="nav-link"
          @click.prevent="scrollToSection('about-me')"
        >
          <span class="text-accent">#</span>{{ t("about") }}
        </a>
        <a
          href="/#contacts"
          class="nav-link"
          @click.prevent="scrollToSection('contacts')"
        >
          <span class="text-accent">#</span>{{ t("contact") }}
        </a>

        <div class="language-switcher">
          <button
            class="lang-btn"
            :class="{ active: lang === 'vi' }"
            @click="setLang('vi')"
          >
            VI
          </button>
          <span class="divider">|</span>
          <button
            class="lang-btn"
            :class="{ active: lang === 'en' }"
            @click="setLang('en')"
          >
            EN
          </button>
        </div>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { ref, computed } from "vue";
import { useRouter } from "vue-router";
import { useLang } from "../composables/useLang";

const router = useRouter();
const mobileMenuOpen = ref(false);
const { lang, setLang } = useLang();

const toggleMenu = () => {
  mobileMenuOpen.value = !mobileMenuOpen.value;
};

const closeMenu = () => {
  mobileMenuOpen.value = false;
};

const copy = computed(() => ({
  home: { vi: "trang chủ", en: "home" },
  projects: { vi: "dự án", en: "projects" },
  skills: { vi: "kỹ năng", en: "skills" },
  about: { vi: "thông tin", en: "about" },
  contact: { vi: "liên hệ", en: "contact" },
}));

const t = (key) => copy.value[key][lang.value];

const scrollToSection = (sectionId) => {
  closeMenu();

  if (router.currentRoute.value.path !== "/") {
    router.push("/").then(() => {
      setTimeout(() => {
        scrollToElement(sectionId);
      }, 100);
    });
  } else {
    scrollToElement(sectionId);
  }
};

const scrollToElement = (sectionId) => {
  const element = document.getElementById(sectionId);
  if (element) {
    const navbarHeight = 57; // Navbar height
    const elementPosition = element.getBoundingClientRect().top;
    const offsetPosition = elementPosition + window.pageYOffset - navbarHeight;

    window.scrollTo({
      top: offsetPosition,
      behavior: "smooth",
    });
  }
};
</script>

<style scoped>
.navbar {
  position: sticky;
  top: 0;
  background: var(--background);
  border-bottom: 1px solid var(--gray);
  z-index: 100;
  padding: 16px 0;
}

.navbar-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-size: 16px;
  font-weight: 700;
  color: var(--white);
  text-decoration: none;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 32px;
}

.nav-link {
  font-size: 16px;
  color: var(--gray);
  text-decoration: none;
  transition: color 0.3s;
}

.nav-link:hover {
  color: var(--white);
}

.nav-link.router-link-active {
  color: var(--white);
}

.language-switcher {
  display: flex;
  align-items: center;
  gap: 8px;
  color: var(--gray);
}

.lang-btn {
  background: transparent;
  border: none;
  color: var(--gray);
  cursor: pointer;
  font-size: 14px;
  padding: 2px 4px;
}

.lang-btn.active {
  color: var(--white);
  text-decoration: underline;
}

.divider {
  color: var(--gray);
}

.mobile-menu-toggle {
  display: none;
  flex-direction: column;
  gap: 4px;
  background: transparent;
  border: none;
  cursor: pointer;
  padding: 8px;
}

.hamburger-line {
  width: 24px;
  height: 2px;
  background: var(--white);
  transition: all 0.3s;
}

@media (max-width: 768px) {
  .logo {
    font-size: 14px;
  }

  .mobile-menu-toggle {
    display: flex;
  }

  .nav-links {
    position: fixed;
    top: 57px;
    right: -100%;
    width: 70%;
    max-width: 300px;
    height: calc(100vh - 57px);
    background: var(--background);
    border-left: 1px solid var(--gray);
    flex-direction: column;
    align-items: flex-start;
    padding: 24px;
    gap: 24px;
    transition: right 0.3s ease;
    overflow-y: auto;
  }

  .nav-links.mobile-open {
    right: 0;
  }

  .nav-link {
    font-size: 18px;
    width: 100%;
  }

  .language-switcher {
    margin-top: auto;
    padding-top: 24px;
    border-top: 1px solid var(--gray);
    width: 100%;
  }
}
</style>
