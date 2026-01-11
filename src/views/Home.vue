<template>
  <div class="home">
    <section id="home" class="hero section-padding">
      <div class="container">
        <div class="hero-content">
          <div class="hero-text">
            <h1>
              Mai Hoàng Quốc Bảo aka mhqb365 -
              <span class="text-accent">sửa laptop</span> và
              <span class="text-accent">máy đào công suất nhỏ</span>
            </h1>
          </div>
          <div class="hero-image">
            <img src="/sua-may-dao.png" alt="Sửa Máy Đào" />
          </div>
        </div>
      </div>
    </section>

    <section id="projects" class="projects section-padding">
      <div class="container">
        <SectionTitle title="dự án" />
        <div class="projects-grid">
          <ProjectCard
            v-for="project in featuredProjects"
            :key="project.id"
            :project="project"
          />
        </div>
      </div>
    </section>

    <section id="skills" class="skills section-padding">
      <div class="container">
        <SectionTitle title="kỹ năng" />
        <div class="skills-grid">
          <SkillBox
            v-for="skill in skills"
            :key="skill.category"
            :category="skill.category"
            :skills="skill.items"
          />
        </div>
      </div>
    </section>

    <section id="about-me" class="about section-padding">
      <div class="container">
        <SectionTitle title="thông tin" />
        <div class="about-content">
          <div class="about-text">
            <p>Làm ở Doctor Laptop (01/06/2020 - hiện tại)</p>
            <p>Làm ở Azsoft Mobile Service (03/2019 - 04/2020)</p>
            <p>Làm ở Phồn Vinh Mobile (03/2017 - 12/2018)</p>
            <p>Làm ở Khách sạn Hoài Phú (03/2016 - 02/2017)</p>
          </div>
        </div>
      </div>
    </section>

    <section id="contacts" class="contacts section-padding">
      <div class="container">
        <SectionTitle title="liên hệ" />
        <div class="contacts-content">
          <p>
            Tui đang làm việc toàn thời gian ở Doctor Laptop, bạn cần sửa chữa
            laptop thì lên Google tìm
            <a
              href="https://www.google.com/search?q=Doctor+Laptop"
              target="_blank"
              style="color: white"
            >
              Doctor Laptop
            </a>
            nhé. Nếu có nhu cầu nghiên cứu sữa chữa máy đào hoặc những mạch điện
            nhỏ mà không quan trọng thời gian thì
            <span id="iconHand" class="icon-hand-md">👉</span>
            <span id="iconHand" class="icon-hand-sm">👇</span>
          </p>
          <div class="contact-box">
            <h3>Gửi tin nhắn cho tui</h3>
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
import { ref } from "vue";
import { MessageCircle } from "lucide-vue-next";
import SectionTitle from "../components/SectionTitle.vue";
import ProjectCard from "../components/ProjectCard.vue";
import SkillBox from "../components/SkillBox.vue";

const featuredProjects = ref([
  {
    id: 1,
    title: "Link mua đồ nghề",
    description: "Tổng hợp các món đồ mà tui hay dùng",
    tech: ["Shopee"],
    liveUrl: "/shopee",
  },
  {
    id: 2,
    title: "bBattery",
    description: "Kiểm tra độ chai pin laptop Windows",
    tech: ["PowerShell"],
    liveUrl: "https://github.com/mhqb365/bbattery",
  },
  {
    id: 3,
    title: "Multi BoardViewer",
    description: "Xem nhiều boardview & schematic trong một ứng dụng",
    tech: ["Windows"],
    liveUrl: "https://github.com/mhqb365/Multi-BoardViewer",
  },
  {
    id: 4,
    title: "Bypass MDM Macbook",
    description: "Bypass Mobile Device Management trên Macbook",
    tech: ["Terminal"],
    liveUrl: "https://j2c.cc/mdm",
  },
  {
    id: 5,
    title: "Tính số lượng gạch",
    description: "Tính toán số lượng gạch ốp tường ở Ecobig",
    tech: ["Chrome Extension"],
    liveUrl:
      "https://chromewebstore.google.com/detail/t%C3%ADnh-s%E1%BB%91-l%C6%B0%E1%BB%A3ng-g%E1%BA%A1ch/epfghdhidlpeeiajpgnemcobjalodfal",
  },
  {
    id: 6,
    title: "Tra cứu hóa đơn",
    description: "Tra cứu hóa đơn ở Doctor Laptop",
    tech: ["Chrome Extension"],
    liveUrl:
      "https://chromewebstore.google.com/detail/tra-c%E1%BB%A9u-h%C3%B3a-%C4%91%C6%A1n-doctor-la/mjjboplmkbjegcfcdglkadcpeibfdhmb",
  },
  {
    id: 7,
    title: "Tra cứu BH cá nhân",
    description: "Tra cứu bảo hành khi gửi sửa cá nhân",
    tech: ["Website"],
    liveUrl: "https://repair.mhqb365.com",
  },
  {
    id: 8,
    title: "Hướng dẫn cài Win",
    description: "Hướng dẫn tự cài Windows & Office tại nhà (sưu tầm)",
    tech: ["Windows"],
    liveUrl: "https://tranphu.gitbook.io/setup",
  },
  {
    id: 9,
    title: "Active Win & Office",
    description: "Active Windows & Office miễn phí (tin dùng)",
    tech: ["PowerShell"],
    liveUrl: "https://massgrave.dev",
  },
]);

const skills = ref([
  {
    category: "Sửa Laptop",
    items: ["Thay Linh Kiện", "Sửa Main Board", "Sửa Bản Lề"],
  },
  {
    category: "Sửa Máy Đào",
    items: ["IceRiver", "Goldshell"],
  },
  {
    category: "Code",
    items: ["Vibe Coding"],
  },
]);

const scrollToElement = (id) => {
  const element = document.getElementById(id);
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
  line-height: 1.5;
  word-wrap: break-word;
}

.hero-text p {
  color: var(--gray);
  margin: 0 0 24px 0;
}

.hero-image {
  position: relative;
}

.hero-image img {
  width: 100%;
  height: auto;
}

.status-badge {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px;
  border: 1px solid var(--gray);
  margin-top: 16px;
  font-size: 14px;
}

.status-dot {
  width: 16px;
  height: 16px;
  background: var(--accent);
  display: inline-block;
}

.quote-section {
  padding: 60px 0;
}

.quote-box {
  border: 1px solid var(--gray);
  padding: 32px;
  position: relative;
}

.quote-box::before {
  content: '"';
  position: absolute;
  top: -20px;
  left: 16px;
  font-size: 60px;
  color: var(--white);
  background: var(--background);
  padding: 0 8px;
}

.quote-box::after {
  content: '"';
  position: absolute;
  bottom: -20px;
  right: 16px;
  font-size: 60px;
  color: var(--white);
  background: var(--background);
  padding: 0 8px;
}

.quote-text {
  margin: 0 0 16px 0;
  color: var(--white);
  font-size: 24px;
  word-wrap: break-word;
}

.quote-author {
  margin: 0;
  color: var(--gray);
  text-align: right;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.view-all {
  color: var(--white);
  text-decoration: none;
  transition: color 0.3s;
}

.view-all:hover {
  color: var(--accent);
}

.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 24px;
}

.skills-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  gap: 16px;
}

.about-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 48px;
}

.about-text p {
  color: var(--gray);
  margin: 0 0 16px 0;
  line-height: 1.6;
}

.about-text .btn {
  margin-top: 16px;
}

.image-placeholder {
  width: 100%;
  height: 400px;
  border: 1px solid var(--gray);
  background: rgba(199, 120, 221, 0.1);
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
    font-size: 20px;
    line-height: 1.4;
    margin: 0 0 20px 0;
  }

  .hero-text p {
    font-size: 14px;
    margin: 0 0 20px 0;
  }

  .status-badge {
    font-size: 12px;
    padding: 6px;
  }

  .quote-section {
    padding: 40px 0;
  }

  .quote-box {
    padding: 20px;
  }

  .quote-box::before,
  .quote-box::after {
    font-size: 40px;
  }

  .quote-text {
    font-size: 16px;
  }

  .quote-author {
    font-size: 14px;
  }

  .section-padding {
    padding: 48px 0;
  }

  .section-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 16px;
  }

  .projects-grid {
    grid-template-columns: 1fr;
  }

  .skills-grid {
    grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
  }

  .image-placeholder {
    height: 250px;
  }

  .contact-box {
    padding: 12px;
  }

  .contact-links a {
    font-size: 14px;
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
    font-size: 18px;
  }

  .quote-text {
    font-size: 14px;
  }

  .skills-grid {
    grid-template-columns: 1fr;
  }
}
</style>
