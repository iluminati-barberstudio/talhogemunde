<?php
// Carregar os controllers dinamicamente
require_once '../app/controllers/HomeController.php';
require_once '../app/controllers/ProdutosController.php';
require_once '../app/controllers/SobreController.php';
require_once '../app/controllers/ContactoController.php';

// Obter a URL atual
$url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : '/home';

// Remove o prefixo da pasta do projeto, se necessário
$baseFolder = '/public_html'; // Ajuste este valor conforme a tua estrutura
$url = str_replace($baseFolder, '', $url);

// Verifica se a URL está vazia
if ($url === '/' || $url === '') {
    $url = '/home'; // Redireciona para o controller padrão (Home)
}

// Divide a URL para identificar controller e método
$urlParts = explode('/', trim($url, '/'));
$controllerName = ucfirst($urlParts[0] ?? 'home') . 'Controller';
$method = $urlParts[1] ?? 'index';

// Verificar se o controller existe
if (file_exists("../app/controllers/$controllerName.php")) {
    $controllerInstance = new $controllerName();
    if (method_exists($controllerInstance, $method)) {
        $controllerInstance->$method(); // Chamar o método
    } else {
        $controllerInstance->index(); // Chamar método padrão
    }
} else {
    http_response_code(404);
    echo "Página não encontrada";
}
