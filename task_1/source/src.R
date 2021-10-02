#Task 1
#TALLER B 
#Elaborado por Max Gomez
#Version de R: 4.1.1

#-----------------------TALLER B----------------------

rm(list = ls())

#Importare paquetes necesarios para mis soluciones

library(pacman)
library(rio)
library(readr)

#1. Organizar GEIH

#1.1 Importar base de datos. 
#

#Nota: Importar en el orden que esta el codigo, tnato para 2019 y 2020 porque
#en la fila ___ del codigo es importante que esten en ese mismo orden

#Datos 2019
# Los importa como dataframes
`Cabecera - Caracteristicas generales (Personas)` <- readRDS("~/TallerR/task1/task_r_202102/task_1/data/input/2019/Cabecera - Caracteristicas generales (Personas).rds")
`Cabecera - Desocupados` <- readRDS("~/TallerR/task1/task_r_202102/task_1/data/input/2019/Cabecera - Desocupados.rds")
`Cabecera - Fuerza de trabajo` <- readRDS("~/TallerR/task1/task_r_202102/task_1/data/input/2019/Cabecera - Fuerza de trabajo.rds")
`Cabecera - Inactivos` <- readRDS("~/TallerR/task1/task_r_202102/task_1/data/input/2019/Cabecera - Inactivos.rds")
`Cabecera - Ocupados` <- readRDS("~/TallerR/task1/task_r_202102/task_1/data/input/2019/Cabecera - Ocupados.rds")
`Resto - Caracteristicas generales (Personas)` <- readRDS("~/TallerR/task1/task_r_202102/task_1/data/input/2019/Resto - Caracteristicas generales (Personas).rds")
`Resto - Desocupados` <- readRDS("~/TallerR/task1/task_r_202102/task_1/data/input/2019/Resto - Desocupados.rds")
`Resto - Fuerza de trabajo` <- readRDS("~/TallerR/task1/task_r_202102/task_1/data/input/2019/Resto - Fuerza de trabajo.rds")
`Resto - Inactivos` <- readRDS("~/TallerR/task1/task_r_202102/task_1/data/input/2019/Resto - Inactivos.rds")
`Resto - Ocupados` <- readRDS("~/TallerR/task1/task_r_202102/task_1/data/input/2019/Resto - Ocupados.rds")


#Lista cuyos elementos son los dataframes con la informacion del 2019. mget(ls()) retorna los objetos que tengo en el environment hasta el momento
data_2019 = mget(ls()) 
#Remueve los objetos del environment diferentes al objeto data_2019
rm(list = setdiff(ls(),"data_2019"))

#vector con las variables que queremos dejar para cada modulo:
variables = c('directorio','secuencia_p','orden',
              'p6020', 'p6040', 'p6920', 'inglabo',
              'dpto', 'fex_c_2011', 'esc', 'mes','p6050')


#Los nombres de las columnas entre dataframes no son homogeneos (algunos nombres empiezan por mayuscula, por ejemplo).
#aplico tolower() al vector de nombres de cada dataframe.
for (i in 1:10){
  
  names(data_2019[[i]]) <- tolower(names(data_2019[[i]]))
  
}

#El anterior for era necesario para poder seleccionar para cada dataframe las columnas 
#que nos interesan i.e., las que estan en el vector variables.
#No consegui un parámetro en la funcion any_of que permitiera ignorar mayusculas/minusculas
#Por eso di toda esta vuelta
for(i in 1:10){
  data_2019[[i]] <- select(data_2019[[i]],any_of(variables))
}



#Datos 2020
Cabecera_Caracteristicas_generales_Personas_ <- read_delim("task_1/data/input/2020/Cabecera - Caracteristicas generales (Personas).csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
Cabecera_Desocupados <- read_delim("task_1/data/input/2020/Cabecera - Desocupados.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
Cabecera_Fuerza_de_trabajo <- read_delim("task_1/data/input/2020/Cabecera - Fuerza de trabajo.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
Cabecera_Inactivos <- read_delim("task_1/data/input/2020/Cabecera - Inactivos.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE)
Cabecera_Ocupados <- read_delim("task_1/data/input/2020/Cabecera - Ocupados.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
Resto_Caracteristicas_generales_Personas_ <- read_delim("task_1/data/input/2020/Resto - Caracteristicas generales (Personas).csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
Resto_Desocupados <- read_delim("task_1/data/input/2020/Resto - Desocupados.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
Resto_Fuerza_de_trabajo <- read_delim("task_1/data/input/2020/Resto - Fuerza de trabajo.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
Resto_Inactivos <- read_delim("task_1/data/input/2020/Resto - Inactivos.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
Resto_Ocupados <- read_delim("task_1/data/input/2020/Resto - Ocupados.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)


#No se porque RStudio guarda las variables de un for en la lista de values del environment, si en teoría son temporales. 
rm(i)


#Lista cuyos elementos son los dataframes con la info del 2020. 
data_2020 =  mget(setdiff(ls(), c("data_2019","variables")))

#Remueve los objetos del environment diferentes al objeto data_2019,variables y data_2020
rm(list = setdiff(ls(),c("data_2019","variables","data_2020")))

#Los nombres de las columnas entre dataframes no son homogeneos (algunos nombres empiezan por mayuscula, por ejemplo).
#aplico tolower() al vector de nombres de cada dataframe.
for (i in 1:10){
  
  names(data_2020[[i]]) <- tolower(names(data_2020[[i]]))
  
}

#El anterior for era necesario para poder seleccionar para cada dataframe las columnas 
#que nos interesan i.e., las que estan en el vector variables.

for(i in 1:10){
  data_2020[[i]] <- select(data_2020[[i]],any_of(variables))
}

#Las listas data_2019 y data_2020 tienen en el mismo orden los dataframes
#i.e., El df de Caracteristicas generales de cabecera del 2019 esta en posicion 1 en data_2019
# y el df de Caracteristicas generales ' ' esta en posicion 1 en data_2020. Y así con el resto de dataframes

##Falta la variable categorica para 'ocupados', 'inactivos', desocupados', 'fuerza de trabajo'
data_2019[[2]]$CDes <- 1
data_2019[[3]]$CTra <- 1
data_2019[[4]]$CIna <- 1
data_2019[[5]]$COcu <- 1

data_2019[[7]]$RDes <- 1
data_2019[[8]]$RTra <- 1
data_2019[[9]]$RNac <- 1
data_2019[[10]]$RCup <- 1



data_2020[[2]]$CDes <- 1
data_2020[[3]]$CTra <- 1
data_2020[[4]]$CIna <- 1
data_2020[[5]]$COcu <- 1

data_2020[[7]]$RDes <- 1
data_2020[[8]]$RTra <- 1
data_2020[[9]]$RNac <- 1
data_2020[[10]]$ROcu <- 1

#Por ultimo agregare a cada df una variable año para saber a que año corresponde la encuesta

for (i in 1:10){
  
  data_2019[[i]]$ano <- 2019
  
}

#El anterior for era necesario para poder seleccionar para cada dataframe las columnas 
#que nos interesan i.e., las que estan en el vector variables.

for(i in 1:10){
  data_2020[[i]]$ano <- 2020
}





