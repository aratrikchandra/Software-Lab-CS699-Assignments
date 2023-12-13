%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int yylex(void);
void yyerror(char *);

typedef struct symtab {
    char *name;
    int val;
    struct symtab *next;
} symtab_t;

symtab_t *symtab = NULL;

symtab_t* put_sym(char *name, int val);
int get_sym(char *name);
%}

%union {
    int ival;
    float fval;
    char *sval;
}

%token <ival> INTEGER
%token <fval> FLOAT
%token <sval> IDENTIFIER

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
| FLOAT {$$ = $1;}
| IDENTIFIER { $$ = get_sym($1); }
| IDENTIFIER '=' expr { $$ = put_sym($1, $3)->val; }
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

symtab_t* put_sym(char *name, int val) {
    symtab_t *ptr = (symtab_t*) malloc(sizeof(symtab_t));
    ptr->name = strdup(name);
    ptr->val = val;
    ptr->next = symtab;
    symtab = ptr;
    return ptr;
}

int get_sym(char *name) {
    symtab_t *ptr;
    for(ptr = symtab; ptr != NULL; ptr = ptr->next) {
        if(strcmp(ptr->name, name) == 0) {
            return ptr->val;
        }
    }
    return 0;
}
