
# llamar librerias y limpiar entorno
rm(list=ls())
require(pacman)
p_load(tidyverse,rio)


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



