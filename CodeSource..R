library(tikzDevice) # load the tikzDevice package
library(ggplot2)

source("SourceCode.R")
sysMinDist <- cppMakeSys("core.R", reportVars = 3)
resSimul <- cppRK4(sysMinDist)

View(resSimul[,c("")])


plot(x = resSimul$time+2016, y = resSimul$C, type = 'l', col = 'blue',lty = 2)
line(x = resSimul$time+2016, y = resSimul$Yd)
mtext("Y", side = 2, line = 3)
mtext("YD", side = 4, line = 3)



par(mfrow = c(2,3), mar=c(2.1, 5.1, 4.1, 4.1), xpd=T)

plot(x = resSimul$time, y = resSimul$Y, type = 'l', col = 'blue',xlim = c(1,50), xlab = '', ylab = '', ylim = c(0.4,5000), main = "Macro Balances")
lines(x = resSimul$time, y = resSimul$C_W+resSimul$C_K, type = 'l',  col = 'orange')

plot(x = resSimul$time+2016, y = resSimul$Tax, type = 'l', col = 'black', lty = 2,main = "Tax")
plot(x = resSimul$time+2016, y = resSimul$Yd, type = 'l', col = 'black', lty = 2,main = "Yd")
plot(x = resSimul$time+2016, y = resSimul$C, type = 'l', col = 'black', lty = 2,main = "Consumption")
plot(x = resSimul$time+2016, y = resSimul$S, type = 'l', col = 'black', lty = 2, main = "Savings/bonds")




plot(x = resSimul$time+2016, y = emp_p, type = 'l', col = 'blue',lty = 2, xlab = '', ylab = '', ylim = c(0.4,0.8), main="Labour")
lines(x = resSimul$time+2016, y = w_p, type = 'l', col = 'olivedrab', lty = 2)
lines(x = resSimul$time+2016, y = resSimul$lambda, type = 'l', col = 'blue', )
lines(x = resSimul$time+2016, y = resSimul$omega, type = 'l',  col = 'olivedrab')
axis(side = 4)  
mtext("Employment rate (blue)", side = 2, line = 3)
mtext("Wage share (%, green)", side = 4, line = 3)

plot(x = resSimul$time+2016, y = d_p    , type = 'l', lty = 2, col = 'blue',ylim=c(1,5), xlab = '', ylab = '', main = "Financial stability")
lines(x = resSimul$time+2016, y = resSimul$d, type = 'l', col = 'blue')
par(new=TRUE)
plot(x = resSimul$time+2016, y = resSimul$i*100, type = 'l', col = 'olivedrab',ylab = '', ylim = c(-1,5),axes = FALSE)
lines(x = resSimul$time+2016, y = i_p*100    , type = 'l',lty = 2, col = 'olivedrab',xlab = '', ylab ='')
axis(side = 4)     
mtext("private debt ratio (blue)", side = 2, line = 3)
mtext("Inflation (%, green)", side = 4, line = 3)

plot(x = resSimul$time+2016, y = resSimul$F_tro, type = 'l', col = 'goldenrod', xlab = '', ylab = '',ylim = c(50,500),main ="Biomass stocks (billion m3)" )
lines(x = resSimul$time+2016, y = resSimul$F_bor, type = 'l', col = 'darkolivegreen4')
lines(x = resSimul$time+2016, y = resSimul$F_tem, type = 'l', col = 'cornflowerblue' )
lines(x = resSimul$time+2016, y = F_tro_p, type = 'l', col = 'goldenrod', lty = 2)
lines(x = resSimul$time+2016, y = F_bor_p, type = 'l', col = 'darkolivegreen4', lty = 2)
lines(x = resSimul$time+2016, y = F_tem_p, type = 'l', col = 'cornflowerblue', lty = 2)

plot(x = resSimul$time+2016, y = resSimul$H_tro, type = 'l', col = 'goldenrod',xlab = '', ylab = '', ylim = c(0.5,10), main = "Total harvest (billion m3)")
lines(x = resSimul$time+2016, y = resSimul$H_bor, type = 'l', col = 'darkolivegreen4')
lines(x = resSimul$time+2016, y = resSimul$H_tem, type = 'l', col = 'cornflowerblue' )
lines(x = resSimul$time+2016, y = H_tro_p, type = 'l', col = 'goldenrod', lty = 2)
lines(x = resSimul$time+2016, y = H_bor_p, type = 'l', col = 'darkolivegreen4', lty = 2)
lines(x = resSimul$time+2016, y = H_tem_p, type = 'l', col = 'cornflowerblue', lty = 2)

plot(x = resSimul$time+2016, y = resSimul$FO_c , type = 'l', col = 'orange4', xlab = '', ylab = '',ylim = c(0,80), main = "Energetic demand")
lines(x = resSimul$time+2016, y = resSimul$BI_m3, type = 'l', col = 'olivedrab',ylab = '',axes = FALSE)
lines(x = resSimul$time+2016, y = FO_c_p, type = 'l', col = 'orange4',ylab = '',axes = FALSE, lty = 2)
lines(x = resSimul$time+2016, y = BI_m3_p, type = 'l', col = 'olivedrab',ylab = '',axes = FALSE, lty = 2)
axis(side=4)
mtext("Fossil (GtC, brown)", side = 2, line = 3, font = 0.5)
mtext("Bioenergy (billion m3, olive)", side = 4, line = 3, font = 0.5, cex = 0.9)

plot(x = resSimul$time+2016, y = resSimul$tax, type = 'l', col = 'black', xlab = '', ylab = '',ylim = c(0,300), main ="Carbon policy ($/tonC)" )
lines(x = resSimul$time+2016, y = tax_p, type = 'l', col = 'black', lty = 2)

plot(x = resSimul$time+2016, y = resSimul$Temp    , type = 'l', col = 'black',xlab = '', ylab ='', ylim=c(0.5,4.5), main = "Temperature anomaly (°C)")
lines(x = resSimul$time+2016, y = Temp_p, type = 'l', lty = 2, col = 'black', )


plot(x = resSimul$time+2016, y = resSimul$E_ant,type = 'l', col = 'orange4', xlab = '', ylab = '',ylim=c(0,90),main = "Emissions (GtCO2-e)")
lines(x = resSimul$time+2016, y = resSimul$E, type = 'l', col = 'olivedrab', )
lines(x = resSimul$time+2016, y = E_ant_p,type = 'l', col = 'orange4', lty = 2 )
lines(x = resSimul$time+2016, y = E_p, type = 'l', col = 'olivedrab', lty = 2)
axis(side=4)
mtext("Gross (brown)", side = 2, line = 3, font = 0.5)
mtext("- sequestration (olive)", side = 4, line = 3, font = 0.5,cex = 0.9)

