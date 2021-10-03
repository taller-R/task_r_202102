#Task 1
#TALLER B 
#Elaborado por Max Gomez
#Version de R: 4.1.1

#-----------------------TALLER B----------------------

#--------------------Organizar GEIH-------------------

rm(list = ls())

#Importare paquetes necesarios para mis soluciones

library(pacman)
library(rio)
library(readr)
library(tidyr)
library(tidyverse)



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


##Agregarle un distintivo al nombre de las columnas, por ejemplo, mes, para que se sepa a cual DF pertence
#Esto se hace para cada DF
#Esto es importante para poder distinguir mejor las columnas cuando se haga el full join en el punto 1.2
# names(data_2019[[2]]) <- append(c("directorio","secuencia_p","orden"),paste0("CDes_",colnames(data_2019[[2]][-1:-3])))
# names(data_2019[[3]]) <- append(c("directorio","secuencia_p","orden"),paste0("CFT_",colnames(data_2019[[3]][-1:-3])))
# names(data_2019[[4]]) <- append(c("directorio","secuencia_p","orden"),paste0("CINA_",colnames(data_2019[[4]][-1:-3])))
# names(data_2019[[5]]) <- append(c("directorio","secuencia_p","orden"),paste0("COCU_",colnames(data_2019[[5]][-1:-3])))
# 
# names(data_2019[[7]]) <- append(c("directorio","secuencia_p","orden"),paste0("RDes_",colnames(data_2019[[7]][-1:-3])))
# names(data_2019[[8]]) <- append(c("directorio","secuencia_p","orden"),paste0("RFT_",colnames(data_2019[[8]][-1:-3])))
# names(data_2019[[9]]) <- append(c("directorio","secuencia_p","orden"),paste0("RINA_",colnames(data_2019[[9]][-1:-3])))
# names(data_2019[[10]]) <- append(c("directorio","secuencia_p","orden"),paste0("ROCU_",colnames(data_2019[[10]][-1:-3])))
# 
# names(data_2020[[2]]) <- append(c("directorio","secuencia_p","orden"),paste0("CDes_",colnames(data_2020[[2]][-1:-3])))
# names(data_2020[[3]]) <- append(c("directorio","secuencia_p","orden"),paste0("CFT_",colnames(data_2020[[3]][-1:-3])))
# names(data_2020[[4]]) <- append(c("directorio","secuencia_p","orden"),paste0("CINA_",colnames(data_2020[[4]][-1:-3])))
# names(data_2020[[5]]) <- append(c("directorio","secuencia_p","orden"),paste0("COCU_",colnames(data_2020[[5]][-1:-3])))
# 
# names(data_2020[[7]]) <- append(c("directorio","secuencia_p","orden"),paste0("RDes_",colnames(data_2020[[7]][-1:-3])))
# names(data_2020[[8]]) <- append(c("directorio","secuencia_p","orden"),paste0("RFT_",colnames(data_2020[[8]][-1:-3])))
# names(data_2020[[9]]) <- append(c("directorio","secuencia_p","orden"),paste0("RINA_",colnames(data_2020[[9]][-1:-3])))
# names(data_2020[[10]]) <- append(c("directorio","secuencia_p","orden"),paste0("ROCU_",colnames(data_2020[[10]][-1:-3])))
# 




#------------1.2 Unir Datos -----------------

#Inicializar llaves de los dataframes para hacer los joins

keys = c("directorio","secuencia_p","orden","mes","dpto","fex_c_2011")
keys_full =  c("directorio","secuencia_p","orden")


#
#------------CABECERA 2019------
#                                 
#Lo siguiente se repetira para CABECERA 2020, RESTO 2019 Y RESTO 2020

#Haremos Inner Join entre FT y OC, FT y DS, FT e IN
#Esto tiene sentido porque FT = OC + DS + IN
#luego los registros en OC estan en Ft, los de DS estan en FT, los de de IN estan en FT

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
FT_OC_DS <- FT_OC_DS %>% mutate(CTra = coalesce(FT_OC_DS$RTra_ocupados,FT_OC_DS$RTra_desocupados)) %>% 
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

#Note que agregamos una llave adicional: ano
BD_resto = full_join(BD_resto_2019,BD_resto_2020)

#Limpiar consola y dejar solo BD_resto y BD_cabecera
rm(list = setdiff(ls(),c("BD_cabecera","BD_resto")))



#
