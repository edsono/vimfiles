% Título
% Author
% Data

# Título do Slide

**Item**

> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
> ut pretium tristique, nunc

**Item**

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
ut pretium tristique, nunc

**Item**

- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
  ut pretium tristique, nunc


# Múltiplos sub-títulos

## Um sub-título

- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
  ut pretium tristique, nunc

## Outro sub-título

- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
  ut pretium tristique, nunc


# Troca de Cor de Fundo { data-background="#74B89F" }

Fundo verde


# Troca de Cor de Fundo { data-background="#FA7F77" }

Fundo vermelho


# Só texto

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
ut pretium tristique, nunc

# Só bloco

> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
> ut pretium tristique, nunc


# Só fórmula

**Inline**

$\lim_{x \to y} f(x) = L$

**Display Math**

$$
\lim_{x \to y} f(x) = L
$$


# Só código

~~~~haskell 
{-# LANGUAGE TypeSynonymInstances #-}
module Network.UDP
( DataPacket(..)
, openBoundUDPPort
, openListeningUDPPort
) where

import qualified Data.ByteString as Strict (ByteString, concat, singleton)
import Data.ByteString.Char8 (pack, unpack)

-- Type class for converting StringLike types to and from strict ByteStrings
class DataPacket a where
  toStrictBS :: a -> Strict.ByteString
  fromStrictBS :: Strict.ByteString -> a

openBoundUDPPort :: String -> Int -> IO Socket
openBoundUDPPort uri port = do
  s <- getUDPSocket
  bindAddr <- inet_addr uri
  let a = SockAddrInet (toEnum port) bindAddr
  bindSocket s a
  return s
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Só tabela - simples

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

Table:  Demonstration of simple table syntax.


# Só tabela - grid

: Sample grid table.

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+


# Só Lista Ordenada

1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
   ut pretium tristique, nunc

2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
   ut pretium tristique, nunc

3. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
   ut pretium tristique, nunc


# Só Lista Não Ordenada

- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
  ut pretium tristique, nunc

- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
  ut pretium tristique, nunc

- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis, massa
  ut pretium tristique, nunc


