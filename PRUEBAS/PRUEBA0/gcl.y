%{
	#include <stdio.h>
	int flag = 0;
%}
%{
int yylex();
void yyerror();
%}
%token UNO CERO NL
%%
str1	:	str2 nl	{ }
	;
str2	:	CERO str2 UNO	{ }
	|	CERO UNO	{ }
	;
nl	:	NL	{printf("\n La secuencia es aceptada"); return(0); }
%%
void main()
{
	printf("\n Ingrese una secuencia (cualquier combinacion de 0 y 1)\n");
	yyparse();
	if(flag == 0)
		printf("\n La secuencia ingresada es valida para L = [0^n1^n]\n\n");
}
void yyerror()
{
	printf("\n La secuencia ingresada es invalida para L = [0^n1^n]\n\n");
	flag = 1;
}
