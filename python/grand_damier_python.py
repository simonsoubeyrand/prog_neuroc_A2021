import numpy as np
import matplotlib.pyplot as plt

nn=10;
petit_damier=np.zeros((nn*2,nn*2))
pas=1/(nn);
une_tuile=np.tile(np.arange(0,1,pas),(nn,1))
plt.imshow(une_tuile)

petit_damier[:nn,:nn]=une_tuile
petit_damier[nn:nn*2,nn:nn*2]=une_tuile
plt.imshow(petit_damier)

nrows=5
ncols=5
grand_damier=np.tile(petit_damier,(nrows,ncols))
plt.imshow(grand_damier)
plt.show()