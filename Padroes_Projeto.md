---
title: Trabalho 2 - POO 2
layout: post
author: csanterio
permalink: /padroes-projetos/
source-id: 1AG6DF8nLqMqAQOZHaQeXs47YfNk7XNUsEu8dp40PG34
published: true
---
**INSTITUTO FEDERAL DO ESPÍRITO SANTO - CAMPUS SERRA**

**DANILO DE OLIVEIRA**

**CRISTIAN DA SILVA ANTERIO**

**PROJETO FLASH**

**SERRA-ES**

**2016**

**DANILO DE OLIVEIRA**

**CRISTIAN DA SILVA ANTERIO**

**PROJETO FLASH**

Trabalho da disciplina de Programação Orientado a Objetos 2, do curso de Bacharelado em Sistemas de Informação, do Instituto Federal do Espírito Santo Campus Serra, apresentado como exigência parcial para obtenção de aprovação na disciplina.

Professor: Felipe Frechiani de Oliveira.

**SERRA-ES**

**2016**

**RESUMO**

**	**O presente trabalho apresenta os detalhes do projeto que foi desenvolvido. Nele, foi utilizado os conteúdos aprendidos em todas as disciplinas do mesmo período. Porém, esse trabalho tem o foco voltado para os conteúdos aprendidos na disciplina de Programação Orientada a Objetos 2. O trabalho está dividido da seguinte forma: a introdução apresenta o minimundo relacionado ao problema abordado, o desenvolvimento apresenta as ferramentas utilizadas (linguagem de programação, framework, etc), padrões de projeto utilizados e diagramas da solução.

Palavras-chave: Padrões de projetos. Drools. OptaPlanner. Sistemas Baseados em Regras.

**SUMÁRIO**

[[TOC]]

### **1 Introdução**

	Esse trabalho foi desenvolvido buscando implementar uma solução para um problema real de planejamento de horários.

	O coordenador de curso de Bacharelado em Sistemas de Informação possui problemas para realizar o planejamento de horários para alocar professores às disciplinas do curso. Para realizar as alocações, ele precisa considerar uma grande quantidade de regras e, somado à quantidade de professores e disciplinas disponíveis, a tarefa de alocação torna-se complexa e demanda muito tempo para ser realizada.

	Para resolver o problema, optamos por utilizar a linguagem de programação Java, pois é uma linguagem utilizada na disciplina e possui uma grande comunidade. Além disso, utilizamos um framework chamado Drools para *Sistemas Baseados em Regras* (NOTE:  É um sistema especialista e "Sistemas especialistas são programas que têm como objetivo simular o raciocínio de um profissional 'expert' em alguma área de conhecimento bem específica." (https://pt.wikipedia.org/wiki/Sistema_especialista)) em conjunto com um framework para problemas de planejamento chamado OptaPlanner que utiliza o Drools. Para controlar a versão do projeto, utilizamos o programa de versão Git e utilizamos um repositório no Github para armazenar os códigos.

### **2 Desenvolvimento**

#### **2.1 Padrão Builder**

	A intenção do padrão de projeto Builder é a seguinte:

**"Separar a construção de um objeto complexo de sua representação de modo que o mesmo processo de construção possa criar diferentes representações"**.

Nós utilizamos o padrão builder para construir os nossos horários. Como assim?

Cada disciplina tem um horário para ser lecionada, então, este builder é responsável por criar o horário que uma disciplina inicia, quando ela termina e em qual dia da semana ela está sendo ministrada. Basicamente isso.

Abaixo é mostrado o seu diagrama de classes: 

![image alt text]({{ site.url }}/public/rsaStULuSNGyBoWiF77BFg_img_0.png)

#### **2.2 Padrão Singleton**

Intenção do padrão Singleton:

**"Garantir que uma classe tenha somente uma instância e fornece um ponto global de acesso para a mesma"**.

Com a utilização desse padrão garantimos ter apenas uma instância de uma determinada classe. Mas como aplicaríamos este padrão?

Imagine a construção de uma classe de conexão com um banco de dados. Você quer salvar dados, excluir, alterar, etc …

Para 'conversarmos' com o banco de dados precisamos criar um canal de comunicação com ele. Chamamos este canal de sessão. Depois de criarmos esta sessão, podemos enviar e receber dados do banco.

O problema todo é que se, por exemplo, eu tivesse que salvar 10 registros, e para cada um deles eu tivesse que criar uma nova sessão. Em termos  de eficiência computacional essa não é a melhor forma de implementarmos, pois o tempo gasto para criar cada sessão seria muito grande. Agora imagina se tivermos que inserir 100 registros …

Pois bem, o padrão Singleton resolve isso. Ele simplesmente possui uma referência do objeto (estático)desejado em sua classe e um método estático que verifica se este objeto já foi instanciado alguma vez. Caso verdadeiro, retorna o próprio objeto sem nenhuma instanciação, caso contrário, ele cria o objeto. Veja abaixo: 

![image alt text]({{ site.url }}/public/rsaStULuSNGyBoWiF77BFg_img_1.png)

Foi exatamente isso que utilizamos em nosso projeto. Um singleton para evitar que criássemos múltiplas sessões desnecessário com o banco de dados.

#### **2.3 Padrão Factory**

	Este foi o único dos padrões descritos aqui, que não implementamos diretamente, mas com os conceitos vistos em sala de aula, pudemos utilizar este padrão que o framework Optaplanner implementa.

#### ![image alt text]({{ site.url }}/public/rsaStULuSNGyBoWiF77BFg_img_2.png)

Nós utilizamos a fábrica SolverFactory, pois a partir dela conseguimos obter um objeto do tipo Solver e com ele podemos iniciar os processos do OptaPlanner para buscar a melhor solução a partir de um XML que contém as configurações que definem algoritmos de otimização e as classes com as anotações do optaplanner.

#### **2.4 Padrão DAO**

O Padrão de Projeto DAO surgiu da necessidade de separarmos a persistência de dados da lógica de negócios. Tornando as classes mais legíveis e fáceis de dar manutenção. Nossas classes DAO são as responsáveis por fazer a comunicação com o SGBD (Sistema Gerenciador de Banco de Dados).

Como visto em sala de aula, criamos uma interface genérica DAO que possui os métodos básicos comuns de acesso ao banco. Criamos também uma classe abstrata que implementa estes métodos, chamada GenericDAOImpl e as classes clientes implementam e herdam dessas classes.

![image alt text]({{ site.url }}/public/rsaStULuSNGyBoWiF77BFg_img_3.jpg)

### **3 Conclusão**

A utilização de Padrões de Projetos, além de nos proporcionar o concretização do conhecimento que obtivemos na sala de aula, também melhorou no desenvolvimento do código, ou seja, ficou bem mais legível e obedecendo ao Princípio da Responsabilidade Única.

### **REFERÊNCIAS**

Red Hat®, Drools. Disponível em: <[http://drools.org/learn/documentation.html](http://drools.org/learn/documentation.html)>. Acesso em 28 de Novembro de 2016.

Marcos Brizeno, Padrões de Projeto. Disponível em: <[https://brizeno.wordpress.com/padroes/](https://brizeno.wordpress.com/padroes/)>. Acesso em 208 de Novembro de 2016.

Red Hat®, OptaPlanner. Disponível em: <[https://www.optaplanner.org/learn/documentation.html](https://www.optaplanner.org/learn/documentation.html)>. Acesso em 28 de Novembro de 2016.

