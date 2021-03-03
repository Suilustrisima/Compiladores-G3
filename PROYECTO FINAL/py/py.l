%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
	int Longitud(char cadena[])
	bool agrupacion(char valor);
	bool operacion(char valor);
	int OctalAdecimal(char numOctal[])
	#define BASE 8
%}
ABRIR 	("["|"("|"{"|"<"){0,20}
CERRAR ("]"|")"|"}"|">"){0,20}
SIGNO	("+"|"-"|"*"|"/"|"[sqrt(0-9){1,10}]"|"[^(0-9){1,10}]"){0,20}
OCTAL (o|O)[0-7]{1,4}

%%
{ABRIR}{CERRAR}	{printf("SIGNOS DE AGRUPACION %s \n",yytext);}
{SIGNO}		{printf("OPERACION MATEMATICA %s \n",yytext);}
{OCTAL}		{printf("OCTAL %s \n",yytext);}
.			{printf("SECUENCIA INVALIDA %s \n",yytext);}
%%



void agrupacion(bool valor, char cadena[]){
	valor = true;
	bool respuesta;
	int lenght = Longitud(cadena)
	//la cadena contiene a los pares de agrupaciòn, entonces la cadena sera verdadera.
	if ((lenght == '{' && lenght == '}')| (lenght == '(' && lenght == ')')| (lenght == '[' && lenght == ']')|(lenght == '<' && lenght == '>')){
		valor += lenght;
		respuesta += valor;
	}else{
		printf("Un signo de agrupaciòn no se escuentra correcto");
		respuesta += false;
	}	
}


void operacion(bool valor, char cadena[]){
	valor = true;
	bool respuesta;
	int lenght = Longitud(cadena)
	//si los signos les preceden màs de sus dìgitos, entonces la cadena es falsa
	if (lenght != '+' && lenght != '-' && lenght == '/' && lenght == '*' && lenght == "sqrt" && lenght == '^'){
		valor += lenght;
		respuesta += valor;
	}else{
		printf("Un signo de agrupaciòn no se escuentra correcto");
		respuesta += false;
	}
}



int Longitud(char cadena[]){
	
	int contador = 0;
	// Recorrer la cadena hasta encontrar el carácter NUL o de terminación
	while (cadena[contador] != 0) {
		contador++;
	}
	return contador;
}



int OctalAdecimal(char numOctal[]){
	//analizar con las funciones (operaciòn, agrupaciòn) para realizar esta funciòn.
	//tomar el octal (despuès del dìgito 0 pues es la O|o), multiplicar el octal por 8 elevado a los n dìgitos que le preceden al octal, y sumar cada resultado.
	int resultado = 0, decimal = 0, potencia = 0;
	int lenght = Longitud(numOctal)
	for (int i=1;i<lenght;i++){
	int actual = numOctal[i]-'0';
	int elevado = pow(BASE,potencia)*actual;
	decimal += elevado;
	potencia++;
	}
	return decimal;
}



int main(){
//
	int OctalAdecimal(char numOctal[]);
	yylex();
	return 0;
}

//EXPRESION ("["|"("|"{"|"<"){0,20}("+"|"-"|"*"|"/"|"[sqrt(0-9){1,10}]"|"[^(0-9){1,10}]"){0,20}((o|O)[0-7]{1,4}){0,20}("]"|")"|"}"|">"){0,20}
