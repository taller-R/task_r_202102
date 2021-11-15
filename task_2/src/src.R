## Elaborado por: Max Gómez
# Colaboradores: 
# Fecha de elaboracion: 14/11/2021

#######################
#---------Taller A

if(!require(pacman)) install.packages("pacman") ; require(pacman) # Instalar la librerÃ­a pacm
library(rio)
rm(list = ls())# clean enviroment

###################
#---------Punto 1--
###################

#####1.0 Crear lista 
chip = vector(mode="list")


#####1.1 Importar datos

#obtener path donde están las carpetas de los años
data_path = "task_2/data/imput"
#Obtener los años
years_files = list.files(data_path)
#Outer_loop: Determina el path de la carpeta del año x que queremos inspeccionar
#Inner_loop: Determina el path de cada archivo excel para el año x.
#Con ese path importamos los datos y
#para que cada excel sea añadido como un data frame aislado llamamos la función list()
#Resultado: Lista con 80 dataframes 
for(year in years_files){
  temp_path = "task_2/data/imput"
  temp_path = paste(temp_path,year,sep="/")
  for(file in list.files(temp_path)){
    file_path = paste(temp_path,file,sep="/")
    chip = append(chip, list(import(file=file_path))) #
  }
}

####################
#---------Punto 2-------------
###################


#pagosEduacion: funcion para extraer valor de PAGOS(pesos) para EDUACION 
#de un dataframe en la lista chip

#temp_df: dataframe dentro de la lista con la cual se aplicará lapply del punto 3
pagosEducacion = function(temp_df){
  #Excepciones sobre la variable datos
  if(length(chip)==0){
    stop("La lista datos no tiene valores")
  }

  #Código DANE del municipio. codigo_municipio: "Código - nombre_municipio"
  codigo_municipio = colnames(temp_df)[1]
  #Periodo de la información
  periodo = temp_df[1][2,1]
  
  
  row_index = which(temp_df[1]=="CODIGO") #fila donde estan los nombres de las variables
  if("PAGOS(Pesos)" %in% temp_df[row_index,]){
    #Devuelve el indice de la columna de la variable "PAGOS(Pesos)" 
    columnaPagos = match("PAGOS(Pesos)",temp_df[row_index,])
    #Devuelve el indice de la fila de Eduacion
    rowEducacion = which(temp_df[1]=="A.1") 
    #Accede al valor de "PAGOS(Pesos)" para la fila de "EDUCACION"
    pagos_educacion = temp_df[rowEducacion, columnaPagos]
    return(c(paste("Código-municipio:",codigo_municipio),paste("Periodo:",periodo),
             paste("PAGOS(Pesos)=",pagos_educacion)))
  }else{
    #Arroja warning si la variable "PAGOS(pesos)" no se encuentra en la 
    warning("No se encontró variable PAGOS(pesos)")
  }
}

####################
#---------Punto 3-------------
###################

#Aplique la función creada en el punto anterior a todos los elementos de la lista chip.

respuesta =lapply(chip, pagosEducacion)





