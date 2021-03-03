%{
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
int obtenerValor(char numeroR);
int convertirRomanoAdecimal(char numeroR[]);

int obtenerValorH(char numeroH);
int convertirHexadAdecimal(char numeroH[]);

int obtenerValorB(char numeroB);
int convertirBinarioAdecimal(char numeroB[]);
%}

DECIMAL [1-9]{1}[0-9]*
ROMANO	(M|m){0,3}((CM|cm)|(CD|cd)|(D|d)?(C|c){0,3})((XC|xc)|XL(xl)|(L|l)?(X|x){0,3})((IX|xi)|(IV|iv)|(V|v)?(I|i){0,3})
HEXADECIMAL h[0-9A-F]+
BINARIO b[0|1]+
OTHERS DECIMAL(*SKIP)(*FAIL)|ROMANO(*SKIP)(*FAIL)|HEXADECIMAL(*SKIP)(*FAIL)|BINARIO(*SKIP)(*FAIL).

%%
{DECIMAL} {
	printf("Numero decimal: %s\n",yytext);
}
{ROMANO} {
	printf("Numero Romano: %s \n",yytext);
	printf("\tEl numero en decimal es: %d \n",convertirRomanoAdecimal(yytext));
	}

{HEXADECIMAL} {
	printf("Numero Hexadecimal: %s \n",yytext);
	printf("\tEl numero en decimal es: %d \n",convertirHexadAdecimal(yytext));
	}
{BINARIO} {
	printf("Numero Binario: %s \n",yytext);
	printf("\tEl numero en decimal es: %d \n",convertirHexadAdecimal(yytext));
	}
.  {printf("Operando: %s\n",yytext);}
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

int  obtenerValorH(char numeroH){
if (numeroH>=0)
return numeroH;
}

int  obtenerValorB(char numeroB){
	printf("Si es binario");
}

int convertirRomanoAdecimal(char numeroR[]){
	int i = 0, resultado = 0;
   while(numeroR[ i ])
   {

      if( (strlen(numeroR)-i) > 2)
      {
      	//se retorna -1 si el primer digito romano es mayor que el segundo
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

int convertirHexadAdecimal(char numeroH[]){
		 char *s = numeroH, *t = NULL;

    strcpy(numeroH, "%d");
    while ((t = strtok(s, "+")) != NULL) {
        s = NULL;
        printf(":%s:\n", t);
    }
    return 0;

}

int convertirBinarioAdecimal(char numeroB[]){
	//double numB = atof(numeroB);
	//int i, x, n, pot;	
	//for(i=0;n!=0;++i)
	//{
	//	numB=n%10;
	//	x=(numB)*pow(2,i)+x;
	//	n=n/10;
	//}return n;
}

int main(){
	int convertirRomanoAdecimal(char numeroR[]);
	int convertirHexadAdecimal(char numeroR[]);
	int convertirBinarioAdecimal(char numeroR[]);
	yylex();
	return 1;

}


