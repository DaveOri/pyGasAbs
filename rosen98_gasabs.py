import numpy as np
from rosen98_gasabs import rosen98_gasabs as r98


# rosen98_gasabs(f[GHz], absolute_humidity[kg/m3], pressure[Pa])
r98(94.0,300,0.001,100000.0)

r98(94.0,300,0.01,100000.0)

# OUT = [0(always), absAir[Np/km], absH2O[Np/km]]
