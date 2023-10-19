##intermediate variables 

  # Firms
Y = C_W + C_K + G + I                        # Output
U_target = Y/(eps_K*K)
I = (b_1*(U-nu)+delta)*K
#I = delta*K#I_0 + I_1*t
WB = W
P_F = Y*(1-tau_F) - WB - (r_L+rho)*L
T_F = Y*tau_F

  # households - workers 
T_W = tau_H*WB
YD_W = WB + r_V*V_W - T_W
C_W = a_0 + a_1*YD_W + a_2*V_W

  # households - capitalists
T_K = (P_F + P_B)*tau_H
YD_K = P_F + P_B + r_V*V_K - T_K
C_K_target = a_0 + a_1*YD_K + a_2*V_K

  # Banks
P_B_target = BondDot + r_L*L - r_V*(V_W+V_K)
Gt = G
##time derivatives

  # Firms
K = -delta*K + I 
L = -rho*L + I
#P_F = beta_C*(P_F_target-P_F)

  # households - workers 
V_W = YD_W - C_W
#C_W = beta_C*(C_W_target-C_W)
U = beta_U*(U_target-U)

  # households - capitalists
V_K = YD_K - C_K
C_K = beta_C*(C_K_target-C_K)

  # Gov
Bond = G - T_F - T_W - T_K
P_B = beta_P*(P_B_target-P_B)

##initial values


K = 500 
L = 1000
V_W = 500
U = 0.7
V_K = 180
C_K = 110
Bond = 0
P_B = 100

##parameters

G = 100
W = 50
eps_K = 1
eps_L = 1
a_0 = 0
a_1 = 0.7
a_2 = 0.1
delta = 0.1
rho = 0.05
tau_H = 0.1
tau_F = 0.2
theta = 0.1
r_L = 0.04
r_V = 0.02
b_1 = 0.2
nu = 0.8 

beta_U = 2
beta_C = 2
beta_P = 4
#_______________________________________________________________________________________________________________________________#
##time
begin = 0                      # Note that time can be used as a variable "t"
end = 100
by = 0.05