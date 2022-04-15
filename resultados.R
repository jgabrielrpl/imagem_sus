####
##
# Pacotes Utilizados ----

library(readr)
library(tidyverse)

####
##
# Grafico de barra ----

banco_grafico_coluna <- read_delim("bancos_de_dados/banco_grafico_coluna.csv", 
                                   delim = ";", escape_double = FALSE, 
                                   locale = locale(encoding = "ISO-8859-1"), 
                                   trim_ws = TRUE)

ggplot(banco_grafico_coluna) +
  aes(x = fct_reorder(palavra, contagem_palavra), weight = contagem_palavra) +
  geom_bar(fill = "#90949D", alpha= 0.5) +
  labs(x= NULL, y = "Número de reptições") +
  theme_classic() +
  theme(legend.title = element_text(family = "serif"), plot.caption = element_text(family = "serif"),
        axis.text = element_text(family ="serif", colour= 'gray8'))

####
##
# Grafico de barra, por mes ----

banco_grafico_coluna_mais_de_uma_linha <- read.csv("imagem_sus/bancos_de_dados/banco_grafico_coluna_mais_de_uma_linha.csv", sep=";")

ggplot(banco_grafico_coluna_mais_de_uma_linha) +
  aes(x = fct_reorder(mes, ordem_mes), fill = palavras, weight = contagem) +
  theme_classic() +
  geom_bar (alpha= 0.7, position = 'dodge') +
  labs(x= NULL, y = "Número de reptições", fill = "Palavras") +
  theme(legend.title = element_text(family = "serif"), plot.caption = element_text(family = "serif"),
        axis.text = element_text(family ="serif", colour= 'gray8'))
  