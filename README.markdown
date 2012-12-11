Encontrar todas las cadenas de N caracteres "A", "B" o "C" tales que no contengan dos subsecuencias consecutivas.

Es decir:

1. las cadenas de salida deben tener longitud N.

2. los únicos caracteres posibles son "A", "B" o "C".

3. en las cadenas resultantes, no debe poderse encontrar dos subsecuencias consecutivas.

4. deben encontrarse todas las cadenas posibles que cumplan las condiciones (para un N dado).

Por ejemplo, para N=3 es válida la cadena "ABA" porque aunque la subsecuencia "A" se repite dos veces, no está de forma consecutiva.

Para N=4, no sería válida la cadena "ABAB" porque la subsecuencia "AB" se repite de forma consecutiva.

Por ejemplo, para N=1..6 todas las cadenas en cada caso son (salvo error, claro):

A,B,C

AB,AC,BA,BC,CA,CB

ABA,ABC,ACA,ACB,BAB,BAC,BCA,BCB,CAB,CAC,CBA,CBC

ABAC,ABCA,ABCB,ACAB,ACBA,ACBC,BABC,BACA,BACB,BCAB,BCAC
BCBA,CABA,CABC,CACB,CBAB,CBAC,CBCA

ABACA,ABACB,ABCAB,ABCAC,ABCBA,ACABA,ACABC,ACBAB,ACBAC
ACBCA,BABCA,BABCB,BACAB,BACBA,BACBC,BCABA,BCABC,BCACB
BCBAB,BCBAC,CABAC,CABCA,CABCB,CACBA,CACBC,CBABC,CBACA
CBACB,CBCAB,CBCAC

ABACAB,ABACBA,ABACBC,ABCABA,ABCACB,ABCBAB,ABCBAC,ACABAC
ACABCA,ACABCB,ACBABC,ACBACA,ACBCAB,ACBCAC,BABCAB,BABCAC
BABCBA,BACABA,BACABC,BACBAB,BACBCA,BCABAC,BCABCB,BCACBA
BCACBC,BCBABC,BCBACA,BCBACB,CABACA,CABACB,CABCAC,CABCBA
CACBAB,CACBAC,CACBCA,CBABCA,CBABCB,CBACAB,CBACBC,CBCABA
CBCABC,CBCACB
