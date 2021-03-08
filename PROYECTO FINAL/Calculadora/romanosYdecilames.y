%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
extern int yylex(void);
extern char *yytext;
extern int nlines;
extern FILE *yyin;
void yyerror(char *s);
%}
%union
{
	double real;
}
%start Calculadora
%token TKN_NUM_ROMANO
%token <real> TKN_NUM 
%token TKN_ASIGNACION 
%token TKN_PTOCOMA
%token TKN_MULT
%token TKN_DIV
%token TKN_SQRT
%token TKN_CBRT
%token TKN_MAS
%token TKN_MENOS
%token TKN_PARENTESISA
%token TKN_PARENTESISC
%token TKN_COS
%token TKN_SEN
%token TKN_EULER
%token TKN_LN
%token TKN_POTENCIA
%token <real> TKN_ID TKN_NOMBRE
%type Calculadora
%type <real> Expresion
%left TKN_MAS TKN_MENOS
%left TKN_MULT TKN_DIV
%right TKN_Potencia TKN_SQRT
%right TKN_CBRT
%%
Calculadora: Expresion {printf("El  resultado en decimal es: ");}
	TKN_PTOCOMA {printf("%5.2f\n", $1);};

Expresion:	TKN_NUM {$$=$1;} |
	Expresion TKN_MAS Expresion	{$$=$1+$3;} |
	Expresion TKN_MENOS Expresion	{$$=$1-$3;} |
	Expresion TKN_MULT Expresion	{$$=$1*$3;} |
	Expresion TKN_DIV Expresion	{$$=$1/$3;} |
	Expresion TKN_POTENCIA Expresion	{$$=pow($1,$3);} |
	TKN_EULER TKN_POTENCIA Expresion	{$$=exp($3);} |
	TKN_PARENTESISA Expresion TKN_PARENTESISC	{$$=$2;}    |
	TKN_SQRT TKN_PARENTESISA Expresion TKN_PARENTESISC	{$$=sqrt($3);}    |
	TKN_CBRT TKN_PARENTESISA Expresion TKN_PARENTESISC	{$$=cbrt($3);}    |
	TKN_LN TKN_PARENTESISA Expresion TKN_PARENTESISC	{$$=log($3);}    |
	TKN_COS TKN_PARENTESISA Expresion TKN_PARENTESISC	{$$=cos($3);} |
	TKN_SEN TKN_PARENTESISA Expresion TKN_PARENTESISC	{$$=sin($3);};
%%
void yyerror(char *s){
	printf("Error %s", s);
}
int main (int argc, char **argv){
	if (argc>1){
		yyin=fopen(argv[1], "rt");
	}else{
		yyin=stdin;
	}

yyparse();
printf("\nFIN del Analisis. Entrada CORRECTA.\n");
printf("Numero de lineas analizadas: %d\n", nlines);
exit(0);
return 0;
}
