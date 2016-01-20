#VETORIZACAO

#ATOMIC VECTOR
var1 <- c(1,2.5,4.5) 

typeof(var1)

is.integer(var1) 
is.double(var1)

#COERCAO
c("a",1,TRUE,T)

#FACTORS

f <- factor(c("2", "3", "1", "10"))
as.numeric(f) #resulta ordem de menor p/ maior "3 4 1 2"

f <- factor(c("2", "3", "1", "10"))
as.numeric(as.character(f)) #transforma em character e resulta numero"

#MATRIZES E ARRAYS
vet <- c(1,2,3)

# Dois argumentos para determinar o número de linahs e colunas
mat <- matrix(1:6, ncol = 3, nrow = 2)

# Um vetor para descrever todas as dimensões
arr <- array(1:12, dim = c(3, 2, 2))


#-----------------------------------
#ESTRUTURA DE DADOS

#LISTA E DATA FRAMES

#Funcao list

lista <- list(
  c(1:5),
  c("homem", "mulher"),
  c(T, F, T),
  list(c(1,2,3), c("a", "b", "c"))
)
lista

#Funcao data.frame

df <- data.frame(x = 1:4, y = c("oi", "oi", "oi", "oi"), z = T)
df


df <- data.frame(x = 1:4, y = c("oi", "oi", "oi", "oi"), z = T)
str(df) #str = structure


df <- data.frame(x = 1:4, y = c("oi", "oi", "oi", "oi"), z = T, 
                 stringsAsFactors = F)
str(df) #para nao gerar string as Factor


#funcao names
names(df)

names(df) <- c("a", "b", "c")
names(df)

#--------------------------------------
#SUBSETTING

x <- c(13, 8, 5, 3, 2, 1, 1) 
x[c(1, 2, 3)]

order(x)
## [1] 6 7 5 4 3 2 1
x[order(x)]


#numeros negativos
x[-c(2, 5, 6)]

#VETORES LOGICOS
x == 8


#OUTRAS DIMENSOES
m <- matrix(c(1:5, 11:15), nrow = 5, ncol = 2)
m

m[5,2] #retorna linha 5, coluna 2 
m[,2] #retorna elementos da coluna 2
m[3,] #retorna elementos da coluna 1

m[c(1,5), ]

#DADOS INTERNOS
mtcars

#tres formas de trazer os dados da coluna 2 da tabela mtcars
mtcars[,2]
mtcars[[2]]
mtcars$cyl
mtcars[,'cyl']
#********************
mtcars[c(2,3)]


#FUNCOES ESTATISTICAS

summary(mtcars)

mean(mtcars$mpg) #"media"
median(mtcars$mpg)#mediana
var(mtcars$mpg)#variancia
sd(mtcars$mpg)
quantile(mtcars$mpg, c(0.25,0.5,0.75))
quantile(mtcars$mpg, 0:10/10)



table(diamonds$cut,diamonds$color, diamonds$clarity)

#Operador pipe %>%
install.packages("magrittr")
library(magrittr)

mean(mtcars$mpg)

mtcars$mpg %>% mean()

x <- c(1, 2, 3, 4)
x %>% sum %>% sqrt # ou x %>% sum() %>% sqrt()


esfrie(asse(coloque(bata(acrescente(recipiente(
  rep("farinha", 2), "água", "fermento", "leite", "óleo"), 
  "farinha", até = "macio"), duração = "3min"), 
  lugar = "forma", tipo = "grande", 
  untada = T), duração = "50min"), "geladeira", "20min")

recipiente(rep("farinha", 2), "água", "fermento", "leite", "óleo") %>%
  acrescente("farinha", até = "macio") %>%
  bata(duração = "3min") %>%
  coloque(lugar = "forma", tipo = "grande", untada = T) %>%
  asse(duração = "50min") %>%
  esfrie("geladeira", "20min")


TRUE %>% mean(c(NA, 1:101), na.rm = .)

1:101 %>%
  c(NA,.)%>%
  mean(na.rm = TRUE)

1:101 %>% c(NA)
#é a mesma coisa que c(1:101, NA)

1:101 %>% c(NA) %>% mean(na.rm = TRUE)
#é a mesma coisa que mean(1:101 %>% c(NA), na.rm=TRUE)

arq <- '_source/assets/dados/arq.txt'
dados <- read.table(file = arq)
  
  
  
dados <- read.table(file = arq, sep = ";") 
str(dados)