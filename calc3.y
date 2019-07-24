/* Mini Calculator */
/* calc.y */

%{
	#include <stdio.h>
	#include <stdlib.h>
	// #include "linked_list.h"	
	#include <string.h>
	#include <map>
	#include <iterator>
	#include <iostream> 
	#include "random_struct.h"
	#include <sstream>

	using namespace std;
	void yyerror(const char *msg);
	double findMod(double a, double b);
	char *my_itoa(char *dest,int i);
	char *return_ascii(int i);
	string newVirtualReg();

	ostringstream oss;
	int bool_value(int dest);
	extern int num_pos ;
	extern int num_line;
	const char *program_name; 
	char *totalLine;
	#define ITOA(n) my_itoa((char [41]) {0},(n))
	#define BUZZ_SIZE 1024
	
	
	char str[12];
	char str2[12];
	char str3[12]; 
	char str4[12];
	int point_number = 0;
	int term_number = 0;
	int current_value = 0;
	char *cur_string_value;
	int finished_looping = 0; 
	int fresh_term = 0;
	int dont_loop = 0;
	int check_bool_type = 0;
	int loop_token = 0;
	struct node *list_var;
	struct node *list_func;
	extern FILE *yyin;
	extern FILE *yyout;
	extern int yylex(void); 
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
 

%type   <ival>  mult_exp
%type 	<ival>  expression
%type   <ival>  expression_helper mult_exp_helper term var
%type   <tokenName> block block_helper declaration_helper declaration declaration_helper2  
%type   <tokenName> expression_statement ifelse_statement while_statement dobegin_statement readwrite_statement readwrite_helper continue_statement statement_helper
%type   <tokenName> bool_exp relation_and_exp relation_exp relation_and_helper bool_exp_helper 
%type   <tokenName> comp 
%type   <tokenName> statement 
%type   <tokenName> NEQ EQ LT GTE GT LTE 


%type    <ExpStruct> var expression expression_helper mult_exp_helper term mult_exp 
%type    <ExpStruct> block block_helper declaration_helper declaration declaration_helper2 
%type    <ExpStruct> expression_statement ifelse_statement while_statement dobegin_statement readwrite_statement readwrite_helper continue_statement statement_helper
%type    <ExpStruct> bool_exp relation_and_exp relation_exp relation_and_helper bool_exp_helper
%type    <ExpStruct> comp
%type    <ExpStruct> statement
%type    <ExpStruct> NEQ EQ LT GTE GT LTE
/*


*/
%left	PLUS MINUS
%left	MULT DIV
%nonassoc UMINUS


%%
		/* Create a program name   */
program		: PROGRAM IDENT SEMICOLON block END_PROGRAM  {  }
		;


block 		: block_helper BEGIN_PROGRAM statement_helper {   }
		;

block_helper    : %empty {}
		| declaration SEMICOLON block_helper {   }
		;

declaration	: declaration_helper COLON declaration_helper2 { }
		;  

declaration_helper : %empty { }
		   | IDENT declaration_helper {    } 
		   | IDENT COMMA declaration_helper{ }	
		   ; 

declaration_helper2 : ARRAY L_PAREN NUMBER R_PAREN OF INTEGER {  }
		    | INTEGER {  }
		    ;

statement	: expression_statement { }
	  	| ifelse_statement {  }
		| while_statement { }
		| dobegin_statement {   }
		| readwrite_statement { }
		| continue_statement { }
		;
			/* = dst,src          dst = src */
expression_statement : var ASSIGN expression {    }  
		  
		     ;

ifelse_statement 	: IF bool_exp THEN statement_helper ENDIF {   }
		  	| IF bool_exp THEN statement_helper ELSE statement_helper ENDIF {  }
			;

while_statement		: WHILE bool_exp BEGINLOOP statement_helper ENDLOOP {      }
		 	;

dobegin_statement	: DO BEGINLOOP statement_helper ENDLOOP WHILE bool_exp {   }
		  	;

readwrite_statement	: READ var readwrite_helper {    }
		    	| WRITE var readwrite_helper {   } 
			;

readwrite_helper	: %empty { }
		 	| COMMA var readwrite_helper{  }
			;

continue_statement	: CONTINUE {  }
			;

statement_helper	: %empty {  }
		 	| statement SEMICOLON statement_helper { }
		 	;

bool_exp		: relation_and_exp bool_exp_helper { }
			;

relation_and_exp 	: relation_exp relation_and_helper {    }
			;

relation_and_helper	: %empty { }
		    	| AND relation_exp relation_and_helper {  }
			;

bool_exp_helper 	: %empty { }
		 	| OR relation_and_exp bool_exp_helper {  }
			;

	
relation_exp		: TRUE {  }

			| FALSE { }

			| expression comp expression {} 
			| NOT expression comp expression {}
			| NOT TRUE { }

			| NOT FALSE { }

			| L_PAREN bool_exp R_PAREN {  }
			| NOT L_PAREN bool_exp R_PAREN {  }
			;

comp		: EQ {$$ = "==";  }
    		| NEQ {$$ = "!="; }
		| LT { $$ = "<"; }
		| GT { $$ = ">"; }
		| LTE { $$ = "<="; }
		| GTE { $$ = ">="; }
		;

expression 	: mult_exp expression_helper {$$ = $1; } 
		;

	    
expression_helper : %empty {  }
		  /* dst = src1 + src2 = + dst,src1,src2 */ 
		  | PLUS mult_exp expression_helper { }  

		  | MINUS mult_exp expression_helper {   }
		  ;

mult_exp	: term mult_exp_helper { } 
	 	;


mult_exp_helper : %empty {  }

		/* dst = src1 * src2 = * dst,src1,src2 */
		| MULT term mult_exp_helper {   } 

		| DIV term mult_exp_helper {  } 

		| MOD term mult_exp_helper {    }
		;

term		: var {    }

		| NUMBER { }  

		| MINUS NUMBER {  }

		| L_PAREN expression R_PAREN {  }

		| MINUS L_PAREN expression R_PAREN {  }
		;


var		: IDENT {   }
    		

     		| IDENT L_PAREN expression R_PAREN {  }
		;
%%

int main(int argc,char **argv){
	
	if(argc == 2){
		yyin = fopen(argv[1],"r");
		if(yyin == NULL){
			printf("syntax: %s filename\n",argv[0]);
		}//endif
		yyparse();
	}else if(argc == 1){

		yyparse();

	}else if(argc == 3){

		/* Writing to a file */
		char *output_file = argv[2];
		char *file_ext = ".mil";

		char result[100];

		strcpy(result,output_file);
		strcat(result,file_ext);
		 
		yyout = fopen(result,"w");
		
		/* Reading the file and parsing it */
		yyin = fopen(argv[1],"r");

		/* Create a single linked list */

		list_var = create(); 
		list_func = create();

		if(yyin == NULL){
			printf("syntax: %s filename\n",argv[0]);
		}
		 
		yyparse();

		fclose(yyin);
	        print_all_id(list_var,yyout);
		
		print_all_value(list_var,yyout);					
		fclose(yyout);



		
		
	}
	
 //Calls yylex for tokens.
		
	 
	  
	return 0;
}
string newVirtualReg(){
	ostringstream buffer;
	buffer << " p" << point_number;
	return buffer.str();	
}
char *return_ascii(int i){
	sprintf(str,"%d",i);
	char *pChar = str;
	return pChar;	
}
char *my_itoa(char *dest,int i){
	sprintf(dest, "%d", i);
	return dest;
}

/* return a 1 if the character is an ascii value */ 
int bool_value(int dest){
	if((dest >= 97 && dest <= 122) || (dest >= 65 && dest <= 90)){
		return 1;
	}
	return 0;

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


