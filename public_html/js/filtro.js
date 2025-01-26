document.getElementById('categoria').addEventListener('change', function () {
    const categoria = this.value;
    const produtos = document.querySelectorAll('.produto');

    produtos.forEach(produto => {
        if (categoria === 'todas' || produto.innerHTML.toLowerCase().includes(categoria)) {
            produto.style.display = 'block';
        } else {
            produto.style.display = 'none';
        }
    });
});
