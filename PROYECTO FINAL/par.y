%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<math.h>
	
	void yyerror(char *s);
%}
%union
{
	 double real;
}
%start	Calculadora
%token	<real> NUMERO
%token	TKN_PAA
%token	TKN_PAC
%token	TKN_COS
%token	TKN_SEN
%token	TKN_SQRT
%token	TKN_CORI
%token	TKN_CORD
%token	TKN_LLAI
%token	TKN_LLAD
%token	TKN_LOG
%token	<real> TKN_ID
%type	<real> Expresion Calculadora
%left	'+' '-'
%left	'*' '/'
%right	'^'

%%
Calculadora:	TKN_ID '=' Expresion|
			   Expresion {printf("\nRESPUESTA : %g", $1);}
			;

Expresion:	NUMERO {$$=$1;} |
		Expresion '+' Expresion	{$$=$1+$3;}|
		Expresion '-' Expresion	{$$=$1-$3;}|
		Expresion '*' Expresion	{$$=$1*$3;}|
		Expresion '/' Expresion	{if($3==0){
								printf("\nDivision para cero\n");
						 }else
								$$=$1/$3;}|
		Expresion '^' Expresion	{$$=pow($1,$3);}|
		'-' Expresion 	{$$=-$2;}|
		TKN_COS TKN_PAA Expresion TKN_PAC	{$$=cos($3);}|
		TKN_SEN TKN_PAA Expresion TKN_PAC	{$$=sin($3);}|
		TKN_SQRT TKN_PAA Expresion TKN_PAC	{$$=sqrt($3);}|
		TKN_LOG TKN_PAA Expresion TKN_PAC	{$$=log($3);}|
		TKN_PAA Expresion TKN_PAC {$$=$2;}|
		TKN_LLAI Expresion TKN_LLAD {$$=$2;}|
		TKN_CORI Expresion TKN_CORD {$$=$2;};
%%
void yyerror(char *s)
{
	printf("\nError %s\n", s);
}
main()
{
	do{
	printf("\nIngrese la expresion matematica: ");
		yyparse();
	}while(1);
}