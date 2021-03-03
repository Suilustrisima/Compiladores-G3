%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	void yyerror(char *s);
	int contador=0;
%}
%token ZERO ONE
%%
N:	L {printf("\n EL NUMERO EQUIVALENTE EN OCTAL ES:  %d\n", $$);}
;
L:	L B {$$=$1*2+$2;}
|	B {$$=$1;}
B:	ZERO {$$=$1;}
|	ONE {$$=$1;}
;
%%
int main() 
{
	printf("\n INGRESE LA SECUENCIA BINARIA: ");
	while(yyparse());
}		

yyerror(char *s)
{
	fprintf(stdout,"\n%s", s);
}
