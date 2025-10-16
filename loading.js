// Splash screen loading logic
const splashScreen = document.querySelector(".splash-screen");
const app = document.querySelector(".app");
const minLoadTime = 1500;
const startTime = Date.now();

// Wait for all resources to load
Promise.all([
  // Wait for DOM content to be loaded
  new Promise((resolve) => {
    if (document.readyState === "complete") {
      resolve();
    } else {
      window.addEventListener("load", resolve);
    }
  }),
  // Minimum loading time
  new Promise((resolve) => setTimeout(resolve, minLoadTime)),
]).then(() => {
  const elapsedTime = Date.now() - startTime;
  const remainingTime = Math.max(0, minLoadTime - elapsedTime);

  setTimeout(() => {
    // Fade out splash screen
    splashScreen.style.opacity = "0";
    splashScreen.style.transition = "opacity 0.5s ease";

    setTimeout(() => {
      splashScreen.style.display = "none";
      app.style.display = "block";
      app.style.opacity = "0";

      // Fade in app
      setTimeout(() => {
        app.style.opacity = "1";
        app.style.transition = "opacity 0.5s ease";
      }, 10);
    }, 500); // Wait for fade out animation
  }, remainingTime);
});

// Clipboard functionality (if needed)
$(window).on("load", () => {
  var clipboard = new ClipboardJS(".btn");

  clipboard.on("success", function (e) {
    alert("Đã copy");
    e.clearSelection();
  });
});
