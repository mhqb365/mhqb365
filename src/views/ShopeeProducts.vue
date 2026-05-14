<template>
  <div class="shopee-products container section-padding">
    <div class="header-nav">
      <RouterLink to="/" class="back-link">
        <ArrowLeft :size="20" />
        {{ t('backToHome') }}
      </RouterLink>
    </div>
    
    <SectionTitle :title="t('pageTitle')" />
    <p class="description">{{ t('pageDesc') }}</p>

    <div class="products-grid">
      <a v-for="product in products" :key="product.id" :href="product.link" target="_blank" rel="noopener noreferrer" class="product-card">
       
        <div class="product-info">
          <h3>{{ product.name }}</h3>
          <p>{{ product.description }}</p>
          <span class="buy-btn">{{ t('buyOnShopee') }} <ExternalLink :size="14" /></span>
        </div>
      </a>
    </div>

    <div class="all-products-link-container">
      <a href="https://collshp.com/mhqb365" target="_blank" rel="noopener noreferrer" class="all-products-link">
        {{ t('allProducts') }} <ExternalLink :size="16" />
      </a>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue';
import { ArrowLeft, ExternalLink } from 'lucide-vue-next';
import SectionTitle from '../components/SectionTitle.vue';
import { useLang } from '../composables/useLang';

const { lang } = useLang();

const dictionary = {
  backToHome: { vi: 'Quay lại', en: 'Back' },
  pageTitle: { vi: 'đồ nghề hay dùng', en: 'recommended tools' },
  pageDesc: { 
    vi: 'Tổng hợp các đồ nghề, linh kiện tui hay dùng để sửa laptop và thiết bị điện tử', 
    en: 'A collection of tools and components I frequently use for electronics repair' 
  },
  buyOnShopee: { vi: 'Mua ngay', en: 'Buy now' },
  allProducts: { vi: 'Xem tất cả các sản phẩm', en: 'View all products' }
};

const t = (key) => dictionary[key][lang.value];

const productsList = [
  {
    id: 1,
    name: { vi: 'Nhựa tự cứng và nước pha', en: 'Plastic powder & mixing liquid' },
    description: { vi: 'Combo 100g bột nhựa và 100ml nước pha, dùng để làm lại ren vít bản lề laptop', en: '100g plastic powder & 100ml mixing liquid combo, used to make screw holes for laptop hinges' },
   
    link: 'https://s.shopee.vn/2Vmauy0x5U'
  },
  {
    id: 2,
    name: { vi: 'Keo 2 thành phần, súng bắn keo', en: '2-component glue, glue gun' },
    description: { vi: 'Keo 2 thành phần, súng bắn keo, đặc trị bản lề laptop vỏ kim loại', en: '2-component glue, glue gun, specialized for fixing metal body laptop hinges' },
  
    link: 'https://s.shopee.vn/7fWdAAym4E'
  },
  {
    id: 3,
    name: { vi: 'Keo AB 302', en: 'AB Glue 302' },
    description: { vi: 'Keo này theo thời gian sẽ giòn, chủ yếu dùng khi tui làm "người tốt" thôi', en: 'This glue will crack over time, mainly used when I want to be a "good person"' },
  
    link: 'https://s.shopee.vn/9fAHTVLhla'
  },
  {
    id: 4,
    name: { vi: 'Máy khoan, mài mini 3 cấp độ', en: '3-speed Mini Drill and Grinder' },
    description: { vi: 'Máy chạy pin, khá mạnh, khoan mài khi thay bàn phím & sửa bản lề', en: 'Rechargeable and powerful enough for replacing keyboards and fixing hinges' },
   
    link: 'https://s.shopee.vn/6fbiKUopbX'
  },
  {
    id: 5,
    name: { vi: 'Máy khoan, mài mini 5 cấp độ', en: '5-speed Mini Drill and Grinder' },
    description: { vi: 'Chạy nguồn 12V DC, mạnh lắm', en: 'Runs on 12V DC, very powerful' },
   
    link: 'https://s.shopee.vn/7ASrMc2nVT'
  },
  {
    id: 6,
    name: { vi: 'Dầu bôi trơn trục bản lề', en: 'Hinge pin lubricant oil' },
    description: { vi: 'Dầu bôi trơn cho trục bản lề laptop, chống kẹt, mòn & rỉ sét', en: 'Lubricant oil for laptop hinges, anti-jamming, anti-wear & anti-rust' },
  
    link: 'https://s.shopee.vn/2VgihUOaBA'
  },
  {
    id: 7,
    name: { vi: 'Lưới thép hàn nhựa', en: 'Plastic welding mesh' },
    description: { vi: 'Lưới thép dùng để gia cố nhựa, hàn nhựa với nhau', en: 'Steel mesh used to reinforce plastic, weld plastic together' },
  
    link: 'https://s.shopee.vn/LftMWz8st'
  },{
    id: 8,
    name: { vi: 'Thảm lót bàn khổ lớn', en: 'Large technical mat' },
    description: { vi: 'Thảm kỹ thuật, dùng để lót bàn khi sửa chữa thiết bị điện tử', en: 'Technical mat, used to pad the table when repairing electronic equipment' },
   
    link: 'https://s.shopee.vn/20sHcZPRv6'
  },
  {
    id: 9,
    name: { vi: 'Đồng hồ vạn năng', en: 'Multimeter' },
    description: { vi: 'Đo điện áp, dòng điện, điện trở, thông mạch, v.v.', en: 'Measure voltage, current, resistance, continuity, etc.' },
  
    link: 'https://s.shopee.vn/4LCnFfJRh9'
  }
];

const products = computed(() => productsList.map(p => ({
  ...p,
  name: p.name[lang.value],
  description: p.description[lang.value]
})));
</script>

<style scoped>
.shopee-products {
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
.description {
  color: var(--gray);
  margin-bottom: 48px;
  max-width: 600px;
  line-height: 1.6;
}
.products-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 24px;
}
.product-card {
  display: flex;
  flex-direction: column;
  padding: 24px;
  border: 1px solid var(--gray);
  background: rgba(255, 255, 255, 0.02);
  transition: all 0.3s ease;
  text-decoration: none;
  border-radius: 4px;
}
.product-card:hover {
  transform: translateY(-4px);
  border-color: var(--accent);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
}
.product-icon {
  color: var(--accent);
  margin-bottom: 16px;
}
.product-info {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
}
.product-info h3 {
  margin: 0 0 12px 0;
  font-size: 18px;
  color: var(--white);
}
.product-info p {
  color: var(--gray);
  font-size: 14px;
  line-height: 1.6;
  margin: 0 0 24px 0;
  flex-grow: 1;
}
.buy-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  color: var(--accent);
  font-size: 14px;
  font-family: var(--font-mono);
  font-weight: 500;
  margin-top: auto;
}

.all-products-link-container {
  margin-top: 48px;
  display: flex;
  justify-content: center;
}

.all-products-link {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 12px 32px;
  border: 1px solid var(--accent);
  color: var(--accent);
  text-decoration: none;
  font-family: var(--font-mono);
  font-weight: 500;
  font-size: 16px;
  border-radius: 4px;
  transition: all 0.3s ease;
}

.all-products-link:hover {
  background-color: var(--accent);
  color: var(--bg, #000);
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

@media (max-width: 768px) {
  .shopee-products {
    padding-top: 32px;
  }
  .products-grid {
    grid-template-columns: 1fr;
  }
}
</style>
