%{
    #include<stdio.h>
    #include "bison.tab.h"
    void yyerror(char *s);
    int yylex();
%}

%token EOL
%token ADD SUB MUL DIV ABS CC OC
%token NUMBER

%%
    calclist:
     |calclist exp EOL {printf("%d\n", $2);};

    exp: factor
     | exp ADD factor {$$ = $1 + $3;}
     | exp SUB factor {$$ = $1 - $3;}
     ;

     factor: term
      | factor MUL term {$$ = $1 * $3;}
      | factor DIV term {$$ = $1 / $3;}
     ;

     term: NUMBER
      | ABS exp ABS {$$ = ($2 <= 0)? -$2: $2;}
      | OC exp CC {$$ = $2;}
     ;
%%

int main() {
    yyparse();
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}