%{
#include<stdio.h>
#include<stdlib.h>
#include "calc.tab.h"
%}

%%
[ \t\n] {}
[0-9]+ {yylval=atoi(yytext); return INTEGER;}
[+()] {return *yytext;}
. {fprintf(stderr,"Unknown character %s\n",yytext);}

%%
int yywrap() {
    return 1;
}