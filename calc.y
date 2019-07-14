/* Mini Calculator */
/* calc.y */

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror(const char *msg);
	double findMod(double a, double b);
	char *my_itoa(char *dest,int i);
	extern int num_pos ;
	extern int num_line;
	#define ITOA(n) my_itoa((char [41]) {0},(n))
	char *string3;
	FILE *yyin;
	
%}

%union{
  double dval;
  int ival;
  char* tokenName;
}
%error-verbose
%start	program 
%token	<ival>	NUMBER 
%token  <tokenName> IDENT
%token  L_PAREN R_PAREN MINUS MULT DIV MOD PLUS SUB LT LTE GT GTE EQUAL EQ INTEGER NEQ NOT AND OR ASSIGN  COMMENT END SEMICOLON COLON COMMA ENDLOOP CONTINUE READ WRITE error_1 error_2 error_3 IF FALSE END_PROGRAM ENDIF ELSE DO BEGIN_PROGRAM ARRAY  WHILE TRUE THEN PROGRAM OF BEGINLOOP 	
 
%type   <ival>  term
%type   <ival>  mult_exp
%type 	<ival>  expression
%type   <ival>  expression_helper mult_exp_helper
%type   <tokenName> block block_helper declaration_helper declaration declaration_helper2  
%type   <tokenName> expression_statement ifelse_statement while_statement dobegin_statement readwrite_statement readwrite_helper continue_statement statement_helper
%type   <tokenName> bool_exp relation_and_exp relation_exp relation_and_helper bool_exp_helper 
%type   <tokenName> comp var
%type   <tokenName> statement 
%type   <tokenName> NEQ EQ LT GTE GT LTE   
%left	PLUS MINUS
%left	MULT DIV
%nonassoc UMINUS


%%
program		: PROGRAM IDENT SEMICOLON block END_PROGRAM  { printf("program -> PROGRAM %s SEMICOLON block END_PROGRAM\n", $2); }
		;


block 		: block_helper BEGIN_PROGRAM statement_helper { printf("block -> statement(%s) semicolon\n",$3); sprintf($$,"Block:%s|Statement:%s",$1,$3); $$ =  malloc(strlen($1) + strlen($3) + 18);  }
		;

block_helper    : %empty {}
		| declaration SEMICOLON block_helper { /* printf("block_helper -> %s\n",$1); $$ = $1; */ }
		;

declaration	: declaration_helper COLON declaration_helper2 {$$ = $1;}

declaration_helper : %empty {}
		   | IDENT {printf("declaration -> %s\n",$1); $$ = $1; } 
		   | IDENT COMMA declaration_helper{printf("declaration -> %s\n",$1); $$ = $1; }	
		   ;
declaration_helper2 : ARRAY L_PAREN NUMBER R_PAREN OF INTEGER {printf("declaration2 -> Array: %d of Integer\n",$3); }
		    | INTEGER {printf("declaration2 -> INTEGER\n");  }
		    ;

statement	: expression_statement {$$ = $1;}
	  	| ifelse_statement {$$ = $1; }
		| while_statement {$$ = $1; }
		| dobegin_statement {$$ = $1; }
		| readwrite_statement {$$ = $1; }
		| continue_statement {$$ = $1; }
		;

expression_statement : var ASSIGN expression { printf("Statement -> %s assign %d\n", $1 , $3); sprintf($$,"Var:%s|Expression:%d",$1,$3); $$ = malloc(strlen($1) + strlen(ITOA($3)) + 17); }
		     ;

ifelse_statement 	: IF bool_exp THEN statement_helper ENDIF {printf("IFstatement -> %s\n",$2); printf("ThenStatement -> %s\n",$4); sprintf($$,"If:%s|Then:%s",$2,$4); $$ = malloc(strlen($2) + strlen($4) + 10); }
		  	| IF bool_exp THEN statement_helper ELSE statement_helper ENDIF {printf("IFstatement -> %s\n",$2); printf("ThenStatement -> %s\n",$4); printf("ELSEstatement -> %s\n",$6); sprintf($$,"If:%s|Then:%s|Else:%s",$2,$4,$6); $$ = malloc(strlen($2) + strlen($4) + strlen($6) + 16);  }
			;

while_statement		: WHILE bool_exp BEGINLOOP statement_helper ENDLOOP {printf("whilestatement -> %s\n",$2); sprintf($$,"While:%s|Statement:%s",$2,$4); $$ = malloc(strlen($2) + strlen($4) + 18);  }
		 	;

dobegin_statement	: DO BEGINLOOP statement_helper ENDLOOP WHILE bool_exp {printf("dobegin_statement -> %s\n",$3); sprintf($$,"Do:%s|While:%s", $3,$6); $$ = malloc(strlen($3) + strlen($6) + 11); }
		  	;

readwrite_statement	: READ readwrite_helper { printf("readwrite_statement -> read\n");  }
		    	| WRITE readwrite_helper { printf("readwrite_statement -> write\n");   }
			;

readwrite_helper	: %empty { }
		 	| var COMMA readwrite_helper {$$ = $1;  }
			| var { /* printf("var -> %s\n",$1); $$ = $1; */  }
			;

continue_statement	: CONTINUE {printf("continue_statement -> CONTINUE\n"); $$ = "CONTINUE"; }
			;

statement_helper	: %empty {}
		 	| statement SEMICOLON statement_helper { printf("statement -> %s\n",$1); $$ = $1; }
		 	;

bool_exp		: relation_and_exp bool_exp_helper {printf("bool_exp -> %s %s\n",$1,$2); $$ = malloc(strlen($1) + strlen($2) + 2); sprintf($$,"%s %s",$1,$2); }
			;

relation_and_exp 	: relation_exp relation_and_helper {printf("relation_and_exp -> %s %s\n",$1 , $2); $$ = malloc(strlen($1) + strlen($2) + 2); sprintf($$,"%s %s",$1,$2);   }
			;

relation_and_helper	: %empty {}
		    	| AND relation_exp relation_and_helper {printf("relation_and_helper -> AND %s\n",$2); $$ = malloc(strlen($2) + strlen($3) + 2); sprintf($$,"%s %s",$2,$3); }
			;

bool_exp_helper 	: %empty {}
		 	| OR relation_and_exp bool_exp_helper { printf("bool_exp_helper -> OR %s\n", $2); $$ = malloc(strlen($2) + strlen($3) + 2); sprintf($$,"%s %s", $2 ,$3); }
			;

	
relation_exp		: TRUE {printf("relation_exp -> TRUE\n"); $$ = "TRUE"; }
			| FALSE {printf("relation_exp -> FALSE\n"); $$ = "FALSE"; }
			| expression comp expression {printf("relation_exp -> expression: %d comp: %s expression: %d\n", $1 , $2, $3); sprintf($$,"Exp:%d|Comp:%s|Exp:%d",$1,$2,$3); $$ = malloc(strlen(ITOA($1)) + strlen($2) + strlen(ITOA($3)) + 16); }	      
			| NOT expression comp expression {printf("relation_exp -> not expression: %d comp: %s expression: %d\n",$2,$3,$4); sprintf($$,"NotExp:%d|Comp:%s|Exp:%d", $2,$3,$4); $$ = malloc(strlen(ITOA($2)) + strlen($3) + strlen(ITOA($4)) + 19); }
			| NOT TRUE {printf("relation_exp -> not TRUE\n"); $$ = "NOT TRUE"; }
			| NOT FALSE {printf("relation_exp -> not FALSE\n"); $$ = "NOT FALSE"; }
			| L_PAREN bool_exp R_PAREN {printf("relation_exp -> bool_exp: %s\n", $2); $$ = $2; }
			| NOT L_PAREN bool_exp R_PAREN {printf("relation_exp -> not bool_exp: %s\n",$3); $$ = $3; }
			;

comp		: EQ {printf("comp -> EQ#0\n"); $$ = $1; }
    		| NEQ {printf("comp -> NEQ#0\n"); $$ = $1; }
		| LT {printf("comp -> LT#0\n"); $$ = $1; }
		| GT {printf("comp -> GT#0\n"); $$ = $1; }
		| LTE {printf("comp -> LTE#0\n"); $$ = $1; }
		| GTE {printf("comp -> GTE#0\n"); $$ = $1; }
		;

expression 	: mult_exp expression_helper {printf("expression -> expression: %d\n",$1); $$ = $1; } 
		;

	    
expression_helper : %empty {}
		  | PLUS mult_exp expression_helper {printf("expression -> add expression: %d\n",$2); $$ = $2; }
		  | MINUS mult_exp expression_helper { printf("expression -> sub expression: %d\n",$2); $$ = -$2; }
		  ;

mult_exp	: term mult_exp_helper {printf("multiply_exp -> term: %d\n",$1); $$ = $1; }
		;

mult_exp_helper : %empty {}
		| MULT term mult_exp_helper {printf("multiply_exp -> mult %d\n",$2); $$ = $2; }
		| DIV term mult_exp_helper { printf("multiply_exp -> div %d\n",$2); $$ = $2; }
		| MOD term mult_exp_helper { printf("multiply_exp -> mod %d\n",$2); $$ = $2; }
		;

term		: var {printf("term -> var(%s)\n", $1); }
      		| MINUS var {printf("term -> -var(%s)\n",$2); }
		| NUMBER {printf("term -> NUMBER(%d)\n",$1); $$ = $1; }
		| MINUS NUMBER {printf("term -> -NUMBER(%d)\n",$2); $$ = -$2; }
		| L_PAREN expression R_PAREN {printf("term -> term(%d)\n",$2); $$ = $2; }
		| MINUS L_PAREN expression R_PAREN {printf("term -> term(%d)\n",$3); $$ = -$3; }
		;
var		: IDENT {printf("var -> IDENT(%s)\n",$1); $$ = $1; }
     		| IDENT L_PAREN expression R_PAREN {printf("var -> %s\n",$1); $$ = $1;}
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
char *my_itoa(char *dest,int i){
	sprintf(dest, "%d", i);
	return dest;
}
double findMod(double a, double b){
	if( a < 0)
		a = -a;
	if( b < 0)
		b = -b;
	double mod = a;
	while( mod >= b)
		mod = mod - b;
	if(a < 0)
		return -mod;
	return mod;
}
void yyerror(const char *msg){
	printf("** Line %d, position %d: %s\n", num_line, num_pos, msg);
}


