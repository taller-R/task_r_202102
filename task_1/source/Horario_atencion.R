#


#
rm(list=ls())
require(pacman)
p_load(tidyverse,rio)




# punto 3
cabe_cg = readRDS("task_1/data/input/2019/Cabecera - Caracteristicas generales (Personas).rds")
cabe_res = readRDS("task_1/data/input/2019/Resto - Caracteristicas generales (Personas).rds")
