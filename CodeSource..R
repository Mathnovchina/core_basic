library(tikzDevice) # load the tikzDevice package
library(ggplot2)
library(Sysde)
install.packages("sysde")
source("SourceCode.R")
sysMinDist <- cppMakeSys("core.R", reportVars = 3)
resSimul <- cppRK4(sysMinDist)

View(resSimul[,c("")])

# plot(x = resSimul$time+2016, y = resSimul$C, type = 'l', col = 'blue',lty = 2)
# line(x = resSimul$time+2016, y = resSimul$Yd)
# mtext("Y", side = 2, line = 3)
# mtext("YD", side = 4, line = 3)

par(mfrow = c(2,3), mar=c(5.1, 2.1, 4.1, 1.1), xpd=T)

plot(x = resSimul$time, y = resSimul$Y, type = 'l', col = 'blue', xlab = '', ylab = '', ylim = c(0,400), main = "Macro Balances")
lines(x = resSimul$time, y = resSimul$C_W+resSimul$C_K, type = 'l',  col = 'orange')
lines(x = resSimul$time, y = resSimul$I, type = 'l',  col = 'green')
lines(x = resSimul$time, y = resSimul$Gt, type = 'l', col = 'red')
legend("topright", inset=c(0,0.1), legend = c("Y","C","I","G"), col=c("blue", "orange","green", "red"), lty=1:1, box.lty=0, cex=0.75 )

plot(x = resSimul$time, y = resSimul$WB, type = 'l', col = 'blue', xlab = '', ylab = '', ylim = c(0,500), main = "Workers Balances")
lines(x = resSimul$time, y = resSimul$YD_W, type = 'l',  col = 'orange')
lines(x = resSimul$time, y = resSimul$T_W, type = 'l',  col = 'green')
lines(x = resSimul$time, y = resSimul$C_W, type = 'l', col = 'red')
lines(x = resSimul$time, y = resSimul$V_W, type = 'l', col = 'purple')
legend("topright", inset=c(0,0.1), legend = c("WB","YD","T","C","Depo"), col=c("blue", "orange","green", "red",'purple'), lty=1:1, box.lty=0, cex=0.75 )

plot(x = resSimul$time, y = resSimul$P_F+resSimul$P_B, type = 'l', col = 'blue', xlab = '', ylab = '', ylim = c(0,550), main = "Capitalists Balances")
lines(x = resSimul$time, y = resSimul$YD_K, type = 'l',  col = 'orange')
lines(x = resSimul$time, y = resSimul$T_K, type = 'l',  col = 'green')
lines(x = resSimul$time, y = resSimul$C_K, type = 'l', col = 'red')
lines(x = resSimul$time, y = resSimul$V_K, type = 'l', col = 'purple')
legend("topright", inset=c(0,0.1), legend = c("WB","YD","T","C","Depo"), col=c("blue", "orange","green", "red",'purple'), lty=1:1, box.lty=0, cex=0.75 )

plot(x = resSimul$time, y = resSimul$Gt, type = 'l', col = 'blue', xlab = '', ylab = '', ylim = c(96,100) ,main = "Gov Balances")
lines(x = resSimul$time, y = resSimul$T_F+resSimul$T_W+resSimul$T_K, type = 'l',  col = 'orange')
legend("topright", inset=c(0,0.1), legend = c("WB","YD","T","C","Depo"), col=c("blue", "orange"), lty=1:1, box.lty=0, cex=0.75 )

plot(x = resSimul$time, y = resSimul$Y, type = 'l', col = 'blue', xlab = '', ylab = '', ylim = c(0,400), main = "Firms Balances")
lines(x = resSimul$time, y = resSimul$WB, type = 'l',  col = 'orange')
lines(x = resSimul$time, y = resSimul$T_F, type = 'l',  col = 'green')
lines(x = resSimul$time, y = resSimul$I, type = 'l', col = 'red')
lines(x = resSimul$time, y = resSimul$P_F, type = 'l', col = 'purple')
legend("topright", inset=c(0,0.1), legend = c("WB","YD","T","C","Depo"), col=c("blue", "orange","green", "red",'purple'), lty=1:1, box.lty=0, cex=0.75 )

