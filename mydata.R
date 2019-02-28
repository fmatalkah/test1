library(dplyr)
library(ggplot2)
mydata<-readRDS("fatimah.data.rds")
ggplot(mydata,aes(x=time,y=amp,color=eye))+geom_point()+geom_line()
 grouping<-mydata %>%
  group_by(mouse.id,time) %>%
  summarise(m=mean(amp))
ggplot(grouping,aes(x=time,y=m,color=mouse.id))+geom_point()
mydata<-readRDS("fatimah.data.rds")
 mydata
filtered<-subset(mydata,time>=0)
library(dplyr)
substract<-filtered %>%
  group_by(mouse.id) %>%
  mutate(diff = amp - lag(amp, default = first(amp)))
library(dplyr)
min<-substract %>%
  group_by(mouse.id) %>%
  mutate(Awave= min(amp))
library(dplyr)
max<-min %>%
  group_by(mouse.id)%>%
mutate(Bwave= max(amp))
library(ggplot2)
ggplot(min,aes(x=ID,y=Awave,color=mouse.id))+geom_violin(trim=FALSE)+geom_jitter(shape=12, position=position_jitter(0.02))
library(ggplot2)
ggplot(max,aes(x=ID,y=Bwave,color=mouse.id))+geom_violin(trim=FALSE)+geom_jitter(shape=12, position=position_jitter(0.02))
