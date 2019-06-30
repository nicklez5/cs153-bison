/* Mini Calculator */
/* calc.y */

%{
	#include <stdio.h>
	#include <stdlib.h>
	void yyerror(const char *msg);
	extern int currLine;
	extern int currPos;
	FILE *yyin;
	
%}

%union{
  double dval;
  int ival;
}
%error-verbose
%start	input 
%token IDENT
%token	<dval>	NUMBER
%token MULT DIV PLUS SUB EQUAL L_PAREN R_PAREN END MOD EQ NEQ LT GT LTE GTE SEMICOLON COLON COMMA ASSIGN ENDLOOP CONTINUE READ WRITE AND OR NOT TRUE FALSE DO BEGINLOOP WHILE ELSE ENDIF THEN IF OF ARRAY BEGIN_PROGRAM END_PROGRAM PROGRAM  
%type	<dval>	exp
%left	PLUS MINUS
%left	MULT DIV
%nonassoc UMINUS
%%

input:		/* empty */
		| input line
		;
line:		exp EQUAL END {printf("\t%f\n",$1);}
    		;

exp:		NUMBER	{printf("number -> NUMBER(%s)\n",$1); }
		| exp PLUS exp	{$$ = $1 + $3; }
		| exp MULT exp	{ $$ = $1 * $3; }
		| exp DIV exp { if($3==0) yyerror("divide by zero"); else $$ = $1 / $3; }
		| exp SUB exp { $$ = $1 - $3; }
		| exp MOD exp { $$ = $1 % $3; }
		| L_PAREN exp R_PAREN { $$ = $2; } 
		| MINUS exp %prec UMINUS { $$ = -$2; }
		;
var:		IDENT {printf("IDENT -> IDENT(%s)\n",$1);}
   		| IDENT L_PAREN exp R_PAREN {printf("IDENT -> IDENT (%d)\n",exp);}
		;

program:	PROGRAM {printf("program -> PROGRAM\n");}	
		;

colon:		COLON {printf("colon -> COLON\n");}
     		;
term:		var {printf("term -> var(%s)\n",$1); }
    		| SUB var {printf("term-> -var(%s)\n",$1); }
		| NUMBER{ printf("term-> NUMBER(%s)\n",$1); }
		| SUB NUMBER {printf ("term -> -NUMBER(%s)\n",$1); }
		| L_PAREN exp R_PAREN {printf("term -> term(%s)\n",$1); }
		| SUB L_PAREN exp R_PAREN {printf("term -> term(%s)\n",$1); }
		;

semicolon:	SEMICOLON {printf("semicolon -> SEMICOLON\n");}
	 	;
	
comma:		COMMA {printf("comma -> COMMA\n"); }
     		;

assign:		ASSIGN {printf("assign -> ASSIGN\n"); }
      		;





%%
int main(int argc,char **argv){
	if(argc > 1){
		yyin = fopen(argv[1],"r");
		if(yyin == NULL){
			printf("syntax: %s filename\n",argv[0]);
		}//endif
	}//end if
	yyparse(); //Calls yylex for tokens.
	return 0;
}

void yyerror(const char *msg){
	printf("** Line %d, position %d: %s\n", currLine, currPos, msg);
}


