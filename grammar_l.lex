/* 
 * Description: Recognize the 32-bit hexadecimal integer from stdin
 * Pattern: 0[xX]([0-9a-fA-F]{1,8})
 */

digit		[0-9]
alpha		[a-zA-Z]
hextail		({digit}|{alpha}){1,8}
hex		0[xX]{hextail}

%{	
	#include <stdlib.h>
	#include <stdio.h>
	#include "y.tab.h"	
%}
%option noyywrap
	int num_pos = 0; int num_line = 0;
	int num_int = 0; int num_op = 0;
	int num_parentheses = 0;
	int num_equal = 0;
	
%%
({digit}+)		{ num_pos += yyleng; num_int++; yylval.ival = atoi(yytext); return NUMBER; }		 
"+"			{ ++num_pos; num_op++; return PLUS; }
"-"			{ ++num_pos; num_op++; return MINUS; }
"*"			{ ++num_pos; num_op++; return MULT; }
"/"			{ ++num_pos; num_op++; return DIV; }
"!"			{ ++num_pos; num_op++; return NOT; }
"("			{ ++num_pos; num_parentheses++; return L_PAREN; }
")"			{ ++num_pos; num_parentheses++;  return R_PAREN; }
"%"			{ ++num_pos; return MOD; }
"="			{ ++num_pos; return EQUAL; }
"=="			{ num_pos += yyleng; return EQ; }
"<>"			{ num_pos += yyleng; return NEQ; }
"<"			{ ++num_pos; return LT; }
">"			{ ++num_pos; return GT; }
"<="			{ num_pos += yyleng; return LTE; }
">="			{ num_pos += yyleng; return GTE; } 
";"			{ num_pos += yyleng; return SEMICOLON; }
":"			{ num_pos += yyleng; return COLON; }
","			{ num_pos += yyleng; return COMMA; }
":="			{ num_pos += yyleng; return ASSIGN; }
"\n"			{ num_line++; num_pos = 0; }
"program"		{ num_pos += yyleng; return PROGRAM; }
"beginprogram"		{ num_pos += yyleng; return BEGIN_PROGRAM; }
"endprogram"		{ num_pos += yyleng; return END_PROGRAM; }
"integer"		{ num_pos += yyleng; return INTEGER; }
"array"			{ num_pos += yyleng; return ARRAY; }
"of"			{ num_pos += yyleng; return OF; }
"if"			{ num_pos += yyleng; return IF; }
"then"			{ num_pos += yyleng; return THEN; }
"endif"			{ num_pos += yyleng; return ENDIF; }
"else"			{ num_pos += yyleng; return ELSE; }
"while"			{ num_pos += yyleng; return WHILE; }
"do"			{ num_pos += yyleng; return DO; }
"beginloop"		{ num_pos += yyleng; return BEGINLOOP; }
"endloop"		{ num_pos += yyleng; return ENDLOOP; }
"continue"		{ num_pos += yyleng; return CONTINUE; }
"read"			{ num_pos += yyleng; return READ; }
"write"			{ num_pos += yyleng; return WRITE; }
"and"			{ num_pos += yyleng; return AND; }
"or"			{ num_pos += yyleng; return OR; }
"not"			{ num_pos += yyleng; return NOT; }
"true"			{ num_pos += yyleng; return TRUE; }
"false"			{ num_pos += yyleng; return FALSE; }
[ \t]+			{ num_pos += yyleng; }
([#]+({alpha}*[ \t]*{digit}*[.(/)_:]*)*)			{ num_pos += yyleng; num_line++;   }
({alpha}+)|({alpha}+({alpha}|{digit}*){alpha}+)|({alpha}+[_]{alpha}+)|({alpha}+[_]{digit}+) { num_pos += yyleng; yylval.tokenName = strdup(yytext); return IDENT; }
({digit}+({alpha}))	{ num_pos += yyleng; return error_1; }
({alpha}+([_]))		{ num_pos += yyleng; return error_2; }
.			{ num_pos += yyleng; return error_3; }


%%

/*int main(int argc,char* argv[])
{
	if(argc >= 2){
		
		yyin = fopen(argv[1],"r");
		if(yyin == NULL){
			yyin = stdin;
		}
		yylex();
		
	}else{
		printf("Give me your input:\n");
		yylex();
	}
}*/


