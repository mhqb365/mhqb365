import { ref } from "vue";

// Simple shared language state (vi | en)
const lang = ref("vi");

const setLang = (value) => {
  lang.value = value === "en" ? "en" : "vi";
};

const toggleLang = () => {
  setLang(lang.value === "vi" ? "en" : "vi");
};

export function useLang() {
  return { lang, setLang, toggleLang };
}
