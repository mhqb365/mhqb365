<template>
  <div class="home">
    <section id="home" class="hero section-padding">
      <div class="container">
        <div class="hero-content">
          <div class="hero-text">
            <h1>
              <span style="color: #c778dd">Mai Hoàng Quốc Bảo</span>
              aka mhqb365
            </h1>
            <p class="policy-inline">
              <RouterLink to="/privacy.html">{{
                t("privacyPolicy")
              }}</RouterLink>
              <span aria-hidden="true"> • </span>
              <RouterLink to="/terms.html">{{
                t("termsOfService")
              }}</RouterLink>
            </p>
          </div>
          <div class="hero-image">
            <img src="/sua-may-dao.png" alt="Sửa máy đào" />
          </div>
        </div>
      </div>
    </section>

    <section id="projects" class="projects section-padding">
      <div class="container">
        <SectionTitle :title="sectionTitles.projects" />
        <div class="projects-list">
          <component
            v-for="project in featuredProjects"
            :key="project.liveUrl || project.route"
            class="project-row"
            :is="project.route ? 'RouterLink' : 'a'"
            :to="project.route"
            :href="project.liveUrl"
            :target="project.liveUrl ? '_blank' : undefined"
            :rel="project.liveUrl ? 'noopener noreferrer' : undefined"
          >
            <div class="project-main">
              <div class="project-title">{{ project.title }}</div>
              <div class="project-desc">{{ project.description }}</div>
            </div>
          </component>
        </div>
      </div>
    </section>

    <section id="skills" class="skills section-padding">
      <div class="container">
        <SectionTitle :title="sectionTitles.skills" />
        <div class="skills-grid">
          <SkillBox
            v-for="skill in skillsView"
            :key="skill.category"
            :category="skill.category"
            :skills="skill.items"
          />
        </div>
      </div>
    </section>

    <section id="about-me" class="about section-padding">
      <div class="container">
        <SectionTitle :title="sectionTitles.about" />
        <div class="about-content">
          <div class="about-text">
            <p v-for="line in aboutLines" :key="line">{{ line }}</p>
          </div>
        </div>
      </div>
    </section>

    <section id="contacts" class="contacts section-padding">
      <div class="container">
        <SectionTitle :title="sectionTitles.contacts" />
        <div class="contacts-content">
          <p>
            {{ contactIntro.text1.beforeLink }}
            <a
              class="doctor-laptop-link"
              :href="doctorLaptopUrl"
              target="_blank"
              rel="noopener noreferrer"
            >
              zalo.me/0908350179</a
            >{{ contactIntro.text1.afterLink }}
          </p>
          <div class="contact-box">
            <div class="contact-box-header">
              <p>
                {{ contactIntro.text2 }}
                <button
                  class="contact-toggle"
                  type="button"
                  :aria-expanded="showContactLinks"
                  :aria-label="contactToggleLabel"
                  aria-controls="contact-links"
                  @click="showContactLinks = !showContactLinks"
                >
                  <ChevronDown
                    :size="20"
                    :class="{ 'is-open': showContactLinks }"
                    aria-hidden="true"
                  />
                </button>
              </p>
            </div>
            <div
              v-show="showContactLinks"
              id="contact-links"
              class="contact-links"
            >
              <a
                href="https://t.me/mhqb365"
                target="_blank"
                rel="noopener noreferrer"
              >
                <MessageCircle :size="20" />
                t.me/mhqb365
              </a>
              <a
                href="https://zalo.me/0777180098"
                target="_blank"
                rel="noopener noreferrer"
              >
                <MessageCircle :size="20" />
                zalo.me/0777180098
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { computed, ref } from "vue";
import { ChevronDown, MessageCircle } from "lucide-vue-next";
import { RouterLink } from "vue-router";
import SectionTitle from "../components/SectionTitle.vue";
import SkillBox from "../components/SkillBox.vue";
import { useLang } from "../composables/useLang";

const { lang } = useLang();
const doctorLaptopUrl = "https://zalo.me/0908350179";
const showContactLinks = ref(false);

const dictionary = {
  sectionTitles: {
    projects: { vi: "dự án", en: "projects" },
    skills: { vi: "kỹ năng", en: "skills" },
    about: { vi: "thông tin", en: "about" },
    contacts: { vi: "liên hệ", en: "contact" },
  },
  aboutLines: [
    {
      vi: "Làm ở Doctor Laptop (01/06/2020 - hiện tại)",
      en: "Working at Doctor Laptop (01/06/2020 - present)",
    },
    {
      vi: "Làm ở Azsoft Mobile Service (03/2019 - 04/2020)",
      en: "Worked at Azsoft Mobile Service (03/2019 - 04/2020)",
    },
    {
      vi: "Làm ở Phồn Vinh Mobile (03/2017 - 12/2018)",
      en: "Worked at Phon Vinh Mobile (03/2017 - 12/2018)",
    },
    {
      vi: "Làm ở Khách sạn Hoài Phú (03/2016 - 02/2017)",
      en: "Worked at Hoai Phu Hotel (03/2016 - 02/2017)",
    },
  ],
  contactIntro: {
    text1: {
      vi: {
        beforeLink:
          "Nếu bạn cần sửa chữa laptop, mua linh kiện laptop, thì liên hệ",
        afterLink: "",
      },
      en: {
        beforeLink:
          "If you need to repair your laptop or buy replacement parts, please contact",
        afterLink: "",
      },
    },
    text2: {
      vi: "Nếu bạn có nhu cầu nghiên cứu, sửa chữa máy đào công suất nhỏ hoặc các mạch điện nhỏ và dư dả thời gian",
      en: "If you want to research or fix compact mining rigs or small electronic circuits and you have time available",
    },
  },
  privacyPolicy: { vi: "Chính sách bảo mật", en: "Privacy Policy" },
  termsOfService: { vi: "Điều khoản dịch vụ", en: "Terms of Service" },
};

const projects = [
  {
    title: {
      vi: "Đồ nghề hay dùng",
      en: "Recommended tools",
    },
    description: {
      vi: "Tổng hợp các món đồ mà tui hay dùng để sửa laptop và thiết bị điện tử",
      en: "A bundle of items I frequently use for electronics repair",
    },
    route: "/shopee.html",
  },
  {
    title: { vi: "Multi BoardViewer", en: "Multi BoardViewer" },
    description: {
      vi: "Xem nhiều boardview & schematic trong một ứng dụng",
      en: "View multiple boardviews & schematics in one app",
    },
    liveUrl: "https://github.com/mhqb365/MultiBoardViewer",
  },
  {
    title: { vi: "Auto Clear ME", en: "Auto Clear ME" },
    description: {
      vi: "Công cụ hỗ trợ clear ME BIOS 11+",
      en: "A tool to help clear ME BIOS 11+",
    },
    liveUrl: "https://github.com/mhqb365/AutoClearME",
  },
  {
    title: { vi: "Nexus Programmer", en: "Nexus Programmer" },
    description: {
      vi: "Công cụ nạp BIOS cho CH341/CH347 và XGecu T48",
      en: "Flashing BIOS application for CH341/CH347 and XGecu T48",
    },
    liveUrl: "https://github.com/mhqb365/NexusProgrammer",
  },
  {
    title: {
      vi: "Win Tool",
      en: "Win Tool",
    },
    description: {
      vi: "Công cụ Windows",
      en: "Windows tool",
    },
    liveUrl: "https://github.com/mhqb365/mhqb365/blob/master/scripts/README.md",
  },
  {
    title: { vi: "Computer Test App", en: "Computer Test App" },
    description: {
      vi: "Công cụ kiểm tra các chức năng cơ bản của máy tính",
      en: "Tool for testing basic computer functions",
    },
    liveUrl: "https://github.com/mhqb365/ComputerTestApp",
  },
  {
    title: {
      vi: "Chổi Lông Gà Bot",
      en: "ChoiLongGaBot",
    },
    description: {
      vi: "Bot Telegram hỗ trợ quản trị group/supergroup",
      en: "Telegram bot for group/supergroup management",
    },
    liveUrl: "https://github.com/mhqb365/ChoiLongGaBot",
  },
];

const t = (key) => dictionary[key][lang.value];

const sectionTitles = computed(() => ({
  projects: dictionary.sectionTitles.projects[lang.value],
  skills: dictionary.sectionTitles.skills[lang.value],
  about: dictionary.sectionTitles.about[lang.value],
  contacts: dictionary.sectionTitles.contacts[lang.value],
}));

const aboutLines = computed(() =>
  dictionary.aboutLines.map((line) => line[lang.value]),
);

const contactIntro = computed(() => ({
  text1: dictionary.contactIntro.text1[lang.value],
  text2: dictionary.contactIntro.text2[lang.value],
}));

const contactToggleLabel = computed(() => {
  if (lang.value === "vi") {
    return showContactLinks.value
      ? "Ẩn thông tin liên hệ"
      : "Hiện thông tin liên hệ";
  }

  return showContactLinks.value ? "Hide contact links" : "Show contact links";
});

const featuredProjects = computed(() =>
  projects.map((p) => ({
    ...p,
    title: p.title[lang.value],
    description: p.description[lang.value],
  })),
);

const skillsSource = [
  {
    category: { vi: "Sửa Laptop", en: "Laptop Repair" },
    items: [
      { vi: "Sửa bản lề,", en: "Hinge repair," },
      { vi: "Sửa mainboard,", en: "Mainboard repair," },
      { vi: "Thay thế linh kiện", en: "Parts replacement" },
    ],
  },
  {
    category: { vi: "Sửa Máy Đào", en: "Mining Rigs" },
    items: [
      { vi: "IceRiver,", en: "IceRiver," },
      { vi: "Goldshell", en: "Goldshell" },
    ],
  },
  {
    category: { vi: "Code", en: "Code" },
    items: [{ vi: "Vibe Coding", en: "Vibe Coding" }],
  },
];

const skillsView = computed(() =>
  skillsSource.map((s) => ({
    category: s.category[lang.value],
    items: s.items.map((i) => i[lang.value]),
  })),
);
</script>

<style scoped>
.hero {
  padding-top: 60px;
}

.hero-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 48px;
  align-items: center;
}

.hero-text h1 {
  font-size: 32px;
  margin: 0 0 32px 0;
  line-height: 1.45;
  word-wrap: break-word;
}

.hero-image {
  position: relative;
}

.hero-image img {
  width: 100%;
  height: auto;
}

.projects-list {
  display: grid;
  gap: 12px;
}

.project-row {
  cursor: pointer;
  display: grid;
  grid-template-columns: 1fr;
  gap: 6px;
  padding: 10px 12px;
  border: 1px solid var(--gray);
  background: rgba(255, 255, 255, 0.02);
  transition:
    transform 0.15s ease,
    box-shadow 0.15s ease,
    border-color 0.15s ease;
}

.project-title {
  font-weight: 700;
  font-size: 18px;
  color: var(--white);
  margin-bottom: 2px;
}

.project-desc {
  color: var(--gray);
  line-height: 1.5;
  font-size: 14px;
}

.project-meta {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 12px;
  flex-wrap: wrap;
}

.project-tag {
  border: 1px solid var(--gray);
  padding: 4px 8px;
  color: var(--gray);
  font-size: 13px;
}

.project-link {
  border: 1px solid var(--accent);
  padding: 6px 12px;
  color: var(--white);
  text-decoration: none;
}

.project-link:hover {
  background: rgba(199, 120, 221, 0.15);
}

.project-row:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.18);
  border-color: var(--accent);
}

.skills-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  gap: 16px;
}

.about-content {
  display: grid;
  grid-template-columns: 1fr;
  gap: 32px;
  max-width: 960px;
}

.about-text p {
  color: var(--gray);
  margin: 0 0 16px 0;
  line-height: 1.6;
}

.contacts-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 48px;
}

.contacts-content > p {
  color: var(--white);
  line-height: 1.6;
}

.doctor-laptop-link {
  color: var(--white);
  text-decoration: none;
}

.doctor-laptop-link:hover {
  color: var(--accent);
}

.contact-box {
  border: 1px solid var(--gray);
  padding: 16px;
}

.contact-box-header {
  display: block;
}

.contact-box-header p {
  margin: 0;
}

.contact-toggle {
  display: inline-flex;
  flex: 0 0 auto;
  align-items: center;
  justify-content: center;
  margin-left: 4px;
  padding: 2px;
  border: 0;
  color: var(--white);
  background: transparent;
  cursor: pointer;
  vertical-align: middle;
}

.contact-toggle:hover,
.contact-toggle:focus-visible {
  color: var(--accent);
}

.contact-toggle:focus-visible {
  outline: 1px solid var(--accent);
  outline-offset: 2px;
}

.contact-toggle svg {
  transition: transform 0.2s ease;
}

.contact-toggle svg.is-open {
  transform: rotate(180deg);
}

.contact-box h3 {
  margin: 0 0 16px 0;
  font-size: 16px;
  color: var(--white);
}

.contact-links {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-top: 16px;
}

.contact-links a {
  display: flex;
  align-items: center;
  gap: 8px;
  color: var(--gray);
  text-decoration: none;
  transition: color 0.3s;
}

.contact-links a:hover {
  color: var(--accent);
}

@media (max-width: 768px) {
  .hero {
    padding-top: 32px;
  }

  .hero-content,
  .about-content,
  .contacts-content {
    grid-template-columns: 1fr;
    gap: 32px;
  }

  .hero-text h1 {
    font-size: 18px;
    line-height: 1.4;
    margin: 0 0 20px 0;
  }

  .projects-list {
    gap: 12px;
  }

  .project-row {
    grid-template-columns: 1fr;
  }

  .skills-grid {
    grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
  }
}

.icon-hand-sm {
  display: none;
}

@media (max-width: 767px) {
  .icon-hand-md {
    display: none;
  }

  .icon-hand-sm {
    display: inline;
  }
}

@media (max-width: 480px) {
  .hero-text h1 {
    font-size: 14px;
  }

  .skills-grid {
    grid-template-columns: 1fr;
  }
}
</style>
