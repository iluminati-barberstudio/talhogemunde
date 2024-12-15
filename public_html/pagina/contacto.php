<!DOCTYPE html>
<html lang="pt-pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacto</title>
    <link rel="stylesheet" href="./css/contacto.css">
</head>
<body>
<main>
    <main>
        <h1>Entre em Contacto Connosco</h1>
        <form action="/contacto/enviar" method="POST">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="mensagem">Mensagem:</label>
            <textarea id="mensagem" name="mensagem" rows="5" required></textarea>
            
            <button type="submit">Enviar</button>
        </form>
    </main>
</main>
</body>
</html>
