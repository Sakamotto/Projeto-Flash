---
title: Documento de Requisitos
layout: post
author: Danilo de Oliveira
permalink: /documento-de-requisitos/
source-id: 1LXSAEiQU7f79dGxXmbvIrhqMUyEqQr0UCphLhxwZlpY
published: true
---
**Documento de Requisitos**

**Projeto**: Flash

**Registro de Alterações**:

<table>
  <tr>
    <td>Versão</td>
    <td>Responsável</td>
    <td>Data</td>
    <td>Alterações</td>
  </tr>
  <tr>
    <td>1.0</td>
    <td>Danilo de Oliveira
Cristian da Silva Anterio</td>
    <td>12/10/16</td>
    <td>Criação do documento</td>
  </tr>
  <tr>
    <td>1.1</td>
    <td>Danilo de Oliveira
Cristian da Silva Anterio</td>
    <td>05/11/16</td>
    <td>Melhoria da escrita do Minimundo</td>
  </tr>
</table>


### **Introdução**

O propósito do processo Gerência de Requisitos é gerenciar os requisitos do produto e dos componentes do produto do projeto e identificar inconsistências entre os requisitos, os planos do projeto e os produtos de trabalho do projeto (MPS.BR, 2012).

Esse documento está dividido em duas partes, sendo que a primeira é mais alto nível e possui a seção 2 que contém uma motivação a respeito do que deu origem ao projeto, a seção 3 possui o Minimundo descrevendo o contexto e as informações colhidas em entrevistas com o usuário e a seção 4 possui os requisitos levantados, bem como as histórias de usuário, que é um artefato utilizado na metodologia ágil SCRUM. A segunda parte é a especificação de requisitos e possui a seção 1 que contém diagramas estruturais e a seção 2 que contém um dicionário de dados.

### **Descrição do Propósito do Sistema**

Como já mencionado, o coordenador do curso BSI tem um grande problema na hora de distribuir a carga horária dos professores de uma determinada disciplina em um determinado espaço (laboratório/sala de aula), e precisa analisar diversos fatores internos e externos que impactam nesse processo.

O processo utilizado atualmente não é 100% eficaz e possui falhas. Quando essas falhas ocorrem, ele precisa alterar manualmente as alocações de horários, o que torna o processo ainda mais difícil. Sendo assim, o propósito do sistema é possibilitar o escalonamento de horários à disciplinas que obedeçam a maior parte possível das restrições de forma que minimize ao máximo ou não necessite de intervenção manual.

### **Descrição do Minimundo**

O coordenador de curso de Bacharelado em Sistemas de Informação do Ifes Campus Serra enfrenta problemas para elaborar o horário de cada semestre para os três cursos (técnico e graduação), visto que esta é uma tarefa muito complexa na qual deve-se levar em conta diferentes regras e restrições. Além disso tais questões, envolvem a disponibilidade de professores, salas, laboratórios, requisições dos alunos e cessões ou solicitações de docentes para (ou provenientes da) Automação e Cefor. Atualmente existe um software que o apoia. Porém, o atual software não ajuda muito, pois não atende algumas restrições.

Para alocar uma disciplina, o professor deve ter disponibilidade para atendê-la observadas as seguintes restrições:

1. A carga horária de cada professor não pode exceder um total de quarenta horas semanais.

2. Cada professor precisa ter um intervalo mínimo de onze horas entre um determinado dia e o dia seguinte.

3. Os professores também não devem ter um intervalo de mais de três horas em um dia entre blocos de aulas.

4. É desejável que os professores que moram mais perto do Campus, sejam alocados para os primeiros horários de aula do dia.

5. É desejável que professores que moram longe, não estejam alocados a partir das 15 horas (Quem ministra aulas a noite?).

6. É desejável que as disciplinas e suas respectivas disciplinas que são pré-requisitos, estejam definidas no mesmo horário. Por exemplo, Cálculo 1 e Cálculo 2. As aulas da graduação devem terminar no máximo às 13:20.

Com relação ao espaço de alocação:

1. Os setores administrativos precisam de horários para realização de eventos de manutenção preventiva e corretiva (salas, laboratórios, etc)

2. Deve-se alocar um laboratório para estudo que esteja disponível para os alunos.

3. Deve-se alocar um laboratório para trabalho que esteja disponível para os TCCs e Projetos Integradores.

4. É necessário que existam horários vagos para que um professor possa usar sempre que preciso.

### **Requisitos Funcionais**

<table>
  <tr>
    <td>Identificador</td>
    <td>Descrição</td>
    <td>Prioridade</td>
    <td>Depende de</td>
  </tr>
  <tr>
    <td>RF01</td>
    <td>O sistema deve permitir o registro e o controle de professores, disciplinas, turmas, área de conhecimento e curso.</td>
    <td>Alta</td>
    <td>-</td>
  </tr>
  <tr>
    <td>RF02</td>
    <td>O sistema deve construir um ou mais horários respeitando as restrições impostas</td>
    <td>Alta</td>
    <td>RF01, RF03, RN01, RN02, RN03, RN04, RN05, RN06, RN07</td>
  </tr>
  <tr>
    <td>RF03</td>
    <td>O sistema deve permitir o cadastro de professores em disciplinas.</td>
    <td>Alta</td>
    <td>RF01</td>
  </tr>
  <tr>
    <td>RF04</td>
    <td>O sistema deve permitir o registro de relações entre disciplinas.</td>
    <td>Alta</td>
    <td>RF01</td>
  </tr>
</table>


### **Regras de Negócio**

<table>
  <tr>
    <td>Identificador</td>
    <td>Descrição</td>
    <td>Prioridade</td>
    <td>Depende de</td>
  </tr>
  <tr>
    <td>RN01</td>
    <td>Um professor não pode lecionar no último horário de um dia e no primeiro horário do dia seguinte.</td>
    <td>Alta</td>
    <td>RF01</td>
  </tr>
  <tr>
    <td>RN02</td>
    <td>Um professor não pode ter um intervalo maior que 3 horas entre uma aula e outra.</td>
    <td>Alta</td>
    <td>RF01</td>
  </tr>
  <tr>
    <td>RN03</td>
    <td>As aulas da graduação devem terminar no máximo às 13:20.</td>
    <td>Média</td>
    <td>-</td>
  </tr>
  <tr>
    <td>RN04</td>
    <td>Os primeiros horários do dia são preferenciais para professores que moram mais próximo do campus.</td>
    <td>Média</td>
    <td>RF01</td>
  </tr>
  <tr>
    <td>RN05</td>
    <td>Disciplinas que tem relação de pré-requisito ou são equivalentes (Ex.: duas turmas de PROG1. Logo são equivalentes e são do mesmo período) devem estar alocadas no mesmo horário.</td>
    <td>Média</td>
    <td>RF04</td>
  </tr>
  <tr>
    <td>RN06</td>
    <td>Não pode haver duas disciplinas do mesmo período no mesmo horário</td>
    <td>Alta</td>
    <td>RF01</td>
  </tr>
  <tr>
    <td>RN07</td>
    <td>É desejável que professores que moram mais longe do campus não estejam alocados após às 15 horas.</td>
    <td>Baixa</td>
    <td>RF01</td>
  </tr>
</table>


