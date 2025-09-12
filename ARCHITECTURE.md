# Arquitetura e Convenções do Projeto Flutter – Endereçaí

## Objetivo

Este projeto visa fornecer uma solução para profissionais de saúde registrarem e acompanharem sessões clínicas com pacientes. A aplicação permitirá:

- Desenvolver um aplicativo de busca de CEP;
- Utilizar a API do ViaCEP para realizar as consultas (https://viacep.com.br/);
- Personalizar o ícone e nome do aplicativo (você tem liberdade de escolha);
- Incorporar uma tela de abertura (SplashScreen) com o mesmo ícone utilizado para o aplicativo;
- Criar uma tela inicial que contenha um campo de entrada de texto, que deve validar um CEP inserido pelo usuário, e um botão para iniciar a busca;
- Quando nenhuma informação relacionada ao CEP inserido for encontrada, exibir uma mensagem de feedback ao usuário;
- Implementar uma segunda tela para apresentar as informações obtidas após a consulta do CEP;
- Utilizar um banco de dados local para armazenar os resultados válidos de pesquisas anteriores realizadas pelos usuários e, sempre que possível, utilizar essas informações ao executar novas consultas;
- Oferecer suporte para temas "light" e "dark", permitindo que os usuários alterem o tema diretamente no aplicativo.

---

## Arquitetura Proposta

### Clean Architecture

A arquitetura do projeto seguirá o padrão **Clean Architecture**, promovendo uma separação clara de responsabilidades entre as camadas da aplicação:

- **Presentation**: Widgets e Gerenciamento de Estado.
- **Application**: Casos de uso.
- **Domain**: Entidades e contratos (interfaces).
- **Data**: Implementações de repositórios, datasources e serviços externos.

**Vantagens:**

- Alta testabilidade.
- Independência de frameworks.
- Baixo acoplamento e alta coesão.

---

## Padrões de Projeto (Design Patterns)

- **Repository Pattern**: Abstração de dados que permite trocar fontes (ex: local vs. remoto).
- **Use Case (Command Pattern)**: Encapsula lógica de negócio de forma reutilizável e testável.
- **Dependency Injection (Service Locator / Provider / GetIt)**: Para facilitar a injeção e o controle de dependências.
- **Factory Pattern**: Criação de objetos complexos (ex: a partir de JSON).

---

## Organização de Pastas

```
lib/
├── core/
│   ├── utils/
│   └── constants/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories_impl/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── pages/
│   ├── widgets/
│   └── controllers/ ou bloc/
├── app.dart
└── main.dart
```

---
## Themes

Elemento
Tema Light
Tema Dark
Cor Principal (acentos, ícones, botões)
🔶 Laranja #FF6F00
🔶 Laranja #FF6F00
Fundo Primário
⚪ Branco #FFFFFF
⚫ Preto suave #121212
Fundo Secundário (cards, caixas)
🔳 Cinza claro #F5F5F5
🔳 Cinza carvão #1E1E1E
Cor de Destaque Secundário
🔵 Azul claro #29B6F6
🔵 Azul suave #29B6F6
Texto Primário
⚫ Preto suave #212121
⚪ Branco #FFFFFF
Texto Secundário
⚫ Cinza médio #757575
⚫ Cinza claro #B0BEC5
Sucesso
✅ Verde #00C853
✅ Verde #00C853
Erro
❌ Vermelho #E53935
❌ Vermelho #E53935

---

## Bibliotecas Recomendadas

- `dio` – Requisições HTTP.
- `intl` – Manipulação de datas e formatações.
- `flutter_localizations` – Suporte à internacionalização.

---

## Regras Gerais

### Nomenclatura

- Arquivos e pastas: `snake_case`
- Classes: `PascalCase`
- Variáveis e métodos: `camelCase`
- Constantes: `SCREAMING_SNAKE_CASE`

**Exemplos:**

```dart
// Correto
class PatientModel {}
final sessionController = Provider((ref) => SessionController());

// Errado
class patientmodel {}
final Session_controller = provider(() => new sessioncontroller());
```

---

## Convenções de Código

- Sempre tipar explicitamente variáveis públicas e parâmetros.
- Evitar lógica de negócio em Widgets.
- Preferir composição a herança.
- Separar camadas com interfaces e evitar dependências circulares.

---

## Boas Práticas

- Criar testes unitários para `usecases` e `repositories`.
- Tratar exceções com `Either`, `Result` ou `sealed classes`.
- Utilizar logs apenas no modo `debug`.
- Escrever documentação para casos de uso e entidades principais.

---

## Geração de Resumo por IA

Cada sessão terá um botão “Gerar Resumo”, que acionará um caso de uso específico que utilizará um serviço de IA (a ser definido, como OpenAI API ou outro serviço de LLM). Esse serviço deve ser abstraído via repositório e tratado como uma dependência externa.

