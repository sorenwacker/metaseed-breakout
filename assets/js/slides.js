// Keyboard navigation and the slide counter for the slide view.
document.addEventListener("DOMContentLoaded", function () {
  var slides = Array.prototype.slice.call(document.querySelectorAll(".slide"));
  var count = document.querySelector(".deck-count");
  var current = 0;
  var forward = ["ArrowRight", "ArrowDown", "PageDown", " "];
  var back = ["ArrowLeft", "ArrowUp", "PageUp"];

  function show(index) {
    current = Math.max(0, Math.min(slides.length - 1, index));
    slides[current].scrollIntoView({ behavior: "smooth" });
  }

  var observer = new IntersectionObserver(
    function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        current = slides.indexOf(entry.target);
        count.textContent = current + 1 + " / " + slides.length;
      });
    },
    { threshold: 0.5 }
  );
  slides.forEach(function (slide) {
    observer.observe(slide);
  });

  document.addEventListener("keydown", function (event) {
    if (event.metaKey || event.ctrlKey || event.altKey) return;
    if (event.target.closest("button, a")) return;
    if (forward.indexOf(event.key) !== -1) show(current + 1);
    else if (back.indexOf(event.key) !== -1) show(current - 1);
    else if (event.key === "Home") show(0);
    else if (event.key === "End") show(slides.length - 1);
    else return;
    event.preventDefault();
  });
});
