const menuButton = document.getElementById("menuButton");
const navLinks = document.getElementById("navLinks");
const menuIcon = document.getElementById("menuIcon");

menuButton.addEventListener("click", () => {
  // Verifica se o menu está visível e alterna entre as classes para mostrar/esconder
  if (navLinks.classList.contains("show-menu")) {
    navLinks.classList.remove("show-menu");
    navLinks.classList.add("hide-menu");
    menuIcon.setAttribute("name", "menu-sharp");
  } else {
    navLinks.classList.remove("hide-menu");
    navLinks.classList.add("show-menu");
    menuIcon.setAttribute("name", "close-sharp");
  }
});
