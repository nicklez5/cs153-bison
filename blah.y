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
	char str[12];
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
 

%type   <tokenName>  mult_exp
%type 	<tokenName>  expression
%type   <tokenName>  expression_helper mult_exp_helper
%type   <tokenName> block block_helper declaration_helper declaration declaration_helper2  
%type   <tokenName> expression_statement ifelse_statement while_statement dobegin_statement readwrite_statement readwrite_helper continue_statement statement_helper
%type   <tokenName> bool_exp relation_and_exp relation_exp relation_and_helper bool_exp_helper 
%type   <tokenName> comp var term
%type   <tokenName> statement 
%type   <tokenName> NEQ EQ LT GTE GT LTE   
%left	PLUS MINUS
%left	MULT DIV
%nonassoc UMINUS


%%
program		: PROGRAM IDENT SEMICOLON block END_PROGRAM  {  }
		;


block 		: block_helper BEGIN_PROGRAM statement_helper {    }
		;

block_helper    : %empty { }
		| declaration SEMICOLON block_helper {  }
		;

declaration	: declaration_helper COLON declaration_helper2 { }
	    	| declaration_helper declaration_helper2{  }
		;  

declaration_helper : %empty { }
		   | IDENT { } 
		   | IDENT COMMA declaration_helper{  }	
		   ;
declaration_helper2 : ARRAY L_PAREN NUMBER R_PAREN OF INTEGER {  }
		    | INTEGER {   }
		    ;

statement	: expression_statement {  }
	  	| ifelse_statement { }
		| while_statement { }
		| dobegin_statement { }
		| readwrite_statement { }
		| continue_statement {  }
		;

expression_statement : var ASSIGN expression {  }
		     | var EQUAL expression {  }
		     ;

ifelse_statement 	: IF bool_exp THEN statement_helper ENDIF { }
		  	| IF bool_exp THEN statement_helper ELSE statement_helper ENDIF {   }
			;

while_statement		: WHILE bool_exp BEGINLOOP statement_helper ENDLOOP {  }
		 	;

dobegin_statement	: DO BEGINLOOP statement_helper ENDLOOP WHILE bool_exp {   }
		  	;

readwrite_statement	: READ var readwrite_helper {  }
		    	| WRITE var readwrite_helper {  } 
			;

readwrite_helper	: %empty { }
		 	| COMMA var readwrite_helper{ }
			;

continue_statement	: CONTINUE { }
			;

statement_helper	: %empty { }
		 	| statement SEMICOLON statement_helper {  }
		 	;

bool_exp		: relation_and_exp bool_exp_helper {   }
			;

relation_and_exp 	: relation_exp relation_and_helper {  }
			;

relation_and_helper	: %empty {  }
		    	| AND relation_exp relation_and_helper { }
			;

bool_exp_helper 	: %empty {  }
		 	| OR relation_and_exp bool_exp_helper {  }
			;

	
relation_exp		: TRUE {    }
			| FALSE {   }
			| expression comp expression { }	      
			| NOT expression comp expression { }
			| NOT TRUE {    }
			| NOT FALSE {   }
			| L_PAREN bool_exp R_PAREN { }
			| NOT L_PAREN bool_exp R_PAREN {   }
			;

comp		: EQ {      }
    		| NEQ {     }
		| LT {      }
		| GT {      }
		| LTE {     }
		| GTE {     }
		;

expression 	: mult_exp expression_helper {   } 
		;

	    
expression_helper : %empty {  }
		  | PLUS mult_exp expression_helper {   }
		  | MINUS mult_exp expression_helper {  }
		  ;

mult_exp	: term mult_exp_helper {   }
		;

mult_exp_helper : %empty { }
		| MULT term mult_exp_helper {  }
		| DIV term mult_exp_helper {   } 
		| MOD term mult_exp_helper {   }
		;

term		: var {    }
		| NUMBER {    }
		| MINUS NUMBER {  }
		| L_PAREN expression R_PAREN {   }
		| MINUS L_PAREN expression R_PAREN {   }
		;
var		: IDENT { }
     		| IDENT L_PAREN expression R_PAREN {    }
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


