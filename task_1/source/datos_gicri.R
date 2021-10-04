# HAROL MAURICIO ORTEGON TORRES
# VERSION R 4.1.1
#
rm(list=ls())
require(pacman)
p_load(tidyverse,rio,skimr)

#=========#
# Punto 1 #
#=========#

1:100
n_1_100 = seq(1,100,1)
impares = seq(1,99,2)
pares = 
  
  a = 10:15
a
a[1]
a[4]
a[2]
a[-4]

1:5 %in% 3:6 

!1:5 %in% 3:6

!n_1_100  %in% impares
n_1_100[!n_1_100  %in% impares]

a[c(T,F,F,F,F,T)]


pares = n_1_100[!n_1_100  %in% impares]


#=========#
# Punto 2 #
#=========#

# importar datos
data = import("task_1/data/input/cultivos.xlsx")

# renombrar datos
colnames(data) = data[4,] %>% tolower()

# covertir codmpio en numerica
data$codmpio = as.numeric(data$codmpio)

# eliminar NA
data = data %>% drop_na(codmpio)

# convertir variables en numericas
years = 1999:2007 %>% as.character()
for(var in years){
  data[,var] = as.numeric(data[,var])
}

# pivotear los datos
pivot = data %>% pivot_longer(!coddepto:municipio,names_to="year",values_to="ha_cultivos")

#=========#
# Punto 3 #
#=========#

# punto 3

# cargar datos
df = import("task_1/data/input/homicidios_2020_.xls")


# renombrar variables

colnames(df) = df[9,] %>%  tolower()
df$`codigo dane` = as.numeric(df$`codigo dane`) 

# eliminar NA
df = df %>% drop_na(`codigo dane`)

df$cantidad = as.numeric(df$cantidad) 

df %>% summarise(total=sum(cantidad))



df %>% group_by(genero,`agrupa edad persona`) %>% summarise(total=sum(cantidad))


data = df %>% group_by(genero) %>% summarise(total=sum(cantidad))
ggplot(data=data,aes(x=genero,y=total)) + geom_bar(stat = "identity",position="dodge")


data = df %>% group_by(`armas medios`) %>% summarise(total=sum(cantidad))
ggplot(data=data,aes(x=`armas medios`,y=total)) + geom_bar(stat = "identity",position="dodge")

data = df %>% group_by(`agrupa edad persona`) %>% summarise(total=sum(cantidad))
ggplot(data=data,aes(x=`agrupa edad persona`,y=total)) + geom_bar(stat = "identity",position="dodge")


