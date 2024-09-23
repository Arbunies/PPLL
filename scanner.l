%{
#include <stdio.h>
%}
%option noyywrap

IDENTIFICADOR [a-zA-Z][a-zA-Z0-9]*
LETRA [a-zA-Z]
CIFRA [0-9]
BOOLEANO (verdadero|falso)

%%
[\n] { fprintf(yyout, "\n"); }

\{([^}]|\/\})*\}    { fprintf(yyout, "COMENTARIO "); }

{BOOLEANO} { fprintf(yyout, "BOOLEANO "); }

"accion"|"ACCION"                  { fprintf(yyout, "ACCION "); }
"algoritmo"|"ALGORITMO"            { fprintf(yyout, "ALGORITMO "); }
"booleano"|"BOOLEANO"              { fprintf(yyout, "BOOLEANO "); }
"cadena"|"CADENA"                  { fprintf(yyout, "CADENA "); }
"caracter"|"CARACTER"              { fprintf(yyout, "CARACTER "); }
"const"|"CONST"                    { fprintf(yyout, "CONST "); }
"continuar"|"CONTINUAR"            { fprintf(yyout, "CONTINUAR "); }
"de"|"DE"                          { fprintf(yyout, "DE "); }
"dev"|"DEV"                        { fprintf(yyout, "DEV "); }
"div"|"DIV"                        { fprintf(yyout, "DIV "); }
"ent"|"ENT"                        { fprintf(yyout, "ENT "); }
"entero"|"ENTERO"                  { fprintf(yyout, "ENTERO "); }
"e/s"|"E/S"                        { fprintf(yyout, "E/S "); }
"faccion"|"FACCION"                { fprintf(yyout, "FACCION "); }
"falgoritmo"|"FALGORITMO"          { fprintf(yyout, "FALGORITMO "); }
"falso"|"FALSO"                    { fprintf(yyout, "FALSO "); }
"fconst"|"FCONST"                  { fprintf(yyout, "FCONST "); }
"ffuncion"|"FFUNCION"              { fprintf(yyout, "FFUNCION "); }
"fmientras"|"FMIENTRAS"            { fprintf(yyout, "FMIENTRAS "); }
"fpara"|"FPARA"                    { fprintf(yyout, "FPARA "); }
"fsi"|"FSI"                        { fprintf(yyout, "FSI "); }
"ftipo"|"FTIPO"                    { fprintf(yyout, "FTIPO "); }
"ftupla"|"FTUPLA"                  { fprintf(yyout, "FTUPLA "); }
"funcion"|"FUNCION"                { fprintf(yyout, "FUNCION "); }
"fvar"|"FVAR"                      { fprintf(yyout, "FVAR "); }
"hacer"|"HACER"                    { fprintf(yyout, "HACER "); }
"hasta"|"HASTA"                    { fprintf(yyout, "HASTA "); }
"mientras"|"MIENTRAS"              { fprintf(yyout, "MIENTRAS "); }
"mod"|"MOD"                        { fprintf(yyout, "MOD "); }
"no"|"NO"                          { fprintf(yyout, "NO "); }
"o"|"O"                            { fprintf(yyout, "O "); }
"para"|"PARA"                      { fprintf(yyout, "PARA "); }
"real"|"REAL"                      { fprintf(yyout, "REAL "); }
"ref"|"REF"                        { fprintf(yyout, "REF "); }
"sal"|"SAL"                        { fprintf(yyout, "SAL "); }
"si"|"SI"                          { fprintf(yyout, "SI "); }
"tabla"|"TABLA"                    { fprintf(yyout, "TABLA "); }
"tipo"|"TIPO"                      { fprintf(yyout, "TIPO "); }
"tupla"|"TUPLA"                    { fprintf(yyout, "TUPLA "); }
"var"|"VAR"                        { fprintf(yyout, "VAR "); }
"verdadero"|"VERDADERO"            { fprintf(yyout, "VERDADERO "); }
"e"|"E"                            { fprintf(yyout, "E "); }
"y"|"Y"                            { fprintf(yyout, "Y "); }

":="            { fprintf(yyout, "ASIGNACION "); }
";"             { fprintf(yyout, "COMPOSICION_SECUENCIAL "); }
","             { fprintf(yyout, "SEPARADOR "); }
".."            { fprintf(yyout, "SUBRANGO "); }
":"             { fprintf(yyout, "DEFINICION_TIPO "); }
"->"            { fprintf(yyout, "ENTONCES "); }
"[]"            { fprintf(yyout, "SI_NO_SI "); }
"="             { fprintf(yyout, "CREACION_TIPO "); }
"["             { fprintf(yyout, "INICIO_ARRAY "); }
"]"             { fprintf(yyout, "FIN_ARRAY "); }

"+"             { fprintf(yyout, "OPERADOR_SUMA "); }
"-"             { fprintf(yyout, "OPERADOR_RESTA "); }
"*"             { fprintf(yyout, "OPERADOR_MULTIPLICACION "); }
"/"             { fprintf(yyout, "OPERADOR_DIVISION "); }
"%"             { fprintf(yyout, "OPERADOR_MODULO "); }

"<"             { fprintf(yyout, "OPERADOR_MENOR "); }
"<="            { fprintf(yyout, "OPERADOR_MENOR_IGUAL "); }
">"             { fprintf(yyout, "OPERADOR_MAYOR "); }
">="            { fprintf(yyout, "OPERADOR_MAYOR_IGUAL "); }
"=="            { fprintf(yyout, "OPERADOR_IGUALDAD "); }
"!="            { fprintf(yyout, "OPERADOR_DESIGUALDAD "); }

"&&"            { fprintf(yyout, "OPERADOR_Y_LOGICO "); }
"||"            { fprintf(yyout, "OPERADOR_O_LOGICO "); }
"!"             { fprintf(yyout, "OPERADOR_NEGACION_LOGICA "); }


{LETRA} { fprintf(yyout, "LETRA "); }

{CIFRA} { fprintf(yyout, "CIFRA "); }

{LETRA}{LETRA}* { fprintf(yyout, "CADENA "); }

{IDENTIFICADOR} { fprintf(yyout, "IDENTIFICADOR "); }

[+-]?{CIFRA}+([eE]{CIFRA}+)?    { fprintf(yyout, "ENTERO "); }

[+-]?{CIFRA}+(\.{CIFRA}+)?([eE]{CIFRA}+)?  { fprintf(yyout, "REAL "); }

\"[^\"]\"    { fprintf(yyout, "CARACTER_ENTRE_COMILLAS_DOBLES "); }

\'([^\'\\]|\\.)*\'   { fprintf(yyout, "CADENA_ENTRE_COMILLAS_SIMPLES "); }


[ \t\n]+
%%

int main(int argc, char **argv) {
    yyin = fopen("programa.txt", "r");
    yyout = fopen("out.txt", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}
