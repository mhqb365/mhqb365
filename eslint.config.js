import js from "@eslint/js";
import prettier from "eslint-config-prettier";
import globals from "globals";
import vue from "eslint-plugin-vue";

export default [
  {
    ignores: [
      ".agent/**",
      "docs/**",
      "dist/**",
      "dist-ssr/**",
      "node_modules/**",
    ],
  },
  js.configs.recommended,
  ...vue.configs["flat/essential"],
  prettier,
  {
    files: ["**/*.{js,vue}"],
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "module",
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
    rules: {
      "vue/multi-word-component-names": "off",
    },
  },
];
