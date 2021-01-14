%{
%}

letter [a-zA-z]
digit [0-9]

%%
\n yylineno++;
#include<{letter}+(\.{letter}*)?> printf("%d\t%s\tPreprocessor Directive\n",yylineno,yytext);
return|main|for|while|case|switch|if|else printf("%d\t%s\tKeyword\n",yylineno,yytext);
int|float|char|struct printf("%d\t%s\tDataType\n",yylineno,yytext);
\( printf("%d\t%s\tOpen Parenthesis\n",yylineno,yytext);
\) printf("%d\t%s\tClosing Parenthesis\n",yylineno,yytext);
{letter}({letter}|{digit})* printf("%d\t%s\tIdentifier\n",yylineno,yytext);
{digit}+ printf("%d\t%s\tInteger\n",yylineno,yytext);
\{ printf("%d\t%s\tOpen Braces\n",yylineno,yytext);
\} printf("%d\t%s\tClose Braces\n",yylineno,yytext);
{digit}+"E"(\+|\-)?{digit}+ printf("%d\t%s\tNumber\n",yylineno,yytext);
{digit}+\.{digit}+(E(\+|\-)?{digit}+)? printf("%d\t%s\tFloat\n",yylineno,yytext);
= printf("%d\t%s\tAssignment\n",yylineno,yytext);
; printf("%d\t%s\tSemi-Colon\n",yylineno,yytext);
\t ;
" " ;
\"({letter}|{digit}|" ")*\" printf("%d\t%s\tConstant\n",yylineno,yytext);

%%

int yywrap(){
    return 1;
}

int main(int argc, char * argv[]){
    yyin=fopen(argv[1],"r");
    printf("LINE\tLEXME\tTOKEN\n");
    yylex();
    fclose(yyin);
    return 0;
}
