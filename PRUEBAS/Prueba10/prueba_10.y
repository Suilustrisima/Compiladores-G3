%{
	#include<stdio.h>
	yyerror(char *s);
%}
%{
int yylex();
%}

%token	NOMBRE	NUMERO 

%% 

inicio:	NOMBRE '=' E
	|	E {printf("=%d\n",$1);}
	|	T {printf("=%d\n",$1);}
	|	G {printf("=%d\n",$1);}
	|	H {printf("=%d\n",$1);}
	|	J {printf("=%d\n",$1);}
	|	K {printf("=%d\n",$1);}
		;
E:		E '+' T { $$ = $1 + $3;}
	|	T { $$ = $1;}
T:		T '-' G { $$ = $1 - $3;}
	|	G { $$ = $1;}
G:		G '*' H { $$ = $1 * $3;}
	|	H { $$ = $1;}
H:		H '/' J { $$ = $1 / $3;}
	|	J { $$ = $1;}
J:		J '^' K { $$ = pow($1,$3);}
	|	K { $$ = $1;}
K:		NUMERO { $$ = $1;}
	|	'(' E ')' {$$ = $2;} 
	;
%%
main(){
	yyparse();
	yylex();
}

yyerror(char *s){
	fprintf(stderr,"%s\n", s);
}