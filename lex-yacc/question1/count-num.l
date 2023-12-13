%{
#include<stdio.h>
int integers=0;
int floats=0;
%}

%%
[0-9]+ {integers++;}
[0-9]+"."[0-9]+ {floats++;}
.    {/* ignore other characters */}
%%

int main()
{
	yylex();
    printf("%d %d",integers,floats);
}
