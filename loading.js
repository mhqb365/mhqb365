$(window).on("load", () => {
  $(".loading-container").fadeOut("slow", () => {
    $(".app").fadeIn("slow");
  });

  var clipboard = new ClipboardJS(".btn");

  clipboard.on("success", function (e) {
    alert("Đã copy");
    e.clearSelection();
  });
});
