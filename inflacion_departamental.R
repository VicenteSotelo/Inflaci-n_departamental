
# Inflación por departamento 
# Autor: Vicente Sotelo
# Fecha:  07/05/21

# Seting up

setwd("~/Downloads")

library(ggplot2)

library(dplyr)

library(readxl)

library(tidyverse)

library(grid)


#  Seting + transforming df

t_df <-read_excel('./ipc_by_department.xls') %>% as_tibble(df) %>% drop_na()

t_df$infl_marzo_21 <- ((t_df$`Marzo-21`/ t_df$`Marzo-20`)-1)*100

d_lima=ifelse(t_df$DEPARTAMENTO=="LIMA",1,0)

t_df <- cbind(t_df,d_lima)


#  Mapping

ggplot(data=t_df,mapping=aes(x=reorder(DEPARTAMENTO,infl_marzo_21),y=infl_marzo_21,fill=d_lima)) +

geom_bar(stat="identity")+

theme_bw(base_size=10) +

coord_flip()+

geom_hline(yintercept=3, linetype="dashed", 
                color = "blue", size=1) +

geom_hline(yintercept=1, linetype="dashed", 
                color = "blue", size=1) +

ggtitle("Inflación anual:Marzo-2021")+
 
labs(y="Var.% anual del IPC ",x="departamentos", caption="Fuente https://github.com/VicenteSotelo/Inflaci-n_departamental")



