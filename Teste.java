@Test
public void deveTerProdutosNoCarrinho(){
 List carrinho = new ArrayList<>();
 Produto p1 = new Produto(“Tenis”,156.0);
 Produto p2 = new Produto(“Calça”,89.9);
 Produto p3 = new Produto(“Blusa”,39.9);
 carrinho.add(p1);
 carrinho.add(p2);
 carrinho.add(p3);

//Classe Assert, do pacote org.junit, cujo qual tem vários métodos de validação
 Assert.assertEquals(carrinho.size(),3);
}
