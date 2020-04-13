
%%%%%%%%% PROGETTO PER ESAME IA (2019/20) B003725 PROIETTI VALENTINA %%%%%%%%%%%%%%%%

include "alldifferent.mzn";

int: n;     %righe del cruciverba
int: m;     %colonne del cruciverba
int: r;          %le soluzioni sono numeri che vanno da r a s, con r>0                      
int: s;
array [1..n,1..m] of 0..1:schema;    %disposizione delle caselle nere
int: no;                                 %numero definizioni orizzontali
int: nv;                                 %numero definizioni verticali
array [1..no,1..4] of int: orizzontali;  % matrice delle def. orizzontali 
array [1..nv,1..4] of int: verticali;       % matrice delle def. verticali 
set of int: S;              % possibili soluzioni


array [1..no+nv] of var S: solution;   %elenco ordinato delle soluzioni 
array [1..n,1..m] of var 0..s: crux;      % cruciverba da risolvere


constraint assert (r>0,"Errore: r deve essere maggiore di 0 invece e' \(r)");
constraint assert (s>=r,"Errore: s e' minore di r");
constraint assert (card(S)=(no+nv),"Numero soluzioni non compatibili con lo schema");

constraint forall (i in 1..n, j in 1..m)    % tutte le caselle non nere devono 
                (                               % contenere un numero 
                   crux[i,j]!=0 ->                 %  che va da r a s
                   (
                       (crux[i,j]<=s) /\ (crux[i,j]>=r)
                   )
                );

constraint forall(i in 1..n, j in 1..m)       % le caselle dove schema e' 1 
                (                              % devono contenere  caselle nere 
                  schema[i,j]=1 -> crux [i,j]=0                 
                );                              

constraint forall(i in 1..n, j in 1..m)      % le caselle dove schema e' 0 
                (                                % non devono contenere 
                  schema[i,j]=0 -> crux [i,j]!=0     %caselle nere              
                );            

constraint forall (i in 1..no) % il prodotto di due o piu' caselle adiacenti
                (              % orizzontali deve dare una tra le definizioni
                    product([if (orizzontali[i,4]-j>0) then
                    ( crux [ orizzontali[i,2] , (orizzontali[i,3]+orizzontali[i,4]-j-1) ] )
                    else 1 endif | j in 0..m])
                    =solution[i]
                );
                
constraint forall (i in 1..nv) %il prodotto di due o piu' caselle adiacenti 
                (              % verticali deve dare una tra le definizioni
                    product([if (verticali[i,4]-j>0) then
                    ( crux [ (verticali[i,2]+verticali[i,4]-j-1) , verticali[i,3] ] )
                    else 1 endif | j in 0..n])
                    =solution[i+no]
                );
constraint alldifferent (solution);  % ogni definizione deve essere usata 
                                         % una ed una sola volta


output [if (j=1) then "\n" else " " endif ++ show(crux[i,j]) |  i in 1..n,j in 1..m]++["\n\n"]++["ORIZZONTALI:"]++["\n"]++["\(orizzontali[i,1]).\(solution[i])\n" | i in 1..no]++["\n"]++["VERTICALI:"]++["\n"]++["\(verticali[i-no,1]).\(solution[i])\n" | i in no+1..no+nv];
          

solve satisfy;