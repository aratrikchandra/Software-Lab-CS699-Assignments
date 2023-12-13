/* There is potential conflict between minus hyphane so write in this way */
%{
#include<stdio.h>
#include<stdlib.h>
#include "calc.tab.h"
%}

%%
[ \t\n] {}
[0-9]+ {yylval=atoi(yytext); return INTEGER;}
"+" {return *yytext;}
"-" {return *yytext;}
"(" {return *yytext;}
")" {return *yytext;}
. {fprintf(stderr,"Unknown character %s\n",yytext);}

%%
int yywrap() {
    return 1;
}