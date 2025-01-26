<?php
// Carregar os controllers dinamicamente
require_once __DIR__ . '/../app/controllers/HomeController.php';
require_once __DIR__ . '/../app/controllers/ProdutosController.php';
require_once __DIR__ . '/../app/controllers/SobreController.php';
require_once __DIR__ . '/../app/controllers/ContactoController.php';

// Obter a URL atual
$url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : '/home';

// Remove o prefixo da pasta do projeto (se necessário)
$baseFolder = '';
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
$controllerPath = __DIR__ . "/../app/controllers/$controllerName.php";
if (file_exists($controllerPath)) {
    require_once $controllerPath;
    $controllerInstance = new $controllerName();
    if (method_exists($controllerInstance, $method)) {
        $controllerInstance->$method(); // Chamar o método
    } else {
        // Fallback para método padrão
        $controllerInstance->index();
    }
} else {
    // Exibir página de erro amigável
    http_response_code(404);
    echo "Página não encontrada.";
}
