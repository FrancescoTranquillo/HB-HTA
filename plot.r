library(tidyverse)
library(ggplot2)
library(plotly)
risk_point=c(12,-3,4,6,20,1,3,-5)
value_point=c(4,1,6,15,2,-9,8,22)
tipo=c("dispositivo", "apparecchiatura", "apparecchiatura", "dispositivo",
       "apparecchiatura", "dispositivo", "dispositivo", "dispositivo")
df<-tibble("risk"=risk_point,
           "value"=value_point, "tipologia"=as.factor(tipo))
df<-df%>%mutate("overall_score"=risk+value)



g<-ggplot(df, aes(value, risk, colour = overall_score)) +
  geom_point(size=3)+
  geom_vline(xintercept = 0)+
  geom_hline(yintercept = 0)+
  facet_wrap(facets = .~tipologia)
ggplotly(g)
g
