%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
	#include <stdbool.h>
	#include <string.h>
	void yyerror(char *s);
	int decimalAOctal(int numDecimal);
	char* itoa (unsigned long long  value,  char str[],  int radix);
	void decimalARomano(int numero);
	unsigned long long int decimal = 0;
%}
%token ZERO ONE
%%
N:	L	{printf("\nEL NUMERO EQUIVALENTE : \n- DECIMAL: %d\n", $$); //Formato Decimal
	
	printf("- OCTAL: %d\n", decimalAOctal($$)); //Formato Octal
	
	char cadena[63];
	itoa($$, cadena, 16);
	printf("- HEXADECIMAL: %s\n", cadena); //Formato Hexadecimal
	
	printf("- ROMANO: ");
	decimalARomano($$); //Formato Romano
	printf("\n");
	}
;
L:  L B {$$=$1*2+$2;}
|   B  {$$=$1;}
;
B:  ZERO {$$=$1;}
|   ONE  {$$=$1;}
;
%%
int main()
{
   printf("\nINGRESE LA SECUENCIA BINARIA: ");
   while(yyparse());
}
yyerror(char *s)
{
  fprintf(stdout, "\n%s", s);
}

//Decimal a Octal
int decimalAOctal( int numeroDecimal ){
    int rem, i = 1, numeroOctal = 0;
 
    while( numeroDecimal != 0 ) {
        rem = numeroDecimal % 8;
        numeroDecimal /= 8;
        numeroOctal += rem * i;
        i *= 10;
    }
    return numeroOctal;
}

char* itoa (unsigned long long  value,  char str[],  int radix)
{
    char buf [66];
    char* dest = buf + sizeof(buf);
    bool sign = false;

    if (value == 0) {
        memcpy (str, "0", 2);
        return str;
    }

    if (radix < 0) {
        radix = -radix;
        if ( (long long) value < 0) {
            value = -value;
            sign = true;
        }
    }

    *--dest = '\0';

    switch (radix)
    {
    case 16:
        while (value) {
            * --dest = '0' + (value & 0xF);
            if (*dest > '9') *dest += 'A' - '9' - 1;
            value >>= 4;
        }
        break;
    case 10:
        while (value) {
            *--dest = '0' + (value % 10);
            value /= 10;
        }
        break;

    case 8:
        while (value) {
            *--dest = '0' + (value & 7);
            value >>= 3;
        }
        break;

    case 2:
        while (value) {
            *--dest = '0' + (value & 1);
            value >>= 1;
        }
        break;

    default:            
        while (value) {
            *--dest = '0' + (value % radix);
            if (*dest > '9') *dest += 'A' - '9' - 1;
            value /= radix;
        }
        break;
    }

    if (sign) *--dest = '-';

    memcpy (str, dest, buf +sizeof(buf) - dest);
    return str;
}

void decimalARomano(int numero){
	int unidades, decenas, centenas, millares;
	unidades = numero % 10; numero /= 10;
 
 	decenas = numero % 10; numero /= 10;
 	centenas = numero % 10; numero /= 10;
 	millares = numero % 10; numero /= 10;

 	switch (millares)
 	{
  		case 1: printf("%s","M"); break;
  		case 2: printf("%s","MM"); break;
  		case 3: printf("%s","MMM"); break;
 	}
 
 	switch (centenas)
 	{
  		case 1: printf("%s","C"); break;
  		case 2: printf("%s","CC"); break;
  		case 3: printf("%s","CCC"); break;
  		case 4: printf("%s","CD"); break;
  		case 5: printf("%s","D"); break;
  		case 6: printf("%s","DC"); break;
  		case 7: printf("%s","DCC"); break;
  		case 8: printf("%s","DCCC"); break;
  		case 9: printf("%s","CM"); break; 
 	}
 
 	switch (decenas)
 	{
  		case 1: printf("%s","X"); break;
  		case 2: printf("%s","XX"); break;
  		case 3: printf("%s","XXX"); break;
  		case 4: printf("%s","XL"); break;
  		case 5: printf("%s","L"); break;
  		case 6: printf("%s","LX"); break;
  		case 7: printf("%s","LXX"); break;
  		case 8: printf("%s","LXXX"); break;
  		case 9: printf("%s","XC"); break; 
 	}
 
 	switch (unidades)
 	{
  		case 1: printf("%s","I"); break;
  		case 2: printf("%s","II"); break;
  		case 3: printf("%s","III"); break;
  		case 4: printf("%s","IV"); break;
  		case 5: printf("%s","V"); break;
  		case 6: printf("%s","VI"); break;
  		case 7: printf("%s","VII"); break;
  		case 8: printf("%s","VIII"); break;
  		case 9: printf("%s","IX"); break;
 	}
}
