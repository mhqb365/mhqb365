import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/Home.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/projects",
    name: "Projects",
    component: () => import("../views/Projects.vue"),
  },
  {
    path: "/about-me",
    name: "About",
    component: () => import("../views/About.vue"),
  },
  {
    path: "/contacts",
    name: "Contacts",
    component: () => import("../views/Home.vue"), // Temporary until implemented or use anchor
    beforeEnter: (to, from, next) => {
      if (to.name === "Contacts") {
        next({ name: "Home", hash: "#contacts" });
      } else {
        next();
      }
    },
  },
];

const router = createRouter({
  history: createWebHistory(),
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
