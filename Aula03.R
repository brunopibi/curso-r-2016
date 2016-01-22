#aula3

#DPLYR
library(dplyr)
data(pnud_muni, package = 'abjutils')

pnud_muni <- tbl_df(pnud_muni)
pnud_muni

pnud_muni 

pnud_muni %>% tbl_df()%>% select(ano:municipio)


#SELECIONAR
pnud_muni  %>%  select(municipio,uf,ano,gini, starts_with("idhm"))

#FILTER
pnud_muni %>%
  select(ano, uf, municipio, idhm) %>%
  filter(uf==35, idhm > .8, ano==2010) #usar virgulas ou &

pnud_muni %>%
  select(ano, municipio, uf,gini, starts_with("idhm")) %>%
  filter(gini>0.5|idhm > .7, ano==2010) 

#MUTATE
pnud_muni %>%
  select(ano, municipio, uf,gini, starts_with("idhm")) %>%
  filter(ano==2010) %>%
  mutate(idhm2 = round(idhm * 100 ,1)) %>% tbl_df

#ARRRANGE
pnud_muni %>%
  select(ano, municipio, uf,gini, starts_with("idhm")) %>%
  filter(ano==2010) %>%
  mutate(idhm2 = round(idhm * 100 ,1)) %>% tbl_df %>%
  arrange(desc(idhm)) 

#SUMMARISE

pnud_muni %>% summarise(media = mean(idhm), dp = sd(idhm)) 

pnud_muni %>% group_by(ano) %>% summarise(media = mean(idhm), dp = sd(idhm)) 
  
pnud_muni %>% group_by(ano, ufn) %>% summarise(media = mean(idhm), dp = sd(idhm))

pnud_muni %>%
  filter(ano==2010) %>%  
  group_by(ufn) %>%
  summarise(n=n(),idhm_medio=mean(idhm),populacao_total=sum(popt)) %>%
  arrange(desc(idhm_medio))

#count
pnud_muni %>%
  filter(ano == 2010) %>%  
  count(ufn)

pnud_muni %>%
  filter(ano==2010) %>%  
  group_by(ufn) %>%
  summarise(media_ponderada = sum(espvida*popt)/sum(popt)) %>%
  arrange(desc(media_ponderada))


##
## --------------------
## TIDYR
library(tidyr)

#SPREAD
pnud_muni %>%
  group_by(ano, ufn) %>%
  summarise(populacao=sum(popt)) %>%
  ungroup()

#joga uma variavel nas colunas

pnud_muni %>%
  group_by(ano, ufn) %>%
  summarise(populacao=sum(popt)) %>%
  ungroup() %>%
  spread(ano, populacao)

#GATHER - EMPILHA O BANCO DE DADOS
pnud_muni %>%
  filter(ano == 2010) %>%
  select(ufn, municipio, starts_with('idhm_')) %>%
  gather(tipo_idh, idh, starts_with('idhm_'))
  


#EXERCICIO 3
install.packages('swirl')
library(swirl)
install_from_swirl('Getting and Cleaning Data')
swirl()


