%{
#include <stdio.h>
#include <math.h>
#include <math.h>
extern int yylex(void);
extern char *yytext;
extern int nlines;
extern FILE *yyin;
yyerror(char *s);
int yylex();
%}

%union
{
	float real;
}
%token NOMBRE NUMERO 
%token TKN_PAA
%token TKN_PAC
%token TKN_COS
%token TKN_SEN
%token TKN_LN
%token TKN_EXP
%type <real> E
%type <real> NUMERO
%left '+' '-'
%left '*' '/'
%right '~'
%%
inicio : NOMBRE '=' E
| E {printf("=%d\n", $1);}
;
E :  	E '+' E {$$ = $1 + $3;}
|	E '-' E {$$ = $1 - $3;}
|	E '*' E {$$ = $1 * $3;}
|	E '/' E {$$ = $1 / $3;}
|	E '~' E {$$ = pow($1,$3);}
|	TKN_COS TKN_PAA E TKN_PAC	{$$=cos($3);} 
|	TKN_SEN TKN_PAA E TKN_PAC	{$$=sin($3);}
|	TKN_EXP '~' E	{$$ = exp($3);}
|	TKN_LN TKN_PAA E TKN_PAC	{$$=log($3);}
|	TKN_PAA E TKN_PAC {$$ = $2;}
|	NUMERO {$$ = $1;}
;

%%
void main(int argc, char **argv){
	if (argc>1){
		yyin=fopen(argv[1], "rt");
	}else{
		yyin=stdin;
	}
	yyparse();
}

yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}
