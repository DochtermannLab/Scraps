ipsos <- read.csv("ipsos.csv")
names(ipsos) <- c("country","august","october")
ipsos$bump_august <- ipsos$august+if_else(ipsos$august < ipsos$october, -2, 2)
ipsos$bump_october <- ipsos$october+if_else(ipsos$august < ipsos$october, 2,- 2)
par(mar=c(4,7,4,1),oma=c(1,1,1,1))
plot(NA,xlim=c(50,100),ylim=c(1,16),type='n',axes=FALSE,ann=FALSE,xpd=FALSE)
abline(h=1:16, col="lightgray", lty=3)
abline(v=seq(50,100,5),col="lightgray")
for(i in 1:16){lines(y=c(i+seq(15,-15,-2)[i],i+seq(15,-15,-2)[i]),x=ipsos[i,c(2:3)],col="#e6e6e6",lwd=9)}
points(y=16:1,x=ipsos[,2], pch=16,col="#727272",cex=2)
points(y=16:1,x=ipsos[,3],pch=16,col="#15607a",cex=2)
text(x=ipsos$bump_october,y=16:1,labels=paste0(ipsos$october,"%"),col="#15607a")
text(x=ipsos$bump_august,y=16:1,labels=paste0(ipsos$august,"%"),col="#727272")
mtext(at=c(ipsos[1,2],17),text=c("Total Agree -\nAugust 2020"),col="#727272",adj=0,cex=.75)
mtext(at=c(ipsos[1,3],17),text=c("Total Agree -\nOctober 2020"),col="#15607a",adj=1,cex=.75)
axis(1,at=seq(50,100,5),labels = paste0(seq(50,100,5), "%"),col.axis = "darkslategray",tick=FALSE,line=-1.25)
axis(2,at=16:1,labels=ipsos$country,las=1,tick=FALSE)
mtext(expression(bold("If a vaccine for COVID-19 were available, I would get it")),side=3,
      outer=TRUE,adj=0,line=-1.75,cex=1.5)
mtext(expression(italic("Base: 18,526 online adults aged 16-74 across 15 countries")),
                        line=-2.5,side=1,adj=0,outer=TRUE,col="darkslategray",cex=.8)
mtext("Source:Ipsos",line=-2,side=1,adj=0,outer=TRUE,col="darkslategray",cex=.8)

