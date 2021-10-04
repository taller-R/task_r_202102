#Task 1
#TALLER B 
#Elaborado por Max Gomez
#Version de R: 4.1.1

#-----------------------TALLER B----------------------

#--------------------Organizar GEIH-------------------



#Importare paquetes necesarios para mis soluciones

library(pacman)
library(rio)
library(readr)
library(tidyr)
library(tidyverse)
library(skimr)
library(treemap)
p_load(RColorBrewer, ggthemes)

rm(list = ls())

#1.1 Importar base de datos. 


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


#Los nombres de las columnas entre dataframes no son homogeneos (por ejemplo algunos nombres empiezan por mayuscula y otros no).
#aplico tolower() al vector de nombres de cada dataframe.
for (i in 1:10){
  
  names(data_2019[[i]]) <- tolower(names(data_2019[[i]]))
  
}

#El sigueinte codigo es necesario para poder seleccionar para cada dataframe las columnas 
#que nos interesan i.e., las que estan en el vector variables.
#No consegui un parámetro en la funcion any_of que permitiera ignorar mayusculas/minusculas
#Por eso escribi el anterior for.
for(i in 1:10){
  data_2019[[i]] <- select(data_2019[[i]],any_of(variables))
}



#-----------Datos 2020
#Hacemos lo mismo que hicimos para los datos del 2019

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

#Los nombres de las columnas entre dataframes no son homogeneos (algunos nombres empiezan por mayuscula y otros no).
#aplico tolower() al vector de nombres de cada dataframe.
for (i in 1:10){
  
  names(data_2020[[i]]) <- tolower(names(data_2020[[i]]))
  
}


for(i in 1:10){
  data_2020[[i]] <- select(data_2020[[i]],any_of(variables))
}

#Las listas data_2019 y data_2020 tienen en el mismo orden los dataframes
#i.e., El df de Caracteristicas generales de cabecera del 2019 esta en posicion 1 en data_2019
# y el df de Caracteristicas generales ' ' esta en posicion 1 en data_2020. Y así con el resto de dataframes

##Anadir variable categorica para 'ocupados', 'inactivos', desocupados', 'fuerza de trabajo'
#para cada año de cabecera y resto.
data_2019[[2]]$CDes <- 1
data_2019[[3]]$CTra <- 1
data_2019[[4]]$CIna <- 1
data_2019[[5]]$COcu <- 1

data_2019[[7]]$RDes <- 1
data_2019[[8]]$RTra <- 1
data_2019[[9]]$RIna <- 1
data_2019[[10]]$ROcu <- 1



data_2020[[2]]$CDes <- 1
data_2020[[3]]$CTra <- 1
data_2020[[4]]$CIna <- 1
data_2020[[5]]$COcu <- 1

data_2020[[7]]$RDes <- 1
data_2020[[8]]$RTra <- 1
data_2020[[9]]$RIna <- 1
data_2020[[10]]$ROcu <- 1



#############################################
#------------1.2 Unir Datos -----------------
##############################################


#Inicializar llaves de los dataframes para hacer los joins

keys = c("directorio","secuencia_p","orden","mes","dpto","fex_c_2011")
keys_full =  c("directorio","secuencia_p","orden")


#
#------------CABECERA 2019------
#                                 
#Lo siguiente se repetira para CABECERA 2020, RESTO 2019 Y RESTO 2020

#Haremos Inner Join entre FT y OC, FT y DS, FT e IN
#Esto tiene sentido porque FT = OC + DS + IN
#es decir, los registros en OC estan en Ft, los de DS estan en FT, los de de IN estan en FT

FT_OC = inner_join(data_2019$`Cabecera - Fuerza de trabajo`, data_2019$`Cabecera - Ocupados`, by = keys)
FT_DS = inner_join(data_2019$`Cabecera - Fuerza de trabajo`, data_2019$`Cabecera - Desocupados`, by=keys)
FT_IN = inner_join(data_2019$`Cabecera - Fuerza de trabajo`, data_2019$`Cabecera - Inactivos`, by=keys)

#Haremos Full Join entre FT_OC y FT_DS
FT_OC_DS = full_join(FT_OC, FT_DS, by = keys_full, suffix = c("_ocupados","_desocupados"))

#Como las variables mes, fex_c_2011, y dpto son comunes entre ocupados, desocupados e inactivos
#haremos un coalesce, para que nos quede una sola columna para cada variable.
#Esto tiene sentido porque ocupados, desocupados e inactivos son conjuntos de
#registros *mutuamente excluyentes*. Por lo tanto, si tenemos dos columnas de mes
#(una para ocupados y otra para desocupados), cuando mes_ocupados tenga un valor
#para una fila, mes_desocupados tendra un NA en esa misma fila. 
#Esta misma logica aplicara cuando se haga el otro full join.

#Idea tomada de https://stackoverflow.com/questions/14563531/combine-column-to-remove-nas

FT_OC_DS <- FT_OC_DS %>% mutate(mes = coalesce(FT_OC_DS$mes_ocupados,FT_OC_DS$mes_desocupados)) %>% 
  select(-mes_ocupados,-mes_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(fex_c_2011 = coalesce(FT_OC_DS$fex_c_2011_ocupados,FT_OC_DS$fex_c_2011_desocupados)) %>% 
  select(-fex_c_2011_ocupados,-fex_c_2011_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(dpto = coalesce(FT_OC_DS$dpto_ocupados,FT_OC_DS$dpto_desocupados)) %>% 
  select(-dpto_ocupados,-dpto_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(CTra = coalesce(FT_OC_DS$CTra_ocupados,FT_OC_DS$CTra_desocupados)) %>% 
  select(-CTra_ocupados,-CTra_desocupados)

#Full join con el resto (es decir con los registros de inactivos)
FT_OC_DS_IN =full_join(FT_OC_DS, FT_IN, by = keys_full, suffix = c("_otro","_inactivos"))

#Eliminar columnas duplicadas
FT_OC_DS_IN <- FT_OC_DS_IN %>% mutate(mes = coalesce(FT_OC_DS_IN$mes_otro,FT_OC_DS_IN$mes_inactivos)) %>% 
  select(-mes_otro,-mes_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(fex_c_2011 = coalesce(FT_OC_DS_IN$fex_c_2011_otro,FT_OC_DS_IN$fex_c_2011_inactivos)) %>% 
  select(-fex_c_2011_otro,-fex_c_2011_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(dpto = coalesce(FT_OC_DS_IN$dpto_otro,FT_OC_DS_IN$dpto_inactivos)) %>% 
  select(-dpto_otro,-dpto_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(CTra = coalesce(FT_OC_DS_IN$CTra_otro,FT_OC_DS_IN$CTra_inactivos)) %>% 
  select(-CTra_otro,-CTra_inactivos)


BD_cabecera_2019 = FT_OC_DS_IN
rm(FT_OC_DS_IN)
BD_cabecera_2019$ano <- 2019

rm(list = c("FT_DS","FT_IN", "FT_OC", "FT_OC_DS"))

#
#------------CABECERA 2020------
#     

FT_OC = inner_join(data_2020$Cabecera_Fuerza_de_trabajo, data_2020$Cabecera_Ocupados, by = keys)
FT_DS = inner_join(data_2020$Cabecera_Fuerza_de_trabajo, data_2020$Cabecera_Desocupados, by=keys)
FT_IN = inner_join(data_2020$Cabecera_Fuerza_de_trabajo, data_2020$Cabecera_Inactivos, by=keys)

#Haremos Full Join entre FT_OC y FT_DS
FT_OC_DS = full_join(FT_OC, FT_DS, by = keys_full, suffix = c("_ocupados","_desocupados"))


FT_OC_DS <- FT_OC_DS %>% mutate(mes = coalesce(FT_OC_DS$mes_ocupados,FT_OC_DS$mes_desocupados)) %>% 
  select(-mes_ocupados,-mes_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(fex_c_2011 = coalesce(FT_OC_DS$fex_c_2011_ocupados,FT_OC_DS$fex_c_2011_desocupados)) %>% 
  select(-fex_c_2011_ocupados,-fex_c_2011_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(dpto = coalesce(FT_OC_DS$dpto_ocupados,FT_OC_DS$dpto_desocupados)) %>% 
  select(-dpto_ocupados,-dpto_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(CTra = coalesce(FT_OC_DS$CTra_ocupados,FT_OC_DS$CTra_desocupados)) %>% 
  select(-CTra_ocupados,-CTra_desocupados)

#Full join con el resto
FT_OC_DS_IN =full_join(FT_OC_DS, FT_IN, by = keys_full, suffix = c("_otro","_inactivos"))

#Eliminar columnas duplicadas
FT_OC_DS_IN <- FT_OC_DS_IN %>% mutate(mes = coalesce(FT_OC_DS_IN$mes_otro,FT_OC_DS_IN$mes_inactivos)) %>% 
  select(-mes_otro,-mes_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(fex_c_2011 = coalesce(FT_OC_DS_IN$fex_c_2011_otro,FT_OC_DS_IN$fex_c_2011_inactivos)) %>% 
  select(-fex_c_2011_otro,-fex_c_2011_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(dpto = coalesce(FT_OC_DS_IN$dpto_otro,FT_OC_DS_IN$dpto_inactivos)) %>% 
  select(-dpto_otro,-dpto_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(CTra = coalesce(FT_OC_DS_IN$CTra_otro,FT_OC_DS_IN$CTra_inactivos)) %>% 
  select(-CTra_otro,-CTra_inactivos)


BD_cabecera_2020 = FT_OC_DS_IN
rm(FT_OC_DS_IN)
BD_cabecera_2020$ano <- 2020
rm(list = c("FT_DS","FT_IN", "FT_OC", "FT_OC_DS"))


#
#------------RESTO 2019------
#     

FT_OC = inner_join(data_2019$`Resto - Fuerza de trabajo`, data_2019$`Resto - Ocupados`, by = keys)
FT_DS = inner_join(data_2019$`Resto - Fuerza de trabajo`, data_2019$`Resto - Desocupados`, by=keys)
FT_IN = inner_join(data_2019$`Resto - Fuerza de trabajo`, data_2019$`Resto - Inactivos`, by=keys)

#Haremos Full Join entre FT_OC y FT_DS
FT_OC_DS = full_join(FT_OC, FT_DS, by = keys_full, suffix = c("_ocupados","_desocupados"))


FT_OC_DS <- FT_OC_DS %>% mutate(mes = coalesce(FT_OC_DS$mes_ocupados,FT_OC_DS$mes_desocupados)) %>% 
  select(-mes_ocupados,-mes_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(fex_c_2011 = coalesce(FT_OC_DS$fex_c_2011_ocupados,FT_OC_DS$fex_c_2011_desocupados)) %>% 
  select(-fex_c_2011_ocupados,-fex_c_2011_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(dpto = coalesce(FT_OC_DS$dpto_ocupados,FT_OC_DS$dpto_desocupados)) %>% 
  select(-dpto_ocupados,-dpto_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(RTra = coalesce(FT_OC_DS$RTra_ocupados,FT_OC_DS$RTra_desocupados)) %>% 
  select(-RTra_ocupados,-RTra_desocupados)

#Full join con el resto
FT_OC_DS_IN =full_join(FT_OC_DS, FT_IN, by = keys_full, suffix = c("_otro","_inactivos"))

#Eliminar columnas duplicadas
FT_OC_DS_IN <- FT_OC_DS_IN %>% mutate(mes = coalesce(FT_OC_DS_IN$mes_otro,FT_OC_DS_IN$mes_inactivos)) %>% 
  select(-mes_otro,-mes_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(fex_c_2011 = coalesce(FT_OC_DS_IN$fex_c_2011_otro,FT_OC_DS_IN$fex_c_2011_inactivos)) %>% 
  select(-fex_c_2011_otro,-fex_c_2011_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(dpto = coalesce(FT_OC_DS_IN$dpto_otro,FT_OC_DS_IN$dpto_inactivos)) %>% 
  select(-dpto_otro,-dpto_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(RTra = coalesce(FT_OC_DS_IN$RTra_otro,FT_OC_DS_IN$RTra_inactivos)) %>% 
  select(-RTra_otro,-RTra_inactivos)


BD_resto_2019 = FT_OC_DS_IN
rm(FT_OC_DS_IN)
BD_resto_2019$ano <- 2019

rm(list = c("FT_DS","FT_IN", "FT_OC", "FT_OC_DS"))


#
#------------RESTO 2020------
#     

FT_OC = inner_join(data_2020$Resto_Fuerza_de_trabajo, data_2020$Resto_Ocupados, by = keys)
FT_DS = inner_join(data_2020$Resto_Fuerza_de_trabajo, data_2020$Resto_Desocupados, by=keys)
FT_IN = inner_join(data_2020$Resto_Fuerza_de_trabajo, data_2020$Resto_Inactivos, by=keys)

#Haremos Full Join entre FT_OC y FT_DS
FT_OC_DS = full_join(FT_OC, FT_DS, by = keys_full, suffix = c("_ocupados","_desocupados"))


FT_OC_DS <- FT_OC_DS %>% mutate(mes = coalesce(FT_OC_DS$mes_ocupados,FT_OC_DS$mes_desocupados)) %>% 
  select(-mes_ocupados,-mes_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(fex_c_2011 = coalesce(FT_OC_DS$fex_c_2011_ocupados,FT_OC_DS$fex_c_2011_desocupados)) %>% 
  select(-fex_c_2011_ocupados,-fex_c_2011_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(dpto = coalesce(FT_OC_DS$dpto_ocupados,FT_OC_DS$dpto_desocupados)) %>% 
  select(-dpto_ocupados,-dpto_desocupados)
FT_OC_DS <- FT_OC_DS %>% mutate(RTra = coalesce(FT_OC_DS$RTra_ocupados,FT_OC_DS$RTra_desocupados)) %>% 
  select(-RTra_ocupados,-RTra_desocupados)

#Full join con el resto
FT_OC_DS_IN =full_join(FT_OC_DS, FT_IN, by = keys_full, suffix = c("_otro","_inactivos"))

#Eliminar columnas duplicadas
FT_OC_DS_IN <- FT_OC_DS_IN %>% mutate(mes = coalesce(FT_OC_DS_IN$mes_otro,FT_OC_DS_IN$mes_inactivos)) %>% 
  select(-mes_otro,-mes_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(fex_c_2011 = coalesce(FT_OC_DS_IN$fex_c_2011_otro,FT_OC_DS_IN$fex_c_2011_inactivos)) %>% 
  select(-fex_c_2011_otro,-fex_c_2011_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(dpto = coalesce(FT_OC_DS_IN$dpto_otro,FT_OC_DS_IN$dpto_inactivos)) %>% 
  select(-dpto_otro,-dpto_inactivos)
FT_OC_DS_IN<- FT_OC_DS_IN %>% mutate(RTra = coalesce(FT_OC_DS_IN$RTra_otro,FT_OC_DS_IN$RTra_inactivos)) %>% 
  select(-RTra_otro,-RTra_inactivos)


BD_resto_2020 = FT_OC_DS_IN
rm(FT_OC_DS_IN)
BD_resto_2020$ano <- 2020

rm(list = c("FT_DS","FT_IN", "FT_OC", "FT_OC_DS"))



########################################
#Ahora combinamos las bases de cabecera por un lado
#y las bases de resto por el otro
#######################################

BD_cabecera = full_join(BD_cabecera_2019, BD_cabecera_2020)

BD_resto = full_join(BD_resto_2019,BD_resto_2020)



#Por ultimo, cambiare los NA por 0 en las columnas que identifican si la observacion
#pertence a OC, DS o IN. 
BD_cabecera$COcu[is.na(BD_cabecera$COcu)] <-0
BD_cabecera$CDes[is.na(BD_cabecera$CDes)] <-0
BD_cabecera$CIna[is.na(BD_cabecera$CIna)] <-0

#Ahora le asignare a OC, DS e IN un valor distinto para identificar el grupo
#al que pertenece cada observacion. Observacion: Esto lo pude haber hecho de una vez en el punto 1.1
#OC = 1
#DS = 2
#IN  = 3
BD_cabecera$CDes[BD_cabecera$CDes == 1] <-2
BD_cabecera$CIna[BD_cabecera$CIna == 1] <-3
#Añadir columna adicional a BD_cabecera para que identifique en una sola columna 
#a que grupo (OC, DS, IN) pertenece la observacion
BD_cabecera <- mutate(BD_cabecera, grupo = COcu+  CDes+  CIna)
comment(BD_cabecera$grupo) <-c("OC=1, DS=2, IN=3")
#Eliminar columnas redundantes, porque ya grupo_u me captura la información resumida del
#grupo (DS, OC, IN) al que pertenece cada observación
BD_cabecera$COcu <- NULL
BD_cabecera$CDes <-NULL
BD_cabecera$CIna <-NULL
BD_cabecera$CTra <-NULL


#Hacer lo mismo para BD_resto

BD_resto$ROcu[is.na(BD_resto$ROcu)] <-0
BD_resto$RDes[is.na(BD_resto$RDes)] <-0
BD_resto$RIna[is.na(BD_resto$RIna)] <-0


#Ahora le asignare a OC, DS e IN un valor distinto
#OC = 1
#DS = 2
#IN  = 3
BD_resto$RDes[BD_resto$RDes == 1] <-2
BD_resto$RIna[BD_resto$RIna == 1] <-3
#Añadir columna adicional a BD_cabecera para que identifique en una sola columna 
#a que grupo (OC, DS, IN) pertenece la observacion
BD_resto <- mutate(BD_resto, grupo = ROcu +  RDes + RIna)
comment(BD_resto$grupo) <- c("OC=1, DS=2, IN=3")

#Eliminar columnas redundantes
BD_resto$ROcu <- NULL
BD_resto$RDes <- NULL
BD_resto$RIna <- NULL
BD_resto$RTra <- NULL

#Limpiar consola y dejar solo BD_resto y BD_cabecera
rm(list = setdiff(ls(),c("BD_cabecera","BD_resto")))

#############################################
#------------1.3 Una base nacional -----------------
##############################################


#agregar columna a cada BD para después identificar las observaciones por zona (urbana/rural)
BD_cabecera$zona <- "urbana"
BD_resto$zona <- "rural"

BD_nacional = full_join(BD_cabecera,BD_resto)
  

#############################################
#------------1.4 Descriptivas -----------------
##############################################




#Borrar lo que esta escrito en la consola
cat("\014")

#----Informacion sobre numero de contribuyenes al sistema pensional
#para años 2019 y 2020
#
#p6920: 1:= Cotiza a pension 
#       2:= No cotiza a pension
#       3:= ya esta pensionado

BD_nacional %>% group_by(ano,p6920) %>% summarise(total = table(p6920))



################################################
#-----Estadisticas sobre Ocupados y Desocupados
##############################################


#------------Tablas


#Distribución de la Fuerza de Trabajo
#para el 2019 y 2020
BD_nacional %>% group_by(grupo,ano) %>% summarise(total = table(grupo))


#Distribución de la Fuerza de Trabajo por zonas geograficas
#para el 2019 y 2020
BD_nacional %>%  group_by(grupo,ano,zona) %>% summarise(total = table(grupo))


#Distribución de la Fuerza de Trabajo por departamento
#para el 2019 y 2020

BD_nacional <- BD_nacional %>% mutate_at("dpto",as.character)

BD_nacional$dpto[BD_nacional$dpto == 05] <-"Antioquia"
BD_nacional$dpto[BD_nacional$dpto == 08] <-"Atlantico"
BD_nacional$dpto[BD_nacional$dpto == 11] <-"Bogota"
BD_nacional$dpto[BD_nacional$dpto == 13] <-"Bolivar"
BD_nacional$dpto[BD_nacional$dpto == 17] <-"Caldas"
BD_nacional$dpto[BD_nacional$dpto == 23] <-"Cordoba"
BD_nacional$dpto[BD_nacional$dpto == 50] <-"Meta"
BD_nacional$dpto[BD_nacional$dpto == 52] <-"Nariño"
BD_nacional$dpto[BD_nacional$dpto == 54] <-"Norte de Santander"
BD_nacional$dpto[BD_nacional$dpto == 66] <-"Risaralda"
BD_nacional$dpto[BD_nacional$dpto == 68] <-"Santander"
BD_nacional$dpto[BD_nacional$dpto == 73] <-"Tolima"
BD_nacional$dpto[BD_nacional$dpto == 76] <-"Valle del Cauca"

#La condición que sea mayor a 2 es porque para algunos identificadores no encontre a
#cual departamento correspondia. No es la mejor solucion escribir que sea mayor a 2
#pero al menos me garantiza, para este caso, que estoy descartando entradas que no sean verdaderos nombres de dptos

#Distribución de la Fuerza de Trabajo por departamento
#para el 2019 y 2020
filter(BD_nacional,nchar(dpto)>2) %>%  group_by(grupo,ano,dpto) %>% summarise(total = table(grupo))


#------Ingresos Laborales: Promedio y Varianza ----
filter(BD_nacional, grupo==1 & !is.na(inglabo)) %>%  summarise(promedio = mean(inglabo), varianza = var(inglabo))

#------Ingresos Laborales por ano: Promedio y Varianza
filter(BD_nacional, grupo==1 & !is.na(inglabo)) %>% group_by(ano) %>%  summarise(promedio = mean(inglabo), varianza = var(inglabo))


#------Ingresos Laborales por zonas y por ano: Promedio y Varianza 
filter(BD_nacional, grupo==1 & !is.na(inglabo)) %>% group_by(ano,zona) %>%  summarise(promedio = mean(inglabo), varianza = var(inglabo))


#-----Estadisticas sobre los ingresos 
filter(BD_nacional, !is.na(inglabo)) %>%  select(inglabo) %>% skim()




##-----------Graficos------------##


filter(BD_nacional,nchar(dpto)>2) %>%  group_by(grupo,ano,dpto) %>% summarise(total = table(inglabo))


#Construir grafico con los ingresos salariales promedio para el 2019 por departamento
ing_promedio_2019 = filter(BD_nacional,nchar(dpto)>2 & grupo==1 & !is.na(inglabo) & ano==2019) %>% 
  group_by(dpto) %>%  
  summarise(promedio = mean(inglabo)) %>% 
  
  ggplot(aes(x = dpto, y = promedio/1000)) +
  geom_bar(stat = "identity", position="dodge", fill = "light blue")+
  theme_light() +
  labs(
      x = "Departamento",
      y = "Ingresos promedio (miles de pesos)",
      colour ="",
      title = paste(
        "Ingresos laborales promedio 2019"
      )) +
  theme_light() + 
  theme(plot.title = element_text(hjust = 0.5))

#Desplegar en la consola la grafica
ing_promedio_2019


#Construir grafico con los ingresos salariales promedio para por departamento y por ano
#idea https://www.r-graph-gallery.com/48-grouped-barplot-with-ggplot2.html
temp = filter(BD_nacional,nchar(dpto)>2 & grupo==1 & !is.na(inglabo)) %>% 
  group_by(dpto,ano) %>%  
  summarise(promedio = mean(inglabo))
temp <- temp %>% mutate_at("ano", as.character)

ing_promedio = ggplot(temp,aes(x=dpto,y=promedio,fill=ano)) +
  geom_bar(stat="identity", position=position_dodge()) +
  labs(
    x = "Departamento",
    y = "Ingresos promedio",
    title = paste(
      "Ingresos laborales promedio 2019 y 2020"
    ))+
  theme(plot.title = element_text(hjust = 0.5))
#Desplegar grafico
ing_promedio

#Construir Tree map para ver la proporicion de Ocupados, Desocupados e Inactivos por zonas
#para el año 2019.
#Idea sacada de https://www.r-graph-gallery.com/236-custom-your-treemap.html

temp = filter(BD_nacional,ano==2019) %>%  group_by(grupo,zona) %>% summarise(total = table(grupo))
temp <- temp %>% mutate_at("total", as.numeric)


treemap_1 = treemap(temp,
          index= c("grupo","zona"),
          vSize="total",
          type = "index",
          title= "Proporcion de DS, OC e IN por zonas",
         bg.labels=c("transparent"),              
         align.labels=list(
           c("center", "center"), 
           c("right", "bottom")
         ) 
  )
 
 rm(temp)

#Construir Tree map para ver la proporicion de Ocupados, Desocupados e Inactivos por zonas
#y por años
temp = BD_nacional %>%  group_by(grupo,zona,ano) %>% summarise(total = table(grupo))
temp <- temp %>% mutate_at("total", as.numeric)

treemap_2 = treemap(temp,
        index= c("grupo","zona","ano"),
        vSize="total",
        type = "index",
        title= "Proporcion de DS, OC e IN por zonas y por años",
        bg.labels=c("transparent"),              
        align.labels=list(
          c("center", "center"), 
          c("right", "bottom")
        ) 
)
rm(temp)


cat("\014")

#Guardar graficos como .jpeg en carpeta views 

### Como jpeg
ggsave(plot = ing_promedio, file="task_1/views/ing_primedio.jpeg")
#los otros los guarde manualmente. En particular no encontre un comando que
#guardara los tree maps


  