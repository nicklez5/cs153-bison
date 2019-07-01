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
		| exp MOD exp { $$ = $(($1 % $3)); }
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

comp:		EQ {printf("comp -> EQ\n"); }
    		| NEQ {printf("comp -> NEQ\n"); }
		| LT {printf("comp -> LT\n"); }
		| GT {printf("comp -> GT\n"); }
		| LTE {printf("comp -> LTE\n"); }
		| GTE {printf("comp -> GTE\n"); }
		;

mult_exp:	term * term {printf("term -> term #%f * term  #%f\n",$1,$3); }
		| term / term {printf("term -> term #%f / term #%f \n",$1,$3); }
		| term % term {printf("term -> term #%f mod term #%f\n",$1,$3); }
		| term {printf("term -> term #%f\n",$1); }
		;
expression:	mult_exp {printf("expression -> term #%f\n",$1); }
	 	| mult_exp + mult_exp {printf("expression -> expression #%f add expression #%f\n",$1,$3); }
		| mult_exp - mult_exp {printf("expression -> expression #%f sub expression #%f\n",$1,$3); }
		;
relation_and_exp:	relation_exp {printf("relation_exp2 -> %s\n",$1); }
		
relation_exp:	true {printf("true -> TRUE\n"); }
	    	| false {printf("false -> FALSE\n"); }
		| expression comp expression {printf("relation_exp -> expression #%f comp #%f expression #%f\n",$1,$2,$3); }
		| not expression comp expression {printf("relation_exp -> not expression #%f comp #%f expression #%f\n",$2,$3,$4); }
		| not true {printf("false -> FALSE\n"); }
		| not false {printf("true -> TRUE\n"); }
		| L_PAREN bool_exp R_PAREN {printf("relation_exp -> bool_exp #%f\n", $2); }
		| not L_PAREN bool_exp R_PAREN {printf("relation_exp -> not bool_exp #%f\n",$3); }
		;
relation_and_exp:	relation_exp {printf("%s",$1); }
			| relation_exp or relation_exp {printf("relation_exp2 -> %s\n",$1); }
			


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


