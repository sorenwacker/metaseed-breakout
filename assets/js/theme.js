// Applies the stored theme before the page paints, then wires the switch in the header.
(function () {
  var root = document.documentElement;
  var key = "theme";
  var systemDark = window.matchMedia("(prefers-color-scheme: dark)");

  function active() {
    return root.dataset.theme || (systemDark.matches ? "dark" : "light");
  }

  try {
    var stored = localStorage.getItem(key);
    if (stored === "light" || stored === "dark") root.dataset.theme = stored;
  } catch (e) {}

  document.addEventListener("DOMContentLoaded", function () {
    var button = document.querySelector(".theme-toggle");
    if (!button) return;

    function label() {
      var text = "Switch to " + (active() === "dark" ? "light" : "dark") + " mode";
      button.setAttribute("aria-label", text);
      button.title = text;
    }

    button.addEventListener("click", function () {
      var next = active() === "dark" ? "light" : "dark";
      root.dataset.theme = next;
      try {
        localStorage.setItem(key, next);
      } catch (e) {}
      label();
    });
    systemDark.addEventListener("change", label);
    label();
    button.hidden = false;
  });
})();
