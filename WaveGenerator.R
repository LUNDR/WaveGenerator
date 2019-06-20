
 
 require(readxl)
 require(dplyr)
 
 df=read_excel("cos.xlsx",sheet='data')
 glimpse(df)
 names(df)=c("time","x")
 
 
 #formula x=b+a*sin(2*pi*1/time + alpha)

 
 fit.nls<-nls(x~b+a*sin(2*pi*time*f+alpha),
              start=list(b=5.23,a=15.65,f=3.2, alpha=136), data=df, algorithm = "port")
              
  df$predict.nls=predict(fit.nls) 
  summary(fit.nls)

 plot(df$x~df$time,xlim=c(0,6), ylim=c(-35,35))
 lines(df$predict.nls~df$time, col="red")
 
 
 
 
 
 

 

 
 
 
 
 
 
 
 
 
 