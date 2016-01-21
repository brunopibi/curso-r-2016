#EXERCICIOS AULA 01

#CALCULE O NUMERO DE OURO NO R 
(1+(sqrt(5)))/2
#[1] 1.618034

#o que da divisao de 1 por 0? E -1 por 0
1/0 #inf
-1/0 #-Inf

#Quais diferencas entre Nan, Null, Na e Inf
NaN
NULL
0/0

#calcule
5 + 3 * 10 %/% 3 == 15 
#acrescentando parenteses
5+(3*10) %/%3 ==15

# == serve pra comparação
x <- 4
if(x == 4) {
  'isso aqui apareceu'
}
x


#Elefante incomoda muita gente
for (i in 1:4){
  if(i %% 2 == 0){ #verifica se é numero par
    print(paste(i, "elefante(s)", paste(rep("incomoda(m)", times = i), collapse = " "), "muito mais"))
  } else {
    print(paste(i, "elefante(s) incomoda(m) muita gente")) #função paste serve pra concatenar as strings
  }
}

#criar um vetor
x <- c(1, 20, 40, 50, 60) # c - serve pra combinar um valor num vetor ou lista

#Crie um vetor com o nome x de 100 números aleatórios entre 0 e 1
x <- runif(100)

#Calcule a media dos valores anteriores
mean(x)

#Crie um vetor com 100 elementos. 
#99 deles são números aleatórios entre 0 e 1 
#e o último elemento tem o valor NA. #
#Calcule também a média deste vetor.

x <- c(runif(99),NA)
mean(x, na.rm = T)

#CRIA FUNCAO Q CALCULA MEDIA DE VETOR
media <- function(x){
i <- 1
tamanho <- length(x)
soma <- 0
for(i in 1:tamanho){
  soma <- soma + x[i]
}
return(soma/tamanho)
}


#CRIA UMA FUNCAO QUE SIMULE UM DADO
dado <- function(){
  sample(1:6, 1)

}

#SIMULACAO DE VARIOS DADOS

soma_dados <- function(n){
  soma <- 0
  for(i in 1:n){
    soma <- soma + dado()
  }
  return(soma)
}

#Faça um histograma dos resultados da soma de 3 dados. 
#Isto é, crie um vetor com 1000 resultados que 
#aconteceram após somar 3 dados. 
#Em seguida faça o histograma.

resultados <- integer(length = 1000)
for(i in 1:1000){
  resultados[i] <- soma_dados(3) #chama a funcao soma dados
}
hist(resultados)
