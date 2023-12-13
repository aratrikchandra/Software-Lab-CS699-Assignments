%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token INTEGER

%left '-'
%left '+'
%left '*'
%left '/'
%%

prog:
| prog expr {printf("%d\n",$2);}
;

expr:
INTEGER {$$ = $1;}
| expr '+' expr {$$ = $1 + $3;}
| expr '-' expr {$$ = $1 - $3;}
| expr '*' expr {$$ = $1 * $3;}
| expr '/' expr {$$ = $1 / $3;}
| '('expr')' {$$ = $2;}
;

%%

void yyerror(char *s)
{
	fprintf(stderr,"%s\n",s);
}

int main()
{
yyparse();
return 0;
}
