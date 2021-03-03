%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int nlines = 0;
%}
DIGITO	[0-9]
%%
{DIGITO}+("."{DIGITO}+)?	{yylval.real=atoi(yytext); return NUMERO;}
"("				{return (TKN_PAA);}
")"				{return (TKN_PAC);}
"cos"				{return (TKN_COS);}
"sen"				{return (TKN_SEN);}
"ln"				{return (TKN_LN);}
"e"				{return (TKN_EXP);}
[ \t]	;
\n	return 0;
.	return yytext[0];
%%
