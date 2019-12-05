import numpy as np
import rosen98_gasabs.rosen98_gasabs as r98


# rosen98_gasabs(f[GHz], absolute_humidity[kg/m3], pressure[Pa])
rosen98_gasabs.rosen98_gasabs(94.0,300,0.001,100000.0)

rosen98_gasabs.rosen98_gasabs(94.0,300,0.01,100000.0)

# OUT = [0(always), absAir[Np/km], absH2O[Np/km]]
