%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
#include <math.h>
#include <string.h>
int obtenerValor(char numeroR);
int convertirRomanoAdecimal(char numeroR[]);
double convertirRomanoAdecimalFINAL(char numeroR[]);
void decimalesAromanos(int numero,char* buffer);
int nlines = 0;
char * nRomano[20];
//decimalesAromanos(TKN_NUM,nRomano);
%}
ROMANO	(M|m){0,3}((CM|cm)|(CD|cd)|(D|d)?(C|c){0,3})((XC|xc)|XL(xl)|(L|l)?(X|x){0,3})((IX|xi)|(IV|iv)|(V|v)?(I|i){0,3})
DIGITO	[0-9]
ID	[a-zA-Z][a-zA-Z0-9]*
%%

{DIGITO}+("."{DIGITO}+)?	{yylval.real=atof(yytext); return (TKN_NUM);}
{ROMANO}("."{ROMANO})?	{yylval.real=convertirRomanoAdecimalFINAL(yytext); return (TKN_NUM);}
"="				{return (TKN_ASIGNACION);}
";"				{return (TKN_PTOCOMA);}
"*"				{return (TKN_MULT);}
"sqrt"				{return (TKN_SQRT);}
"cbrt"				{return (TKN_CBRT);}
"/"				{return (TKN_DIV);}
"+"				{return (TKN_MAS);}
"-"				{return (TKN_MENOS);}
"("				{return (TKN_PARENTESISA);}
")"				{return (TKN_PARENTESISC);}
"cos"				{return (TKN_COS);}
"sen"				{return (TKN_SEN);}
"^"				{return (TKN_POTENCIA);}
"e"				{return (TKN_EULER);}
"ln"				{return (TKN_LN);}
{ID}				{return (TKN_ID);}
"\n"				{nlines++;}
.
%%
//----------------------------ROMANOS-----------------------------
int  obtenerValor(char numeroR){
	switch(numeroR){
		case 'I':
			return 1;
		break;
		case 'i':
			return 1;
		break;
		case 'V':
			return 5;
		break;
		case'v':
			return 5;
		break;
		case'X':
			return 10;
		break;
		case 'x':
			return 10;
		break;
		case 'L':
			return 50;
		break;
		case 'l':
			return 50;
		break;
		case 'C':
			return 100;
		break;
		case 'c':
			return 100;
		break;
		case'D':
			return 500;
		break;
		case 'd':
			return 500;
		break;
		case 'M':
			return 1000;
		break;
		case 'm':
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
double	convertirRomanoAdecimalFINAL(char numeroR[]){
	double resultadoFinal;
	int parteEntera, parteFlotante;
	int dimCflotante;
	char *entera;
	char *flotante=strtok(numeroR,".");
	entera=flotante;
	flotante = strtok(NULL, " ");
	//conflicto con ix
	parteEntera=convertirRomanoAdecimal(entera);
//EXISTEN ERRORES CON LA PARTE FLOTANTE CON: 0.i,0.iii,0.v,viii,0.ix
//es mejor usar solo parte entera
	if(flotante!=NULL){
		dimCflotante=strlen(flotante);
		parteFlotante=convertirRomanoAdecimal(flotante);
		resultadoFinal=parteEntera+(parteFlotante/pow((double)10,(double)dimCflotante));
	}else{
		resultadoFinal=parteEntera;
	}
	return resultadoFinal;
}	
void decimalesAromanos(int numero,char* buffer){
//en buffer se inserta el arreglo de salida del numeroRomano ej: char* nRoma[20];
 int unidades, decenas, centenas, millares;
int i=0;
 /*Esto se hace para separar el numero,
 tomen como ejemplo el numero 2103, a ese numero
 lo debemos transformar de la manera siguiente: 
 2 - 1 - 0 - 3 donde 3 va a ocupar la unidades, 
 0 las decenas, 1 las centenas y 2 los millares*/

 unidades = numero % 10; numero /= 10;
 decenas = numero % 10; numero /= 10;
 centenas = numero % 10; numero /= 10;
 millares = numero % 10; numero /= 10;

 switch (millares)
 {
  case 1: strcat(buffer,"M");i++; break;
  case 2: strcat(buffer,"MM");i++; break;
  case 3: strcat(buffer,"MMM");i++;break;
 }
 
 switch (centenas)
 {
  case 1: strcat(buffer,"C"); i++;break;
  case 2: strcat(buffer,"CC"); i++;break;
  case 3: strcat(buffer,"CCC"); i++;break;
  case 4: strcat(buffer,"CD"); i++;break;
  case 5: strcat(buffer,"D"); i++;break;
  case 6: strcat(buffer,"DC"); i++;break;
  case 7: strcat(buffer,"DCC"); i++;break;
  case 8: strcat(buffer,"DCCC"); i++;break;
  case 9: strcat(buffer,"CM"); i++;break; 
 }
 
 switch (decenas)
 {
  case 1: strcat(buffer,"X"); i++;break;
  case 2: strcat(buffer,"XX"); i++;break;
  case 3: strcat(buffer,"XXX"); i++;break;
  case 4: strcat(buffer,"XL"); i++;break;
  case 5: strcat(buffer,"L"); i++;break;
  case 6: strcat(buffer,"LX"); i++;break;
  case 7: strcat(buffer,"LXX"); i++;break;
  case 8: strcat(buffer,"LXXX"); i++;break;
  case 9: strcat(buffer,"XC"); i++;break; 
 }
 
 switch (unidades)
 {
  case 1: strcat(buffer,"I"); i++;break;
  case 2: strcat(buffer,"II"); i++;break;
  case 3: strcat(buffer,"III"); i++;break;
  case 4: strcat(buffer,"IV"); i++;break;
  case 5: strcat(buffer,"V"); i++;break;
  case 6: strcat(buffer,"VI"); i++;break;
  case 7: strcat(buffer,"VII"); i++;break;
  case 8: strcat(buffer,"VIII"); i++;break;
  case 9: strcat(buffer,"IX"); i++;break;
 }
 
}

//-------------------------------------------
