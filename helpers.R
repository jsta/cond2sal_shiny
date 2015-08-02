#'@name cond2sal
#'@title Conductivity to salinity conversion
#'@export
#'@param c numeric conducitivity in uS (measurements in mS need to multiplied by 1000)
#'@param t numeric celcius temperature
#'@param P numeric optional pressure (defaults to 0)
#'@examples cond2sal(c=52*1000)
#'@details algorithm based off an excel implementation of PSS78 by N. Iricanin
#'@seealso \code{\link[wq]{ec2pss}}
#'
cond2sal<-function (c, t = 25, P = 0) 
{
  a0 = 0.008
  a1 = -0.1692
  a2 = 25.3851
  a3 = 14.0941
  a4 = -7.0261
  a5 = 2.7081
  b0 = 5e-04
  b1 = -0.0056
  b2 = -0.0066
  b3 = -0.0375
  b4 = 0.0636
  b5 = -0.0144
  c0 = 0.6766097
  c1 = 0.0200564
  c2 = 0.0001104
  c3 = -6.9698e-07
  c4 = 1.0031e-09
  D1 = 0.03426
  D2 = 0.0004464
  D3 = 0.4215
  D4 = -0.003107
  e1 = 0.000207
  e2 = -6.37e-08
  e3 = 3.989e-12
  Csw = 42.914
  K = 0.0162
  Ct = round(c * (1 + 0.0191 * (t - 25)), 0)
  R = (Ct/1000)/Csw
  rt = c0 + (t * c1) + (t^2 * c2) + (t^3 * c3) + (t^4 * c4)
  Rp = 1 + (P * e1 + e2 * P^2 + e3 * P^3)/(1 + D1 * t + D2 * 
                                             t^2 + (D3 + D4 * t) * R)
  Rt1 = R/(Rp * rt)
  dS = (b0 + b1 * Rt1^(1/2) + b2 * Rt1^(2/2) + b3 * Rt1^(3/2) + 
          b4 * Rt1^(4/2) + b5 * Rt1^(5/2)) * (t - 15)/(1 + K * 
                                                         (t - 15))
  S = a0 + a1 * Rt1^(1/2) + a2 * Rt1^(2/2) + a3 * Rt1^(3/2) + 
    a4 * Rt1^(4/2) + a5 * Rt1^(5/2) + dS
  
  S[is.na(S<0)]<-NA
  
  S[S<2 & !is.na(S)]<- S[S<2 & !is.na(S)] - a0/(1 + 1.5 * (400 * Rt1) + (400 * Rt1)^2) - 
    (b0 * (t - 15)/(1 + K * (t - 15)))/(1 + (100 * Rt1)^(1/2) + 
                                          (100 * Rt1)^(3/2))
  PSS = round(S, 3)
  
  return(PSS)
}