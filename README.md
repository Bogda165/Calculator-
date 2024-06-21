# Calculator-
lex/bison
To run:
  flex lexer.l
  bison -d bison.y
  clang bison.tag.c lex.yy.c -o filename
