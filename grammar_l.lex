/* 
 * Description: Recognize the 32-bit hexadecimal integer from stdin
 * Pattern: 0[xX]([0-9a-fA-F]{1,8})
 */

digit		[0-9]
alpha		[a-zA-Z]
hextail		({digit}|{alpha}){1,8}
hex		0[xX]{hextail}


%{
	#include <string>	
	#include <stdlib.h>
	#include <stdio.h>
	
%}
%option noyywrap
	int num_pos = 0; int num_line = 0;
	int num_int = 0; int num_op = 0;
	int num_parentheses = 0;
	int num_equal = 0;
	string xyz = "";
%%
({digit}+)		num_pos += yyleng; num_int++; xyz = "NUMBER"; xyz += " "; xyz += yytext; return xyz;		 
"+"			++num_pos; num_op++; xyz = "PLUS"; return xyz;
"-"			++num_pos; num_op++; xyz = "MINUS"; return xyz;
"*"			++num_pos; num_op++; xyz = "MULT"; return xyz;
"/"			++num_pos; num_op++; xyz = "DIV"; return xyz;
"("			++num_pos; num_parentheses++; xyz = "L_PAREN"; return xyz;
")"			++num_pos; num_parentheses++; xyz = "R_PAREN"; return xyz;
"%"			++num_pos; xyz = "MOD"; return xyz;
"=="			++num_pos += yyleng; xyz = "EQ"; return xyz;
"<>"			xyz = "NEQ"; num_pos += yyleng; return xyz;
"<"			xyz = "LT"; ++num_pos; return xyz;
">"			xyz = "GT"; ++num_pos; return xyz;
"<="			xyz = "LTE"; num_pos += yyleng; return xyz;
">="			xyz = "GTE"; num_pos += yyleng; return xyz; 
";"			xyz = "SEMICOLON"; num_pos += yyleng; return xyz;
":"			xyz = "COLON"; num_pos += yyleng; return xyz;
","			xyz = "COMMA"; num_pos += yyleng; return xyz;
":="			xyz = "ASSIGN"; num_pos += yyleng; return xyz;
"\n"			num_line++; num_pos = 0;
"program"		xyz = "PROGRAM"; num_pos += yyleng; return xyz;
"beginprogram"		xyz = "BEGIN_PROGRAM"; num_pos += yyleng; return xyz;
"endprogram"		xyz = "END_PROGRAM"; num_pos += yyleng; return xyz;
"integer"		xyz = "INTEGER"; num_pos += yyleng; return xyz;
"array"			xyz = "ARRAY"; num_pos += yyleng; return xyz;
"of"			xyz = "OF"; num_pos += yyleng; return xyz;
"if"			xyz = "IF"; num_pos += yyleng; return xyz;
"then"			xyz = "THEN"; num_pos += yyleng; return xyz;
"endif"			xyz = "ENDIF"; num_pos += yyleng; return xyz;
"else"			xyz = "ELSE"; num_pos += yyleng; return xyz;
"while"			xyz = "WHILE"; num_pos += yyleng; return xyz;
"do"			xyz = "DO"; num_pos += yyleng; return xyz;
"beginloop"		xyz = "BEGINLOOP"; num_pos += yyleng; return xyz;
"endloop"		xyz = "ENDLOOP"; num_pos += yyleng; return xyz;
"continue"		xyz = "CONTINUE"; num_pos += yyleng; return xyz;
"read"			xyz = "READ"; num_pos += yyleng; return xyz;
"write"			xyz = "WRITE"; num_pos += yyleng; return xyz;
"and"			xyz = "AND"; num_pos += yyleng; return xyz;
"or"			xyz = "OR"; num_pos += yyleng; return xyz;
"not"			xyz = "NOT"; num_pos += yyleng; return xyz;
"true"			xyz = "TRUE"; num_pos += yyleng; return xyz;
"false"			xyz = "FALSE"; num_pos += yyleng; return xyz;
[ \t]+			num_pos += yyleng;
([#]+({alpha}+|[ \t]+|{digit}+)*)			num_pos += yyleng;
({alpha}+)|({alpha}+({alpha}|{digit}*){alpha}+)|({alpha}+[_]{alpha}+)|({alpha}+[_]{digit}+)	xyz = "IDENT"; xyz += " "; xyz += yytext;	return xyz;
({digit}+({alpha}))	xyz = "Error at line "; xyz += num_line; xyz += ", column "; xyz += num_pos; xyz += ": identifier "; xyz += yytext; xyz += " must begin with a letter";  return xyz;
({alpha}+([_]))		xyz = "Error at line "; xyz += num_line; xyz += ", column "; xyz += num_pos; xyz += ": identifier "; xyz += yytext; xyz += " cannot end with an underscore"; return xyz;
.			xyz = "Unrecognizable string "; xyz += yytext; xyz += " at line "; xyz += num_line; xyz += " at position "; xyz += num_pos; return xyz;


%%

int main(int argc,char* argv[])
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
}
