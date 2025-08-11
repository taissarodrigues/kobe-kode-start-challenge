# kobe_rick_and_morty_challenge

Desafio : Rick and Morty App - Kode Start 2025

Este repositório contém a solução para o desafio de desenvolvimento Flutter proposto no evento **Kode Start 2025**, organizado pela Kobe.

Por: Taissa Rodrigues

---

## Sobre o projeto

Este projeto é um **fork** do repositório original **Kobe Start Challenge**. A partir dele, desenvolvi 
um app Flutter chamado **Kobe Rick and Morty Challenge**, que consome a API oficial da série Rick and Morty para exibir informações dos personagens.

---

## Funcionalidades implementadas

- Listagem de personagens com cards exibindo nome e imagem.
- Navegação para tela de detalhes ao tocar em um personagem.
- Tela de detalhes exibindo:
  - Nome
  - Imagem
  - Espécie
  - Gênero
  - Status
  - Origem
  - Última localização
  - Primeira aparição
- Menu drawer para navegação entre as telas Characters e About.
- Tela de perfil com informações estáticas (nome, email, usuário).
- Tema escuro utilizando Material 3.
- Testes unitários para a camada de dados (repositório).
- Testes de widget para componentes importantes da tela incial(AppBarwidget).

---

## Arquitetura e boas práticas

- Separação clara entre lógica de dados e interface.
- Uso de modelos para mapear JSON da API em objetos Dart.
- Navegação estruturada via `onGenerateRoute`, com passagem de argumentos.
- Componentização para garantir reaproveitamento e limpeza no código.
- Uso do SafeArea para respeitar áreas seguras do dispositivo.
- Tratamento de carregamento assíncrono e erros na requisição HTTP.
- Testes automatizados para garantir estabilidade do código.

 É uma base sólida que pode ser facilmente estendida e aprimorada.


]  

