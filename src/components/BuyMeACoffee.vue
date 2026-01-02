<template>
  <section id="drinks-box" ref="rootRef" :class="[isMobile ? 'Mobile' : '']">
    <section
      id="drinks-box-s"
      :class="['drinks-button left-100', animationClass]"
    >
      <!-- Initial Icon -->
      <div id="drinks-icons" class="left-100 tr3" @click="showInitialOptions">
        <div id="coffee-donate" class="icon-donate">
          <img src="/images/buymeacoffee/coffee.png" alt="coffee" />
        </div>
      </div>

      <!-- Donate Options -->
      <div
        id="drinks-button-box"
        :class="['tr3 left-100', { showBox: showBoxAnim, Mobile: isMobile }]"
      >
        <div id="drinks-button-bg" class="left-100" @click="hideOptions"></div>
        <div id="github-box">
          <a href="https://github.com/mhqb365/donate" target="_blank">
            Github
          </a>
        </div>
        <ul id="donate-buttons" class="list tr3">
          <li
            id="binance_donate"
            class="donate-button"
            @click="showQr('binance')"
          >
            Binance
          </li>
          <li
            id="vietcombank_donate"
            class="donate-button"
            @click="showQr('vietcombank')"
          >
            Vietcombank
          </li>
        </ul>
      </div>

      <!-- QR Codes -->
      <div
        id="drinks-qrcodes"
        :class="['left-100 tr3', { showBox: showQrAnim }]"
      >
        <div
          id="drinks-qrcode"
          :style="{ backgroundImage: `url(${currentQr})` }"
          @click="hideQr"
        ></div>
      </div>
    </section>
  </section>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from "vue";

const rootRef = ref(null);
const animationState = ref(0);
const showBoxAnim = ref(false);
const showQrAnim = ref(false);
const currentQr = ref("");
const isMobile = ref(false);

const animationClass = computed(() => {
  if (animationState.value === 0) return "";
  return `donate-animation-${animationState.value}`;
});

const showInitialOptions = () => {
  animationState.value = 1;
  showBoxAnim.value = true;
  setTimeout(() => {
    showBoxAnim.value = false;
  }, 300);
};

const hideOptions = () => {
  animationState.value = 2;
  setTimeout(() => {
    animationState.value = 0;
  }, 300);
};

const showQr = (type) => {
  if (type === "binance") {
    currentQr.value = "/images/buymeacoffee/Binance.png";
  } else if (type === "vietcombank") {
    currentQr.value = "/images/buymeacoffee/Vietcombank.png";
  }

  animationState.value = 3;
  showQrAnim.value = true;
  setTimeout(() => {
    showQrAnim.value = false;
  }, 300);
};

const hideQr = () => {
  animationState.value = 4;
  setTimeout(() => {
    animationState.value = 1;
  }, 300);
};

const handleOutsideClick = (event) => {
  if (rootRef.value && !rootRef.value.contains(event.target)) {
    if (animationState.value === 1) {
      hideOptions();
    } else if (animationState.value === 3) {
      // If QR is open, we first go back to menu, then menu will be hidden on next click?
      // Or just hide everything?
      // Let's hide everything to be intuitive.
      animationState.value = 4;
      setTimeout(() => {
        animationState.value = 2; // Transition to hiding state
        setTimeout(() => {
          animationState.value = 0;
        }, 300);
      }, 300);
    }
  }
};

onMounted(() => {
  isMobile.value = /Android|webOS|iPhone|iPad|BlackBerry/i.test(
    navigator.userAgent
  );
  window.addEventListener("mousedown", handleOutsideClick);
});

onUnmounted(() => {
  window.removeEventListener("mousedown", handleOutsideClick);
});
</script>

<style scoped>
#drinks-box {
  width: 320px;
  height: 240px;
  text-align: center;
  right: 0;
  bottom: 0;
  position: fixed;
  z-index: 9999;
}

@media (max-width: 768px) {
  #drinks-box {
    transform: scale(0.8);
    transform-origin: bottom right;
  }
}

.list,
.list li {
  list-style: none;
  list-style-type: none;
  margin: 0px;
  padding: 0px;
}

.left-100 {
  width: 100%;
  height: 100%;
  float: left;
}

.tr3,
.list li {
  transition: all 0.3s;
}

.icon-donate,
.list li {
  cursor: pointer;
}

#drinks-icons {
  background: no-repeat center center url(/images/buymeacoffee/text.png);
}

.drinks-button > div {
  position: absolute;
  top: 0;
  left: 0;
  transition: all 0.3s;
  transform-style: preserve-3d;
  transform-origin: center center;
}

.icon-donate {
  width: 64px;
  height: 64px;
  position: absolute;
  left: calc(50% - 32px);
  top: calc(50% - 32px);
}

.icon-donate img {
  max-width: 64px;
  max-height: 64px;
}

#drinks-button-box {
  display: none;
  opacity: 0;
  transform: scale(1.3, 1.3);
}

#drinks-button-bg {
  position: absolute;
  top: 70px;
  left: 0;
  height: 100px;
  opacity: 0;
}

#donate-buttons {
  position: absolute;
  overflow: hidden;
  top: calc(50% - 18px);
  left: 60px;
  height: 36px;
  border-radius: 8px;
  background-color: #62cdff;
  box-shadow: 0 10px 20px 1px rgba(103, 207, 248, 0.5);
}

li[id$="_donate"] {
  position: relative;
  width: 100px;
  height: 36px;
  line-height: 600px;
  overflow: hidden;
  cursor: pointer;
  background: no-repeat center center;
  background-size: 60px;
  float: left;
  text-align: center;
}

li[id$="_donate"]::after {
  content: "";
  position: absolute;
  top: -5px;
  left: calc(50% - 5px);
  height: 0;
  width: 0;
  opacity: 0;
  border: 5px solid #fff;
  border-color: #fff transparent transparent transparent;
  transition: all 0.3s;
}

li[id$="_donate"]:hover::after {
  opacity: 1;
  top: 0px;
}

#github-box {
  width: 32px;
  height: 32px;
  position: absolute;
  top: calc(50% - 16px);
  background: no-repeat center center url(/images/buymeacoffee/github.svg);
  background-size: contain;
  right: 72px;
  line-height: 600px;
  overflow: hidden;
  transform: rotatez(20deg);
  opacity: 0;
  transition: all 0.3s ease-out;
}

#drinks-button-box:hover #github-box,
#drinks-button-box.Mobile #github-box {
  top: calc(50% - 40px);
  right: 64px;
  transform: rotatez(5deg);
  opacity: 0.8;
}

#binance_donate {
  background-image: url(/images/buymeacoffee/Binance.svg);
}

#vietcombank_donate {
  background-image: url(/images/buymeacoffee/Vietcombank.svg);
}

#drinks-qrcodes {
  display: none;
}

#drinks-qrcode {
  position: absolute;
  top: calc(50% - 90px);
  left: calc(50% - 90px);
  width: 180px;
  height: 180px;
  background: #fff no-repeat center center;
  background-size: 160px;
  border-radius: 6px;
  cursor: pointer;
  box-shadow: 0 10px 20px rgba(103, 207, 248, 0.5);
}

.donate-animation-1 > #drinks-icons,
.donate-animation-4 > #drinks-icons,
.donate-animation-3 > #drinks-button-box {
  transform: scale(0.7, 0.7);
  filter: blur(2px);
  display: block;
  opacity: 1;
}

.donate-animation-1 > #drinks-button-box,
.donate-animation-4 > #drinks-button-box,
.donate-animation-3 > #drinks-qrcodes {
  display: block;
  opacity: 1;
  transform: scale(1, 1);
}

.donate-animation-2 > #drinks-button-box,
.donate-animation-4 > #drinks-qrcodes {
  display: block;
  transform: scale(1, 1);
  animation-name: hideBox;
  animation-duration: 0.3s;
  animation-timing-function: ease-in-out;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}

.donate-animation-3 > #drinks-icons {
  transform: scale(0.4, 0.4);
  filter: blur(2px);
}

.showBox {
  animation-name: showBox;
  animation-duration: 0.3s;
  animation-timing-function: ease-in-out;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}

@keyframes showBox {
  from {
    opacity: 0;
    transform: scale(1.3, 1.3);
  }
  to {
    opacity: 1;
    transform: scale(1, 1);
  }
}

@keyframes hideBox {
  from {
    opacity: 1;
    transform: scale(1, 1);
  }
  to {
    opacity: 0;
    transform: scale(1.3, 1.3);
  }
}
</style>
