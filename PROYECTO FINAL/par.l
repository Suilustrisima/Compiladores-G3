%option noyywrap
%{
	#include<stdio.h>
	#include<math.h>
	#include "y.tab.h"
	int decimalAOctal( int yytext());
%}

DIGITO	[0-7]+
ID	[a-zA-Z][a-zA-Z0-9]*
%%
{DIGITO}+("."{DIGITO}+)? {yylval.real=atof(yytext); return(NUMERO);}

"("				{
					return(TKN_PAA);
				}
")"				{
					return(TKN_PAC);
				}
"["				{
					return(TKN_CORI);	
				}
"]"				{
					return(TKN_CORD);	
				}
"{"				{
					return(TKN_LLAI);
				}
"}"				{
					return(TKN_LLAD);
				}
"cos"				{
					return(TKN_COS);
				}
"sen"				{
					return(TKN_SEN);
				}
"sqrt"				{
					return(TKN_SQRT);
				}
"ln"				{
					return(TKN_LOG);
				}
{ID}				{	
					return(TKN_ID);
				}
[\t]	;
\n	return 0;
.	return yytext[0];
%%
