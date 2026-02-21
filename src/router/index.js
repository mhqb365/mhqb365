import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/Home.vue";
import Privacy from "../views/Privacy.vue";
import Terms from "../views/Terms.vue";
import BuyMeCoffee from "../views/BuyMeCoffee.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/privacy.html",
    name: "Privacy",
    component: Privacy,
  },
  {
    path: "/terms.html",
    name: "Terms",
    component: Terms,
  },
  {
    path: "/buymeacoffee",
    name: "BuyMeCoffee",
    component: BuyMeCoffee,
  },
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
  scrollBehavior(to, from, savedPosition) {
    if (to.hash) {
      return {
        el: to.hash,
        behavior: "smooth",
      };
    }
    return { top: 0 };
  },
});

export default router;
