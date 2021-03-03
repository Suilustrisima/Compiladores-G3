%{
	#include "y.tab.h"
	extern int yylval;
%}
%%
[0-9]+	{yylval = atoid(yytext); return NUMERO;}
[ \t]	;
\n	return 0;
.	return yytext[0];
%%
