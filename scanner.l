%{
#include <stdio.h>
%}
CADENA [a-zA-Z][a-zA-Z0-9]
LETRA [a-zA-Z]
CIFRA [0-9]

%%
{LETRA}      { fprintf(yyout, "LETRA"); }
{CIFRA}          { fprintf(yyout, "CIFRA"); }
{LETRA}{LETRA}*    { fprintf(yyout, "LETRAS"); }
{CADENA}* { fprintf(yyout, "IDENTFICADOR"); }
{CIFRA} (+ | −)?{CIFRA} CIFRA*((e|E)CIFRA CIFRA*)?
literal real → (+ | −)?cifra cifra*(.cifra cifra*)?((e|E)cifra cifra*)?
literal booleano → verdadero | falso
literal caracter → cualquier caracter encerrado entre comillas dobles
literal cadena → cualquier cadena de caracteres sin comilla simple (o la comilla simple
con / por delante), encerrado entre comillas simples
[ \t\n]+
%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}
