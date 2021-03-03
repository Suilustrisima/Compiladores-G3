%{
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
int obtenerValor(char numeroR);
int convertirRomanoAdecimal(char numeroR[]);
%}

DECIMAL [1-9]{1}[0-9]*
ROMANO	(M|m){0,3}((CM|cm)|(CD|cd)|(D|d)?(C|c){0,3})((XC|xc)|XL(xl)|(L|l)?(X|x){0,3})((IX|xi)|(IV|iv)|(V|v)?(I|i){0,3})
OTHERS DECIMAL(*SKIP)(*FAIL)|ROMANO(*SKIP)(*FAIL)|.

%%
{DECIMAL} {
	printf("Numero decimal: %s\n",yytext);
}
{ROMANO} {
	printf("Numero Romano: %s \n",yytext);
	printf("El numero en decimal es: %d \n",convertirRomanoAdecimal(yytext));
	}
.  {printf("otra cosa: %s\n",yytext);}
%%
int  obtenerValor(char numeroR){
	switch(numeroR){
		case 'I':
			return 1;
		break;
		case 'i':
			return 1;
		break;
		case 'v':
			return 5;
		break;
		case'V':
			return 5;
		break;
		case'x':
			return 10;
		break;
		case 'X':
			return 10;
		break;
		case 'l':
			return 50;
		break;
		case 'L':
			return 50;
		break;
		case 'c':
			return 100;
		break;
		case 'C':
			return 100;
		break;
		case'd':
			return 500;
		break;
		case 'D':
			return 500;
		break;
		case 'm':
			return 1000;
		break;
		case 'M':
			return 1000;
		break;
	}
}
int convertirRomanoAdecimal(char numeroR[]){
	int i = 0, resultado = 0;
   while(numeroR[ i ])
   {

      if( (strlen(numeroR)-i) > 2)
      {
      	//se retorna -1 si el primer digito romano es mayo que el segundo
         if(obtenerValor(numeroR[ i ]) < obtenerValor(numeroR[i + 2]))
         {
		return -1;
         }
      }
	//si el primero digito romano es mayor o igual, es valido
      if(obtenerValor(numeroR[ i ]) >= obtenerValor(numeroR[i + 1]))
         resultado = resultado + obtenerValor( numeroR[i] );
      else
      {
         resultado = resultado + (obtenerValor(numeroR[i + 1])-obtenerValor(numeroR[ i ]));
         i++;
      }
      i++;
   }
   return resultado;
}

int main(){
	int convertirRomanoAdecimal(char numeroR[]);
	yylex();
	return 1;

}


