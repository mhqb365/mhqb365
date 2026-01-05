<template>
  <div class="shopee-page">
    <div class="container">
      <header class="page-header">
        <router-link to="/" class="back-link">
          <ArrowLeft :size="20" />
          Quay lại #trang chủ
        </router-link>
        <div class="header-content">
          <h1><span class="text-accent">Đồ nghề</span> tui xài</h1>
          <p>
            Dưới đây là danh sách những món đồ nghề, linh kiện mà tôi thường
            xuyên sử dụng và tin dùng
          </p>
        </div>
      </header>

      <div class="products-grid">
        <div v-for="product in products" :key="product.id" class="product-card">
          <div class="product-image">
            <img
              :src="product.image"
              :alt="product.name"
              @error="handleImageError"
            />
            <div class="product-category">{{ product.category }}</div>
          </div>
          <div class="product-info">
            <h3>{{ product.name }}</h3>
            <p>{{ product.description }}</p>
            <div class="product-footer">
              <span class="price">{{ product.price }}</span>
              <a :href="product.url" target="_blank" class="btn">Mua ngay</a>
            </div>
          </div>
        </div>
      </div>

      <div class="links-section">
        <div class="links-grid">
          <a
            v-for="link in quickLinks"
            :key="link.id"
            :href="link.url"
            target="_blank"
            class="quick-link"
          >
            {{ link.name }}
          </a>
        </div>
      </div>

      <div class="shopee-footer">
        <p>Nếu muốn xem toàn bộ danh mục đồ nghề tui xài thì ghé đây 👇</p>
        <a
          href="https://collshp.com/mhqb365"
          target="_blank"
          class="btn btn-large"
        >
          collshp.com/mhqb365
        </a>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { ArrowLeft } from "lucide-vue-next";

const handleImageError = (e) => {
  e.target.src =
    "https://placehold.co/400x400/282c33/abb2bf?text=Shopee+Product";
};

const products = ref([
  {
    id: 1,
    name: "Nhựa tự cứng làm bản lề",
    description:
      "Dùng trong nha khoa nhưng có độ cứng tốt, phù hợp để làm bản lề laptop",
    category: "Vật liệu tiêu hao",
    price: "~ 160.000đ",
    url: "https://s.shopee.vn/8fJZIH75cK",
    image:
      "https://down-vn.img.susercontent.com/file/vn-11134207-820l4-mezriq4h6j9m87@resize_w900_nl.webp",
  },
  {
    id: 2,
    name: "Máy mài đa năng KOMAX 12V",
    description: "Dùng adapter 12v. Mài, khoan, cắt, tạo hình khi làm bản lề",
    category: "Dụng cụ",
    price: "~ 230.000đ",
    url: "https://s.shopee.vn/7ASrMc2nVT",
    image:
      "https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m77kwpa56wrrd6@resize_w900_nl.webp",
  },
  {
    id: 3,
    name: "Bút mài cắt IC YCS Ver2",
    description:
      "Mài cắt IC, xử lý những vết cháy mạch hoặc mài mịn nhựa tự cứng",
    category: "Dụng cụ",
    price: "~ 288.000đ",
    url: "https://s.shopee.vn/1qVSGS0S9f",
    image:
      "https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m87cb67h3urm5a@resize_w900_nl.webp",
  },
  {
    id: 4,
    name: "Máy mài cắt IC 2UUL",
    description:
      "Tương tự như bút mài YCS nhưng kích thước to hơn, cầm chắc tay hơn",
    category: "Dụng cụ",
    price: "~ 459.000đ",
    url: "https://s.shopee.vn/5VOqI4d5LZ",
    image:
      "https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m6zlhtnpq06ff5.webp",
  },
  {
    id: 5,
    name: "Set 5 lưới thép không gỉ",
    description: "Gia cường mối hàn nhựa",
    category: "Dụng cụ",
    price: "~ 89.000đ",
    url: "https://s.shopee.vn/LftMWz8st",
    image:
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsv1nrsy0cd5bf.webp",
  },
  {
    id: 6,
    name: "Đồng hồ vạn năng ZOZY ZT102A",
    description:
      "Đo điện áp, dòng điện, điện trở, thông mạch với độ chính xác cao và bền bỉ",
    category: "Đo lường",
    price: "~ 359.000đ",
    url: "https://s.shopee.vn/60L1EkIXYV",
    image:
      "https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m2l34r1oancqa6@resize_w900_nl.webp",
  },
  {
    id: 7,
    name: "Keo tản nhiệt Snowman 14.3W/mK",
    description: "Keo tản nhiệt quốc dân cho laptop và PC, hiệu năng cực tốt.",
    category: "Tản nhiệt",
    price: "~ 89.000đ",
    url: "https://s.shopee.vn/50SU3CwnYj",
    image:
      "https://down-vn.img.susercontent.com/file/1bfe22e88d5ff1fe6b6bd8d6bd5b107a@resize_w900_nl.webp",
  },
  {
    id: 8,
    name: "Máy hút bụi cầm tay",
    description: "Máy hút bụi cầm tay Nhật Bản, chạy pin, hiệu năng tốt",
    category: "Dụng cụ",
    price: "~ 101.000đ",
    url: "https://s.shopee.vn/20jk7rtmIm",
    image:
      "https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m2hms1rahcqcf5.webp",
  },
  {
    id: 9,
    name: "Máy nạp ROM XGecu T48",
    description: "Hỗ trợ đọc nạp nhiều BIOS, IC",
    category: "BIOS",
    price: "~ 1.550.000đ",
    url: "https://s.shopee.vn/LgeonRlUm",
    image:
      "https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-llqkiuaqfa3j7d@resize_w900_nl.webp",
  },
]);

const quickLinks = ref([
  {
    id: 1,
    name: "Loa kép chế loa laptop",
    url: "https://s.shopee.vn/9zrABRPsF6",
  },
  {
    id: 2,
    name: "Mỏ hàn Deli 90W",
    url: "https://s.shopee.vn/3qD0ICIWnv",
  },
  {
    id: 3,
    name: "Thiết hàn Sakura 0.8mm",
    url: "https://s.shopee.vn/5pwxwDgLFC",
  },
  {
    id: 4,
    name: "Xilanh mỡ hàn Amtech",
    url: "https://s.shopee.vn/3fx6f0AtAp",
  },
  {
    id: 5,
    name: "Dầu bôi trơn X5 Lube",
    url: "https://s.shopee.vn/2VgihUOaBA",
  },
  {
    id: 6,
    name: "Máy nạp rom RT809F",
    url: "https://s.shopee.vn/801yMCZ3R5",
  },
  {
    id: 7,
    name: "RAM Laptop chính hãng",
    url: "https://s.shopee.vn/5VOkqDZztF",
  },
  {
    id: 8,
    name: "Nhíp gắp linh kiện",
    url: "https://s.shopee.vn/20osgCLHyN",
  },
]);
</script>

<style scoped>
.shopee-page {
  padding-top: 100px;
  padding-bottom: 60px;
  min-height: 100vh;
}

.page-header {
  margin-bottom: 48px;
}

.back-link {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  color: var(--gray);
  text-decoration: none;
  margin-bottom: 24px;
  transition: color 0.3s;
}

.back-link:hover {
  color: var(--accent);
}

.header-content h1 {
  font-size: 32px;
  margin: 0 0 16px 0;
}

.header-content p {
  color: var(--gray);
  max-width: 600px;
  line-height: 1.6;
}

.products-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 24px;
  margin-bottom: 48px;
}

.links-section {
  margin-bottom: 48px;
}

.links-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 16px;
}

.quick-link {
  display: block;
  padding: 12px 16px;
  border: 1px solid var(--gray);
  color: var(--white);
  text-decoration: none;
  font-size: 14px;
  transition: all 0.3s;
  background: var(--background);
}

.quick-link:hover {
  border-color: var(--accent);
  color: var(--accent);
  transform: translateX(5px);
}

.product-card {
  border: 1px solid var(--gray);
  background: var(--background);
  display: flex;
  flex-direction: column;
  transition: transform 0.3s, border-color 0.3s;
}

.product-card:hover {
  transform: translateY(-5px);
  border-color: var(--accent);
}

.product-image {
  position: relative;
  width: 100%;
  height: 200px;
  border-bottom: 1px solid var(--gray);
  overflow: hidden;
}

.product-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s;
}

.product-card:hover .product-image img {
  transform: scale(1.1);
}

.product-category {
  position: absolute;
  top: 12px;
  right: 12px;
  background: var(--accent);
  color: var(--white);
  padding: 4px 12px;
  font-size: 12px;
  font-weight: 500;
}

.product-info {
  padding: 20px;
  flex: 1;
  display: flex;
  flex-direction: column;
}

.product-info h3 {
  margin: 0 0 12px 0;
  font-size: 20px;
  color: var(--white);
}

.product-info p {
  color: var(--gray);
  font-size: 14px;
  line-height: 1.5;
  margin: 0 0 20px 0;
  flex: 1;
}

.product-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.price {
  color: var(--accent);
  font-weight: 600;
  font-size: 18px;
}

.shopee-footer {
  margin-top: 60px;
  padding: 40px;
  border: 1px dashed var(--gray);
  text-align: center;
}

.shopee-footer p {
  color: var(--gray);
  margin-bottom: 20px;
}

.btn-large {
  padding: 12px 32px;
  font-size: 18px;
}

@media (max-width: 768px) {
  .shopee-page {
    padding-top: 80px;
  }

  .header-content h1 {
    font-size: 24px;
  }

  .products-grid {
    grid-template-columns: 1fr;
  }
}
</style>
