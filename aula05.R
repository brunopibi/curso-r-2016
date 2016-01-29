library(magrittr)
library(dplyr)
library(ggplot2)

mtcars

ajuste_lm <- lm(mpg ~wt, data = mtcars)

coeficientes <- coef(ajuste_lm)

ggplot(mtcars)+
  geom_point(aes(x=wt, y = mpg)) +
  geom_abline(intercept = coeficientes[1], slope = coeficientes[2])

summary(ajuste_lm)

library(tree)
install.packages("tree")

ajuste_tree <- tree(factor(am) ~ wt, data = mtcars)
summary(ajuste_tree)

plot(ajuste_tree)
text(ajuste_tree, pretty = 0)

# Árvore
table(mtcars$am, predict(ajuste_tree)[,"1"] > 0.5)

#SELECIONA A ARVORE COM 2 NOS
melhor_tree <- prune.tree(ajuste_tree, best = 2)
#GRAFICO QUE REPRESENTA A ARVORE MELHOR TREE
plot(melhor_tree)
text(melhor_tree, pretty = 0)

 set.seed(3)
 cv_tree <- cv.tree(ajuste_tree)
 cv_tree
 
cv_tree$size[which.min(cv_tree$dev)]

which.min(cv_tree$dev)
cv_tree$dev

plot(cv_tree)
