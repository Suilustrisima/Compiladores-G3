%option noyywrap
%{
	#include "y.tab.h"
	extern int yylval;
%}

%%

[0-9]+	{
		yylval = atol(yytext); 
		return NUMERO;
	}
"("	{	
		return yytext[0];
	}
")"	{	
		return yytext[0];
	}
[\t]	;
\n	return 0;
.	return yytext[0];
%%
