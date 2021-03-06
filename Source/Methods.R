# ===========================================================================================================================================================================
# ==== ABT MSE Methods ======================================================================================================================================================
# ===========================================================================================================================================================================

# Plot spatial distribution implied by the OM model 
setMethod("plot", signature(x = "OM"),function(x,outfile=NA){
            
    .Object<-x
    Istore<-array(NA,c(.Object@npop,.Object@nma,.Object@nsubyears,.Object@nareas))
    Idist<-array(1/.Object@nareas,c(.Object@npop,.Object@nages,.Object@nareas))
    ind<-as.matrix(expand.grid(1:.Object@npop,1:.Object@nages,1:.Object@nareas))  
    mref<-c(2:.Object@nsubyears,1)
    # OM@mov s p a m r r
    
    for(i in 1:100){for(m in 1:.Object@nsubyears){
      Idist<-domov2(Idist,.Object@mov[1,,,m,,])
      if(i==100){
        for(p in 1:.Object@npop){
          for(j in 1:.Object@nma){
            ref<-match(j,.Object@ma[,p])
            Istore[p,j,mref[m],]<-Idist[p,ref,]
          }
        }
      }
    }}
    
    #pid<-3
    #nplots<-ceiling(.Object@npop/2)
   # if(nplots>2)pid<-(((1:nplots)*2)-1)[2:nplots]
    if(!is.na(outfile))jpeg(paste(getwd(),"/Images/",outfile,".jpg",sep=""),res=300,units="in",width=8,height=8)
    par(mfrow=c(.Object@nma,.Object@npop*.Object@nsubyears),mai=c(0.1,0.1,0.01,0.01),omi=c(0.4,0.4,0.6,0.05))
    
    for(ma in 1:.Object@nma){
       
      for(p in 1:.Object@npop){
        for(m in 1:.Object@nsubyears){
        
          sdensplot(Istore[p,ma,m,],.Object@Area_defs)
         
          if(p==1&m==1)mtext(paste("Age class",ma),2,line=0.6)
          if(ma==.Object@nma)mtext(paste("Subyear",m),1,line=0.6)
          #if(m==1&mat==1)mtext("Juvenile",3,line=0.3)
          #if(m==1&mat==2)mtext("Mature",3,line=0.3)
          #if(m==1&mat==1)mtext(paste("Population",p),3,adj=1.5,line=1.6)
          
    }}}
    
    mtext(paste("Stock",1:.Object@npop),3,at=seq(0,1,length.out=.Object@npop*2+1)[(1:.Object@npop)*2],outer=T,line=0.5)  
    if(!is.na(outfile))dev.off()
})

# Plot spatial definitions of the OMd object
setMethod("plot", signature(x = "OMd"),function(x){
  
  OMd<-x
  cols<-rep(c("#ff000040","#00ff0040","#0000ff40","#00000040","#ff00ff40"),4)
  res<-0.03
  map(database = "worldHires",xlim=c(-105,50),ylim=c(-55,85),mar=rep(0,4),resolution=res)
  
  abline(v=(-20:20)*10,col='light grey')
  abline(h=(-20:20)*10,col='light grey')
  abline(v=0,col="green")
  abline(h=0,col="green")
  map(database = "worldHires",mar=rep(0,4),border=0,xlim=c(-105,50), ylim=c(-55,85),add=T,fill=T,col="light grey",resolution=res)
  
  
  for(i in 1:length(OMd@Area_names)){
    polygon(OMd@Area_defs[[i]],border='blue',lwd=2,col=NA)#cols[i])
    text(mean(OMd@Area_defs[[i]]$x),2.5+mean(OMd@Area_defs[[i]]$y),OMd@Area_names[i],col='red',font=2,cex=0.6)         
  }
})

#setMethod("plot", signature(x = "MSE"),function(x){
  
#  tmse<-x
#  cols<-c("black","orange","blue","red","dark green","grey","purple","brown","pink")
#  mnam<-c("Yield (no Disc. rate)","Yield (5% Disc. rate)",
#          "Yield (10% Disc. rate)","Prob. Green Kobe",
#          "Av Ann. Var. Yield")
  
#  MPs<-tmse@MPs
#  nMP<-length(MPs)
#  yind<-(tmse@nyears+1):(tmse@nyears+tmse@proyears)    
#  Y<-apply(tmse@C[,,,yind],1,mean)
#  PGK<-apply(tmse@B_BMSY[,,yind]>1&tmse@F_FMSY[,,yind]>1,1,mean)
#  y1<-yind[1:(tmse@proyears-1)]
#  y2<-yind[2:tmse@proyears]
#  AAV<-apply(apply(((tmse@C[,,,y1]-tmse@C[,,,y2])^2)^0.5,1:2,mean) / apply(tmse@C[,,,yind],1:2,mean),1,mean)
  
#  Yinc<-(max(Y)-min(Y))/15
  #Y5inc<-(max(Y5)-min(Y5))/15
  #Y10inc<-(max(Y10)-min(Y10))/15
#  PGKinc<-(max(PGK)-min(PGK))/15
#  AAVinc<-(max(AAV)-min(AAV))/15
  
#  par(mfrow=c(1,2),mai=c(1.1,1.1,0.05,0.05),omi=c(0.01,0.01,0.7,0.01))
  
#  plot(range(PGK)+c(-PGKinc,PGKinc),range(Y)+c(-Yinc,Yinc),col='white',xlab="PGK",ylab="Y")
#  addgg(PGK,Y)
#  textplot(PGK,Y,MPs,col=cols,new=F,font=2)
  
#  plot(range(AAV)+c(-AAVinc,AAVinc),range(Y)+c(-Yinc,Yinc),col='white',xlab="AAVY",ylab="Y")
#  addgg(AAV,Y)
#  textplot(AAV,Y,MPs,col=cols,new=F,font=2)
#  mtext(paste(tmse@Name," (n =",tmse@nsim,")",sep=""),3,line=0.3,outer=T)
  
#})

setMethod("plot",
      signature(x = "MSE"),
      function(x,quants=c(0.05,0.5,0.95),nworms=10, startyr=2014,rev=T){            
            
            MSE<-x      
            nsim<-MSE@nsim
            proyears<-MSE@proyears
            allyears<-MSE@proyears+MSE@nyears
            nMPs<-MSE@nMPs
            
            #somenames=c("Green Kobe","Final depletion","AAV Yield","Yield","Yield 5% DR", "Yield 10% DR", "Yield -5% DR")
            
            #stats<-getperf(MSE)
            yrs<-startyr:(startyr+MSE@proyears-1)
            refyears<-MSE@nyears+1:MSE@proyears-1
            worms<-1:min(nworms,OM@nsim)
            
            xtick<-pretty(seq(yrs[1],yrs[MSE@proyears],length.out=3))
            
            SSBcol="light blue"
            Catcol="light grey"
            
            Cq<-apply(MSE@C,c(1,3,4),quantile,p=quants)
            Clim<-cbind(rep(0,MSE@npop),apply(Cq[,,,refyears],3,max))
            SSBnorm<-MSE@SSB/array(MSE@SSB[,,,MSE@nyears],dim(MSE@SSB))
            SSBq<-apply(SSBnorm,c(1,3,4),quantile,p=quants)
            SSBlim<-cbind(rep(0,MSE@npop),apply(SSBq,3,max))
            
            linecols<-rep(c("black","orange","blue","red","green","light grey","grey","pink","purple","brown"),100)
            
            MPnams<-unlist(MSE@MPs)
            MPnamsj<-paste(MPnams[(1:MSE@nMPs)*2-1],MPnams[(1:MSE@nMPs)*2],sep="-")
 
            par(mfrow=c(MSE@nMPs,MSE@npop*4),mai=c(0.05,0.05,0.35,0.05),omi=c(0.5,0.05,0.15,0.02))
            rsz<-6
            fill<-NA
            rw<-c(fill,rep(1,rsz),rep(2,rsz),fill,rep(3,rsz),rep(4,rsz),fill,fill,rep(5,rsz),rep(6,rsz),fill,rep(7,rsz),rep(8,rsz))
            lmat<-matrix(NA,ncol=rsz*MSE@nMPs,nrow=rsz*8+5)
            for(i in 1:nMPs)lmat[,(i-1)*rsz+1:rsz]<-rw+(i-1)*8
            lmat<-t(lmat)
            lmat[is.na(lmat)]<-max(lmat,na.rm=T)+1
            layout(lmat)
            
            pind<-1:MSE@npop
            if(rev)pind=MSE@npop:1
             
            for(MP in 1:MSE@nMPs){
              for(pp in pind){
                # Catch projection  ---
                # Col 1: Catch quantiles
                plot(range(yrs),Clim[pp,],axes=F,col="white",xlab="",ylab="",ylim=Clim[pp,])
                polygon(c(yrs,yrs[MSE@proyears:1]),
                        c(Cq[1,MP,pp,refyears],Cq[3,MP,pp,refyears[MSE@proyears:1]]),
                        col=Catcol,border=F)
                lines(yrs,Cq[2,MP,pp,refyears],lwd=1.5,col="black")
                if(MP<MSE@nMPs)axis(1,at=xtick,labels=NA)
                if(MP==MSE@nMPs)axis(1,at=xtick,labels=xtick,las=2)
                abline(h=0)
                ytick<-pretty(seq(0,Clim[pp,2],length.out=4))
                axis(2,ytick,labels=ytick)
                legend('topleft',legend="Catches (kg)",bty='n')
                
                # Col 2: Catch worms
                plot(range(yrs),Clim[pp,],axes=F,col="white",xlab="",ylab="",ylim=Clim[pp,])
                for(i in 1:length(worms))lines(yrs,MSE@C[MP,i,pp,refyears],col=linecols[i],lwd=1.2)
                if(MP<MSE@nMPs)axis(1,at=xtick,labels=NA)
                if(MP==MSE@nMPs)axis(1,at=xtick,labels=xtick,las=2)
                abline(h=0)

                # SSB projection  ---
                # Col 3: SSB quantiles
                plot(range(yrs),SSBlim[pp,],axes=F,col="white",xlab="",ylab="",ylim=SSBlim[pp,])
                polygon(c(yrs,yrs[MSE@proyears:1]),
                        c(SSBq[1,MP,pp,refyears],SSBq[3,MP,pp,refyears[MSE@proyears:1]]),
                        col=SSBcol,border=F)
                lines(yrs,SSBq[2,MP,pp,refyears],lwd=1.5,col="black")
                if(MP<MSE@nMPs)axis(1,at=xtick,labels=NA)
                if(MP==MSE@nMPs)axis(1,at=xtick,labels=xtick,las=2)
                abline(h=0)
                abline(h=1,lty=2)
                ytick<-pretty(seq(0,SSBlim[pp,2],length.out=4))
                axis(2,ytick,labels=ytick)
                legend('topleft',legend="Relative SSB",bty='n')
                
                mtext(MPnams[(MP-1)*2+pp],3,adj=-0.25,line=0.3,cex=0.9)
                
                # Col 4: SSB worms
                plot(range(yrs),SSBlim[pp,],axes=F,col="white",xlab="",ylab="",ylim=SSBlim[pp,])
                for(i in 1:length(worms))lines(yrs,SSBnorm[MP,i,pp,refyears],col=linecols[i],lwd=1.2)
                if(MP<MSE@nMPs)axis(1,at=xtick,labels=NA)
                if(MP==MSE@nMPs)axis(1,at=xtick,labels=xtick,las=2)
                abline(h=0)
                abline(h=1,lty=2)
                
               }
            }  
              
           mtext(MSE@Snames[pind],3,adj=c(0.26,0.78),line=-0.35,outer=T,font=2)   
           
  })

