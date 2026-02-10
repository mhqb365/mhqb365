<template>
  <div class="home">
    <section id="home" class="hero section-padding">
      <div class="container">
        <div class="hero-content">
          <div class="hero-text">
            <h1>
              <span style="color: #c778dd">Mai Hoàng Quốc Bảo aka mhqb365</span>
              {{ t("heroTitle") }}
            </h1>
            <p class="policy-inline">
              <RouterLink to="/privacy.html">Privacy Policy</RouterLink>
              <span aria-hidden="true"> • </span>
              <RouterLink to="/terms.html">Terms of Service</RouterLink>
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
          <a
            v-for="project in featuredProjects"
            :key="project.id"
            class="project-row"
            :href="project.liveUrl"
            target="_blank"
            rel="noopener noreferrer"
          >
            <div class="project-main">
              <div class="project-title">{{ project.title }}</div>
              <div class="project-desc">{{ project.description }}</div>
            </div>
          </a>
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
            {{ contactIntro.text1 }}
            {{ contactIntro.text2 }}
            <span id="iconHand" class="icon-hand-md">👉</span>
            <span id="iconHand" class="icon-hand-sm">👇</span>
          </p>
          <div class="contact-box">
            <h3>{{ contactBoxTitle }}</h3>
            <div class="contact-links">
              <a href="https://t.me/mhqb365" target="_blank">
                <MessageCircle :size="20" />
                t.me/mhqb365
              </a>
              <a href="https://zalo.me/+84777180098" target="_blank">
                <MessageCircle :size="20" />
                zalo.me/+84777180098
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { computed } from "vue";
import { MessageCircle } from "lucide-vue-next";
import { RouterLink } from "vue-router";
import SectionTitle from "../components/SectionTitle.vue";
import SkillBox from "../components/SkillBox.vue";
import { useLang } from "../composables/useLang";

const { lang } = useLang();

const dictionary = {
  heroTitle: {
    vi: " - sửa laptop và máy đào công suất nhỏ",
    en: " - laptop repair and compact mining device",
  },
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
      vi: "Tui đang làm việc toàn thời gian ở Doctor Laptop, bạn cần sửa chữa laptop thì lên Google tìm Doctor Laptop.",
      en: "I work full-time at Doctor Laptop. If you need repair your laptop, just search for Doctor Laptop on Google.",
    },
    text2: {
      vi: "Nếu bạn có nhu cầu nghiên cứu, sửa chữa máy đào công suất nhỏ hoặc các mạch điện nhỏ mà không gấp thì",
      en: "If you want to research or fix compact mining rigs or small electronic circuits and it is not urgent",
    },
  },
  contactBoxTitle: { vi: "Gửi tin nhắn cho tui", en: "Message me" },
};

const projects = [
  {
    id: 1,
    title: {
      vi: "Link mua đồ nghề",
      en: "Recommended tools links",
    },
    description: {
      vi: "Tổng hợp các món đồ mà tui hay dùng",
      en: "A bundle of items I frequently use",
    },
    tech: ["Shopee"],
    liveUrl: "https://collshp.com/mhqb365",
  },
  {
    id: 2,
    title: { vi: "bBattery", en: "bBattery" },
    description: {
      vi: "Kiểm tra độ chai pin laptop Windows",
      en: "Check Windows laptop battery wear level",
    },
    tech: ["PowerShell"],
    liveUrl: "https://github.com/mhqb365/bbattery",
  },
  {
    id: 3,
    title: { vi: "Multi BoardViewer", en: "Multi BoardViewer" },
    description: {
      vi: "Xem nhiều boardview & schematic trong một ứng dụng",
      en: "View multiple boardviews & schematics in one app",
    },
    tech: ["Windows"],
    liveUrl: "https://github.com/mhqb365/Multi-BoardViewer",
  },
  {
    id: 4,
    title: { vi: "QR Station", en: "QR Station" },
    description: {
      vi: "Tạo QR thanh toán & thông báo nhận tiền với ESP32",
      en: "Generate payment QR and notify via ESP32",
    },
    tech: ["Hardware"],
    liveUrl: "https://github.com/mhqb365/QR-Station",
  },
  {
    id: 5,
    title: { vi: "Subscription Tracker", en: "Subscription Tracker" },
    description: {
      vi: "Quản lý và theo dõi các khoản đăng ký của các dịch vụ trong công việc và cuộc sống",
      en: "Manage and track your subscriptions in work and life",
    },
    tech: ["VueJS"],
    liveUrl: "https://sub-track.mhqb365.com",
  },
  {
    id: 6,
    title: { vi: "Bypass MDM Macbook", en: "Bypass MDM Macbook" },
    description: {
      vi: "Bypass Mobile Device Management trên Macbook",
      en: "Bypass Mobile Device Management on Macbook",
    },
    tech: ["Terminal"],
    liveUrl: "https://j2c.cc/mdm",
  },
  {
    id: 7,
    title: { vi: "Tính số lượng gạch", en: "Tile calculator" },
    description: {
      vi: "Tính toán số lượng gạch ốp tường ở Ecobig",
      en: "Calculate wall tile quantity for Ecobig",
    },
    tech: ["Chrome Extension"],
    liveUrl:
      "https://chromewebstore.google.com/detail/t%C3%ADnh-s%E1%BB%91-l%C6%B0%E1%BB%A3ng-g%E1%BA%A1ch/epfghdhidlpeeiajpgnemcobjalodfal",
  },
  {
    id: 8,
    title: { vi: "Tra cứu hóa đơn", en: "Invoice lookup" },
    description: {
      vi: "Tra cứu hóa đơn ở Doctor Laptop",
      en: "Invoice lookup at Doctor Laptop",
    },
    tech: ["Chrome Extension"],
    liveUrl:
      "https://chromewebstore.google.com/detail/tra-c%E1%BB%A9u-h%C3%B3a-%C4%91%C6%A1n-doctor-la/mjjboplmkbjegcfcdglkadcpeibfdhmb",
  },
  {
    id: 9,
    title: { vi: "Tra cứu bảo hành cá nhân", en: "Warranty lookup" },
    description: {
      vi: "Tra cứu bảo hành khi gửi sửa cá nhân",
      en: "Lookup warranty for personal repair orders",
    },
    tech: ["Website"],
    liveUrl: "https://repair.mhqb365.com",
  },
  {
    id: 10,
    title: { vi: "Hướng dẫn cài Win", en: "Windows install guide" },
    description: {
      vi: "Hướng dẫn tự cài Windows & Office tại nhà (sưu tầm)",
      en: "Windows & Office install guide (curated)",
    },
    tech: ["Windows"],
    liveUrl: "https://tranphu.gitbook.io/setup",
  },
  {
    id: 11,
    title: { vi: "Active Win & Office", en: "Activate Windows & Office" },
    description: {
      vi: "Active Windows & Office miễn phí (tin dùng)",
      en: "Free activation for Windows & Office (trusted)",
    },
    tech: ["PowerShell"],
    liveUrl: "https://massgrave.dev",
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

const contactBoxTitle = computed(() => dictionary.contactBoxTitle[lang.value]);

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
      { vi: "Sửa mainboard", en: "Mainboard repair" },
      { vi: "Thay thế linh kiện", en: "Parts replacement" },
      { vi: "Sửa bản lề", en: "Hinge repair" },
    ],
  },
  {
    category: { vi: "Sửa Máy Đào", en: "Mining Rigs" },
    items: [
      { vi: "IceRiver", en: "IceRiver" },
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
  color: var(--gray);
  line-height: 1.6;
}

.contact-box {
  border: 1px solid var(--gray);
  padding: 16px;
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
