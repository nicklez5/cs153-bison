/* Mini Calculator */
/* calc.lex */

%{
#include "heading.h"
#include "tok.h"
int yyerror(char *s);
int yylineno = 1;
%}

digit		[0-9]
int_const	{digit}+
%option noyywrap
%%

{int_const}	{ yylval.int_val = atoi(yytext); return INTEGER_LITERAL; }
"+"		{ yylval.op_val = new std::string(yytext); return PLUS; }
"*"		{ yylval.op_val = new std::string(yytext); return MULT; }
"/"		{ yylval.op_val = new std::string(yytext); return DIV; }
"="		{ yylval.op_val = new std::string(yytext); return EQUAL;}
"("		{ yylval.op_val = new std::string(yytext); return L_PAREN;}
")"		{ yylval.op_val = new std::string(yytext); return R_PAREN;}
[ \t]*		{}
[\n]		{ yylineno++;	}

.		{ std::cerr << "SCANNER "; yyerror(""); exit(1);	}

