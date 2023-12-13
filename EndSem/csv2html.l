/* Definitions */

%{
#include <stdio.h>

int colnum=1, rownum=1;
int basevalue=1;
%}

%%

[A-Za-z][-:A-Za-z0-9]+ {
    //fprintf(stderr, "Found: %s\n", yytext);
    if(colnum != 1) {
        fprintf(stderr, "Expecting row header in first column %s\n", yytext);
    }
    printf("<tr>\n");
    printf("  <td>%s</td>\n", yytext);
}
[0-9]+ {
    int value = atoi(yytext);
    if(colnum==2) { basevalue=value; }
    float perc=(value-basevalue)*100.0/basevalue;
    printf("  <td>");
    if(perc >= 10) { printf("<b>"); }
    printf("%s",yytext);
    if(perc >= 10) { printf("</b>"); }
    printf("</td>\n");
}
[ \t\r] { }
[\n] {
    rownum++; colnum=1;
    printf("</tr>\n");
    }
[,] {
    colnum++;
    }
. { fprintf(stderr, "Unknown character %s %d\n", yytext, (int)(*yytext)); }

%%
// Additional C code

void printheader() {
    printf("<html>\n\
    <title>CS99 graph</title>\n\
    <body>\n\
    <table>\n\
    ");
}

void printtailer() {
    printf("</table>\n\
    <body>\n\
    </html>\n");
}

int main(int argc, char *argv[]) {
    colnum=1;
    rownum=1;
    printheader();
    yylex();
    printtailer();
}
