%{
#include <stdio.h>
%}

%x LOWERING
%x TONUMBERS
%option noyywrap

CAPITAL [A-Z]
LETTER [A-Za-z]

%%

<INITIAL>"["         { putchar('['); BEGIN(LOWERING);}
<INITIAL>"{"         { putchar('{'); BEGIN(TONUMBERS);}

<LOWERING>{CAPITAL}  { putchar(yytext[0]-'A'+'a');  }
<LOWERING>"]"        { putchar(']'); BEGIN(INITIAL); }

<TONUMBERS>{LETTER}  { printf("%d",yytext[0]); }
<TONUMBERS>"}"        { putchar('}'); BEGIN(INITIAL); }

%%

int main(){
  return yylex();
}
