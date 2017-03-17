[![Stories in Ready](https://badge.waffle.io/Sakamotto/Projeto-Flash.png?label=ready&title=Ready)](https://waffle.io/Sakamotto/Projeto-Flash)
# Projeto-Flash

## Resumo do Projeto

O coordenador do curso Sistemas de Informação do IFES, tem muita dificuldade e trabalho para alocar professores e salas à disciplinas para cada período. Para apoiá-lo, este projeto tem como objetivo desenvolver um software que otimize tal processo, obedecendo à restrições de horário, laboratórios disponíveis, etc ...

Com isso, espera-se que o cliente tenha menos esforço, mais precisão e os horários estejam prontos e disponíveis mais rapidamente.

Utilizaremos o framework **OptaPlanner** desenvolvido em **Java** pela empresa **RedHat**.

## Organização de pastas do projeto

O projeto está organizado com as seguintes pastas:

* **Banco_de_Dados**: Possui os arquivos de banco de dados, incluindo backup e modelos (conceitual, lógico e físico);
* **CRUD-Entidades**: Possui os modelos da aplicação e toda a parte de persistência de dados;
* **OptaPlanner-Solution**: Possui toda a lógica de negócio. Essa pasta contém toda a configuração e uso da ferramenta OptaPlanner em conjunto com o Drools.

## Minimundo

O coordenador de curso de Bacharelado em Sistemas de Informação do Ifes Campus Serra enfrenta problemas para elaborar o horário de cada semestre para os três cursos (técnico e graduação), pois é uma tarefa muito complexa, na qual tem de ser levado em conta diferentes regras e restrições. Além disso, envolve a disponibilidade de professores, salas, laboratórios, alunos (restrições e questões), e mais cessões de docentes para (e da) Automação e Cefor. Atualmente existe um software que o apoia. Porém, o atual software não ajuda muito, pois não atende algumas restrições.

Para alocar uma disciplina, o professor deve ter disponibilidade para atendê-la. A carga horária de cada professor não pode exceder um total de quarenta horas semanais. Cada professor precisa ter um intervalo mínimo de onze horas entre um determinado dia e o dia seguinte. Os professores também não devem ter um intervalo de mais de três horas em um dia. É desejável que os professores que moram mais perto do Campus, sejam alocados para os primeiros horários de aula do dia. É desejável que professores que moram longe, não estejam alocados a partir das 15 horas.

É desejável que as disciplinas e suas respectivas disciplinas que são pré-requisitos, estejam definidas no mesmo horário. Por exemplo, Cálculo 1 e Cálculo 2. As aulas da graduação devem terminar no máximo às 13:20.

Os setores administrativos precisam de horários para cuidar dos espaços, incluindo as salas e laboratórios. Tem que ser disponibilizado um laboratório para os alunos estudarem e um laboratório exclusivo para TCC e Projeto Integrador. É necessário que haja horários vagos para que um professor possa usar sempre que preciso (conforme dito em um recado no facebook).

## Integrantes do Grupo do Trabalho

* Cristian da Silva Anterio
* Danilo de Oliveira

## Relatório

De acordo com as especificações, o trabalho deve conter um relatório. Para elaborar e armazenar o relatório, utilizamos a Wiki do Github. Para acessar o relatório, basta clicar na aba Wiki desse repositório ou clicar nesse [link](https://github.com/sakamotto/projeto-flash/wiki).


