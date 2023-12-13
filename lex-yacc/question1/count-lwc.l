%{
#include<stdio.h>
int lines=0;
int words=0;
int chars=0;
%}

%%
\n {lines++; chars++;}
[0-9A-Za-z]+ {words++; chars+=yyleng;}
.     { chars++; /* count all other characters */ }
%%

int main()
{
	yylex();
    printf("%d %d %d",lines,words,chars);
}
