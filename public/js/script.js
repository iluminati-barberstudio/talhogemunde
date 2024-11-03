// Seleciona os elementos do DOM
const menuButton = document.getElementById("menuButton");
const navLinks = document.getElementById("navLinks");
const menuIcon = document.getElementById("menuIcon");

// Função para alternar o menu
function toggleMenu() {
  const isMenuOpen = navLinks.classList.contains("show-menu");

  if (isMenuOpen) {
    navLinks.classList.remove("show-menu");
    navLinks.classList.add("hide-menu");
    menuIcon.setAttribute("name", "menu-sharp");
    menuButton.setAttribute("aria-expanded", "false");
  } else {
    navLinks.classList.remove("hide-menu");
    navLinks.classList.add("show-menu");
    menuIcon.setAttribute("name", "close-sharp");
    menuButton.setAttribute("aria-expanded", "true");
  }
}

// Adiciona o evento de clique ao botão do menu
menuButton.addEventListener("click", toggleMenu);

// Redefine o estado do menu ao redimensionar a tela
window.addEventListener("resize", () => {
  if (window.innerWidth > 768) {
    // Remove as classes de visibilidade do menu para garantir que ele seja exibido corretamente em telas grandes
    navLinks.classList.remove("show-menu", "hide-menu");
    menuIcon.setAttribute("name", "menu-sharp");
    menuButton.setAttribute("aria-expanded", "false");
  }
});
