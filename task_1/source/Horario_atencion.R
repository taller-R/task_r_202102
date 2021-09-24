#


#
rm(list=ls())
require(pacman)
p_load(tidyverse,rio)


# Punto 1
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


# punto 3
cabe_cg = readRDS("task_1/data/input/2019/Cabecera - Caracteristicas generales (Personas).rds")
cabe_res = readRDS("task_1/data/input/2019/Resto - Caracteristicas generales (Personas).rds")



data = storms
data$ts_diameter = ifelse(test = is.na(data$ts_diameter)==T, -1 ,  data$ts_diameter)

data = data %>% mutate(hu_diameter = ifelse(test = is.na(hu_diameter)==T, -1 ,hu_diameter))

SI(CONDICION,SI,NO)
IFELSE(CONDICION,SI,NO)



IF()