####
##
# Pacotes Utilizados ----

library(readr)
library(tidyverse)

# Abrir bancos ----



banco_linha <- read_delim("bancos_de_dados/banco_grafico_de_linha.csv", 
                          delim = ";", locale = locale(encoding = "ISO-8859-2"))

banco_grafico_coluna_mais_de_uma_linha <- read_delim("bancos_de_dados/banco_grafico_coluna_mais_de_uma_linha.csv",
                                                     delim= ";", locale = locale(encoding = "ISO-8859-2"))


banco_grafico_coluna <- read_delim("bancos_de_dados/banco_grafico_coluna.csv", 
                                   delim = ";", escape_double = FALSE, 
                                   locale = locale(encoding = "ISO-8859-1"), 
                                   trim_ws = TRUE)


####
##
# Grafico de barra ----

grafico_coluna <- ggplot(banco_grafico_coluna) +
  aes(x = fct_reorder(palavra, contagem_palavra), weight = contagem_palavra) +
  geom_bar(fill = "#526200", alpha= 0.5) +
  labs(x= NULL, y = "Número de reptições") +
  theme_classic() +
  theme(legend.title = element_text(family = "serif"), plot.caption = element_text(family = "serif"),
        axis.text = element_text(family ="serif", colour= 'gray8'), 
        axis.text.y = element_text(size = 16), 
        axis.text.x = element_text(size = 16),
        axis.title.y = element_text(size = 16)) 

ggsave("grafico_coluna.png", width = 14, height = 8)

####
##
# Grafico de barra, por mes ----

grafico_barras <- ggplot(banco_grafico_coluna_mais_de_uma_linha) +
  aes(x = fct_reorder(mes, ordem_mes), fill = palavras, weight = contagem) +
  theme_classic() +
  MetBrewer::scale_fill_met_d(name="Degas")+
  geom_bar (alpha= 0.7, position = 'dodge') +
  labs(x= NULL, y = "Número de reptições das palavras", fill = NULL) +
  theme(legend.title = element_text(family = "serif"), plot.caption = element_text(family = "serif"),
        axis.text = element_text(family ="serif", colour= 'gray8'), legend.position = "bottom", 
        axis.text.y = element_text(size = 16), 
        axis.text.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        legend.text = element_text(size = 16))+ 
  guides(fill = guide_legend(nrow = 1))+
  geom_vline(xintercept = c(1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5), 
             linetype = "dashed", alpha =0.3)

ggsave("grafico_barras.png", width = 16, height = 8)


###
##
# grafico de linha ----

grafico_linha <- banco_linha %>% 
  ggplot(aes(x = rotulos_de_linha,y = `contagem_palavras `, group = 1))+
  #ggalt::geom_xspline(size = 1.3)+
  geom_line(col = "#526200", stat = "identity", size = 1.7, alpha = 0.7)+
  geom_point(col = "#526200",size = 2)+
  theme_classic()+
  scale_x_discrete(limits= c("Março", "Abril", "Maio", "Junho","Julho", 
                             "Agosto", "Setembro", "Outubro"))+
  labs(x= NULL, y = NULL)+
  theme(legend.title = element_text(family = "serif"), plot.caption = element_text(family = "serif"),
        axis.text = element_text(family ="serif", colour= 'gray8'), legend.position = "bottom",
        axis.text.y = element_text(size = 16), 
        axis.text.x = element_text(size = 16),
        axis.title.y = element_text(size = 16))

ggsave("grafico_linha.png", width = 10, height = 6)
  