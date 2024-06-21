/* just like Unix wc */
%{
    #include "bison.tab.h"
%}

%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
"("    { return OC; }
")"    { return CC; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n     { return EOL; }
[ \t]  { }
.      { printf("Mystery character %s\n", yytext); }
%%

int yywrap() {
    return 1;
}
