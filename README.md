# Lotus Rail
 
Lotus Rail é um jogo que surgiu a partir da paixão dos seus 4 desenvolvedores: Terror. O jogo tem como objetivo criar uma experiência que permita ao usuário ter reflexões sobre assuntos primordiais como: Medo, Tensão e mistério, tudo isso para embarcar em um jogo que fala da transição da vida para a morte. A partir dessa ideia o jogo foi desenvolvido para o Iphone onde pudemos explorar puzzles que o estado da arte e mecanicas básicas para explorar ao máximo a imersão do usuário no jogo. 

## Tecnologias Utilizadas para o Desenvolvimento

O jogo foi desenvolvido utilizando a Linguagem [Swift](https://swift.org) e os seguintes frameworks:

* [GameplayKit](https://developer.apple.com/documentation/gameplaykit) - Utilizado para formar a lógica de desenvolvimento(Entides e Componentes) 
* [SpriteKit](https://developer.apple.com/spritekit/) - Utilizado para suportar a textura das imagens, as animaçoes e etc. 
* [AVFoundation](https://developer.apple.com/av-foundation/) - Utilizado para auxiliar no Sound Design implementado no jogo
* [Foundation](https://developer.apple.com/documentation/foundation) - Utilizado para suportar as extensões do projeto

## Estado da Arte 

O [Estado da arte](hiperLink: https://pt.wikipedia.org/wiki/Estado_da_arte) é o nível mais alto de desenvolvimento, seja de um aparelho, de uma técnica ou de uma área científica. Para esse projeto, está técnica foi inseridas no jogo para que o usuário pudesse resolver puzzles e enigmas a partir de um formato fora do usual. O estado da arte foi explorado através das possibilidades que o dispositivo iPhone nos dá, tais como "Long pressure" e "Brightness level". 

Para criar um puzzle utilizando o "Brightness Level" foi necessário pegar o valor de luminosidade da tela para esconder os inimigos (coloca o alpha deles com valor 0). Quando o jogador aumenta a luminosidade do dispositivo acima de 60% o alpha dos inimigos se tornam maior que 0 e é possível enxergá-los.
Para pegar a luminosidade do dispositivo usou-se o comando:

```
let luminosidade: CGFloat = UIScreen.main.brightness
```

## Colaboradores

* **Eliza Carvalho** - *iOS Developer* - [Github](https://github.com/eliza-pc)
* **Robson James** - *iOS Developer* - [Github](https://github.com/James-1997)
* **Lucidio Souza** - *iOS Developer* - [Github](https://github.com/LucidioABS)
* **André Aphonso** - *Designer* 


