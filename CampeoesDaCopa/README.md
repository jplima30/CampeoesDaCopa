# 🏆 Campeões da Copa - Copa 2026

Um aplicativo SwiftUI moderno com design **Liquid Glass** para celebrar os campeões históricos da Copa do Mundo e antecipar a Copa de 2026!

## ✨ Funcionalidades

- **Design Liquid Glass**: Interface moderna com efeitos de vidro fosco, gradientes animados e transparências
- **Copa 2026 em Destaque**: Card especial com informações sobre a próxima Copa nos EUA, México e Canadá
- **Histórico Completo**: Todos os campeões desde 1930 até 2022
- **Detalhes de Cada Edição**: Informações detalhadas sobre finais, contexto histórico e curiosidades
- **Animações Fluidas**: Efeitos visuais de fluxo líquido no background
- **Cards Interativos**: Grid de cards com efeito glassmorphism

## 🎨 Design System

### Cores
- Gradiente principal: Azul profundo → Azul céu → Verde água → Verde
- Acentos: Amarelo ouro (troféu), Branco (texto)
- Efeito glass: Transparências com blur

### Componentes
- `GlassCardView`: Cards com efeito de vidro fosco
- `LiquidGlassBackground`: Background com gradiente translúcido
- `LiquidFlowEffect`: Animação de bolhas fluindo
- `Copa2026Gradient`: Gradiente temático da Copa

## 📱 Estrutura do Projeto

```
CampeoesDaCopa/
├── SwiftUI/
│   ├── CampeoesDaCopaApp.swift    # Entry point do app
│   ├── Models/
│   │   └── WorldCup2026.swift     # Modelos de dados
│   └── Views/
│       ├── ContentView.swift      # Tela principal
│       ├── DetailView.swift       # Detalhes de cada copa
│       └── LiquidGlassModifier.swift  # Modificadores de design
└── Controllers/                   # Código UIKit legado
```

## 🚀 Como Usar

1. Abra o projeto no Xcode 14+
2. Selecione um simulador ou dispositivo iOS 16+
3. Execute o projeto (⌘R)

## 📋 Requisitos

- iOS 16.0+
- Xcode 14.0+
- Swift 5.7+

## 🎯 Destaques da Copa 2026

- **48 seleções** participantes (expansão histórica)
- **3 países-sede**: Estados Unidos, México e Canadá
- **104 jogos** no total
- **16 cidades-sede** na América do Norte

## 🏅 Campeonatos Incluídos

Todos os campeões desde 1930:
- Uruguai (1930, 1950)
- Itália (1934, 1938, 1982, 2006)
- Brasil (1958, 1962, 1970, 1994, 2002)
- Alemanha (1954, 1974, 1990, 2014)
- Argentina (1978, 1986, 2022)
- Inglaterra (1966)
- França (1998, 2018)
- Espanha (2010)

## 🛠️ Tecnologias

- **SwiftUI**: Framework declarativo para UI
- **Swift 5.7+**: Linguagem moderna da Apple
- **iOS 16+**: APIs modernas de navegação e animação
- **Glassmorphism**: Tendência de design com efeitos de vidro

## 📸 Screenshots

O app apresenta:
- Header com troféu animado e título "Campeões da Copa"
- Card destacado da Copa 2026 com barra de progresso
- Grid de cards com todas as edições históricas
- Tela de detalhes com informações completas de cada final

## 👨‍💻 Desenvolvimento

Este projeto foi criado como demonstração de:
- Design system Liquid Glass/Glassmorphism
- Uso moderno de SwiftUI
- Manipulação de dados históricos
- Animações e transições fluidas

## 📄 Licença

Projeto desenvolvido para fins educacionais e de demonstração.

---

**Desenvolvido com ❤️ para a Copa 2026**
