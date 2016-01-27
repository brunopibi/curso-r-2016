#AULA 04

library(ggplot2)

#GRAFICOS
ggplot(data = mtcars, aes(x= disp, y = mpg)) + geom_point()
#OUTRO MODO DE FAZER
ggplot(data = mtcars) +
  geom_point(aes(x= disp, y = mpg))

#ALTERA CORES DOS DADOS
ggplot(data = mtcars) +
  geom_point(aes(x= disp, y = mpg, colour = as.character(am)))

#ALTERA TAMANHOS 
ggplot(data = mtcars) +
  geom_point(aes(x= disp, y = mpg, colour = as.character(am), size = cyl))

#outra forma
ggplot(data = mtcars) +
  geom_point(aes(x= disp, y = mpg), colour = "blue", size = 5, shape = 2)

#outra forma
ggplot(data = mtcars) +
  geom_boxplot(aes(x= as.character(gear), y= mpg, fill = as.character(gear)))

head(economics)

ggplot(economics, aes(date,unemploy)) + geom_line()


head(diamonds)

#HISTOGRAMA DO PRECO DOS DIAMANTEs
ggplot(diamonds, aes(price)) + 
  geom_histogram()

ggplot(diamonds, aes(price)) + 
  geom_histogram(colour = "white")

ggplot(diamonds, aes(price)) + 
  geom_histogram(colour = "white", fill = "blue")


cor(diamonds$price,diamonds$carat)
ggplot(data=diamonds, aes(x=carat,y=price)) + geom_point()

ggplot(data=diamonds, aes(x=carat,y=price)) + geom_point(alpha=0.1)

ggplot(data=diamonds, aes(x=carat,y=price)) + geom_point(alpha=0.1, aes(colour = cut))

ggplot(data=diamonds, aes(x=carat,y=price)) + 
  geom_point(alpha=0.1, aes(colour = cut)) +
  facet_wrap(~cut)

ggplot(data=diamonds, aes(x=carat,y=price)) + 
  geom_point(aes(colour = cut)) +
  geom_point(size=2, alpha=0.1) +
  facet_wrap(~cut)

ggplot(data=diamonds, aes(x=carat,y=price)) +
  geom_point(size=2, alpha=0.1) +
  geom_point(aes(colour = cut)) +
  facet_wrap(~cut)

ggplot(data=diamonds, aes(x=carat,y=price)) +
  geom_point(aes(colour = cut)) +
  facet_wrap(~cut) +
  labs(x="Peso em Quilates", y= "Preço (U$)", colour = "Corte")


#******************************
economics

View(economics)

ggplot(economics,aes(x= date, y= unemploy)) + geom_line()
ggplot(economics,aes(x= date, y= uempmed)) + geom_line()

economics %>%
  mutate(
    unemploy = (unemploy-min(unemploy))/(max(unemploy)-min(unemploy)),
    uempmed = (uempmed-min(uempmed))/(max(uempmed)-min(uempmed))) %>%
  ggplot(aes(date,unemploy))+
  geom_line()+
  geom_line(aes(y= uempmed), colour="blue")

library(tidyr)
economics %>% 
  select(date,unemploy,uempmed) %>%
  gather(indice,valor,-date)%>%
  group_by(indice)%>%
  mutate(valor_pad = (valor-min(valor))/(max(valor)-min(valor))) %>%
  ggplot(aes(x=date,y=valor_pad, colour=indice))+
  geom_line()+
  scale_color_manual("Indice", values = c("red","blue"), labels = c("Desemprego", "Tempo de Desemprego"))+
  labs(x="Data", y="Valor")

#COLOCAR UMA RETA DE REGRESSAO EM UM GRAFICO DE DISPERSAO
ggplot(data=diamonds%>% sample_n(10000), aes(x=carat,y=price)) +
  geom_point()

coef(lm(price ~carat, data = diamonds))

ggplot(data=diamonds%>% sample_n(10000), aes(x=carat,y=price, colour = cut)) +
  geom_point() +
  geom_smooth(method="lm")+
  geom_abline(intercept = -2256.361, slope =7756.426,  color = "blue",linetype = "dashed", size= 1)

ggplot(data=diamonds%>% sample_n(10000), aes(x=carat,y=price, colour = cut)) +
  geom_point() +
  geom_smooth(method="lm")+
  facet_wrap(~cut)
  geom_abline(intercept = -2256.361, slope =7756.426,  color = "blue",linetype = "dashed", size= 1)
  
  
  #GRAFICO DE BARRAS: Quantidade de veiculos por classe
  
  table(diamonds$cut)
  diamonds %>%
    group_by(cut)%>%
    summarise(n=n())%>%
    ggplot(aes(x=cut,y=n, fill = cut))+ 
    geom_bar(stat="identity")
  
  #COM PERCENTUAL GRAFICO DE PIZZA
  diamonds %>%
    group_by(cut)%>%
    summarise(n=n())%>%
    mutate(perc = n/sum(n)) %>%
    ggplot(aes(x=1,y=perc,fill=cut))+ 
    geom_bar(stat="identity") +
    coord_polar(theta="y")
  
         