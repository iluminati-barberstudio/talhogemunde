<?php
class HomeController {
    public function index() {
        include __DIR__ . '/../../public_html/partials/header.php';
        include __DIR__ . '/../../public_html/pagina/home.php';
        include __DIR__ . '/../../public_html/partials/footer.php';
    }
}
