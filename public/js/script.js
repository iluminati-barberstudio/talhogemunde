class MobileNavbar {
    constructor(mobileMenu, navList, navLinks) {
        // Seleciona o menu móvel, a lista de navegação e os links da lista
        this.mobileMenu = document.querySelector(mobileMenu);
        this.navList = document.querySelector(navList);
        this.navLinks = document.querySelectorAll(navLinks);
        
        // Define uma classe ativa que será utilizada para abrir/fechar o menu
        this.activeClass = "active";

        // Liga o método handleClick ao contexto atual
        this.handleClick = this.handleClick.bind(this);
        
        // Liga o método handleOutsideClick ao contexto atual
        this.handleOutsideClick = this.handleOutsideClick.bind(this);
    }

    // Método para animar os links da navegação
    animateLinks() {
        this.navLinks.forEach((link, index) => {
            // Define uma animação para os links quando o menu é aberto
            link.style.animation
                ? (link.style.animation = "") // Se já tem animação, limpa
                : (link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.3}s`); // Caso contrário, define nova animação
        });
    }

    // Método que alterna a classe ativa para mostrar/ocultar o menu
    handleClick() {
        this.navList.classList.toggle(this.activeClass); // Alterna a classe ativa na lista de navegação
        this.mobileMenu.classList.toggle(this.activeClass); // Alterna a classe ativa no menu móvel
        this.animateLinks(); // Chama a animação dos links
    }

    // Método que lida com cliques fora do menu
    handleOutsideClick(event) {
        // Verifica se o clique foi fora do menu móvel e da lista de navegação
        if (
            !this.mobileMenu.contains(event.target) && // Se o clique não foi dentro do menu
            !this.navList.contains(event.target) // E se o clique não foi dentro da lista
        ) {
            // Fecha o menu se estiver aberto
            if (this.navList.classList.contains(this.activeClass)) { // Se a lista de navegação tem a classe ativa
                this.handleClick(); // Chama handleClick para fechar o menu
            }
        }
    }

    // Método para adicionar eventos de clique
    addClickEvent() {
        this.mobileMenu.addEventListener("click", this.handleClick); // Adiciona evento de clique no menu móvel
        document.addEventListener("click", this.handleOutsideClick); // Adiciona evento de clique no documento para detectar cliques fora
    }

    // Método de inicialização
    init() {
        if (this.mobileMenu) { // Verifica se o menu móvel existe
            this.addClickEvent(); // Adiciona eventos de clique
        }
        return this; // Retorna a instância atual
    }
}

// Cria uma nova instância de MobileNavbar com os seletores dos elementos
const mobileNavbar = new MobileNavbar(
    ".mobile-menu", // Seletor do menu móvel
    ".nav-list", // Seletor da lista de navegação
    ".nav-list li", // Seletor dos links da lista
);

// Inicializa a barra de navegação móvel
mobileNavbar.init();
