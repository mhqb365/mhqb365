import { ref } from "vue";

// Get initial language from localStorage or default to 'vi'
const savedLang = localStorage.getItem("lang");
const initialLang = savedLang === "en" ? "en" : "vi";

// Simple shared language state (vi | en)
const lang = ref(initialLang);

const setLang = (value) => {
  const newLang = value === "en" ? "en" : "vi";
  lang.value = newLang;
  localStorage.setItem("lang", newLang);
};

const toggleLang = () => {
  setLang(lang.value === "vi" ? "en" : "vi");
};

export function useLang() {
  return { lang, setLang, toggleLang };
}
