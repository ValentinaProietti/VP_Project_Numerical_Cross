Questo codice per ambiente Minizinc serve a risolvere un cruciverba numerico dato lo schema e le definizioni.

Ogni casella deve essere riempita con un numero intero che va da r>0 e s assegnati.

Ogni definizione è il risultato del prodotto tra i valori scritti nelle caselle che ne fanno parte.

Per utilizzare il modello è sufficiente:
  1) procurarsi Minizinc (è stata utilizzata la versione 2.4.2 e Geocode 6.1.1);
  2) aprire il progetto numcross_vp.mzp (in alternativa è possibile aprire
     il modello numcross_vp.mzn e i file dati presenti nella cartella "data" singolarmente);
  3) avviare il file premendo "run" e scegliere il file dati da utilizzare.

Si otterra' il risultato nel formato:

8 0 1 2 3 7 0                     <--- e' il cruciverba risolto dove gli 0 rappresentano le caselle nere
6 5 3 0 1 5 6
2 0 4 8 1 2 0
0 0 7 1 4 0 6
9 6 1 0 3 8 1

ORIZZONTALI:                      <--- sono le definizioni numerate come nei classici cruciverba
2.42
5.90
6.30
7.64
9.28
11.54
12.24

VERTICALI:
1.96
2.84
3.36
4.70
8.8
10.6
