%{
#include<stdio.h>
#include<stdlib.h>
#include "calc.tab.h"
%}

%%
[ \t\n] {}
[0-9]+"."[0-9]+ {yylval.fval=atof(yytext); return FLOAT;}
[0-9]+ {yylval.ival=atoi(yytext); return INTEGER;}
[a-zA-Z][a-zA-Z0-9]* {yylval.sval = strdup(yytext); return IDENTIFIER;}
"+" {return *yytext;}
"-" {return *yytext;}
"*" {return *yytext;}
"/" {return *yytext;}
"=" {return *yytext;}
"(" {return *yytext;}
")" {return *yytext;}
. {fprintf(stderr,"Unknown character %s\n",yytext);}
%%

int yywrap() {
    return 1;
}
