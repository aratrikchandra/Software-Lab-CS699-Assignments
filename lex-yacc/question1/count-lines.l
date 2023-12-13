%{
#include<stdio.h>
int lines=0;
%}

%%
\n {lines++;}
.    {/* ignore other characters */}
%%

int main()
{
	yylex();
    printf("%d",lines);
}
