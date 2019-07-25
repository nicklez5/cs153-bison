/* Mini Calculator */
/* calc.y */

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "linked_list.h"	
	#include <string.h>
	void yyerror(const char *msg);
	double findMod(double a, double b);
	char *my_itoa(char *dest,int i);
	char *return_ascii(int i);
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
	FILE *yyin;
	FILE *yyout;
	/*extern int yylex(void); */
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
%left	PLUS MINUS
%left	MULT DIV
%nonassoc UMINUS


%%
		/* Create a program name   */
program		: PROGRAM IDENT SEMICOLON block END_PROGRAM  {  }
		;


block 		: block_helper BEGIN_PROGRAM statement_helper { $$ = "";  }
		;

block_helper    : %empty {$$ = ""; }
		| declaration SEMICOLON block_helper {$$ = "";    }
		;

declaration	: declaration_helper COLON declaration_helper2 { if(strcmp($3,"integer") == 1) {sprintf(str, "   .[] _%s, %s", $1,$3); sprintf(str2," _%s",$1); sprintf(str3,"%s",$1); node_insert(&list_var,str2,str,str3);    $$ = str; } $$ = $1; dont_loop = 0;}
		;  

declaration_helper : %empty {$$ = ""; }
		   | IDENT declaration_helper {dont_loop = 0; $$ = $1; int x; x = *$1; dont_loop = 1; sprintf(str,"   . _%s",$1); sprintf(str2," _%s",$1); sprintf(str3,"%d",x); if(search_value(list_var,str3) == 1){ node_insert(&list_var,str2,str,str3); }    } 
		   | IDENT COMMA declaration_helper{  int x; x = *$1; dont_loop = 1; sprintf(str,"   . _%s",$1); sprintf(str2," _%s",$1); sprintf(str3,"%d",x); if(search_value(list_var,str3) == 1){ node_insert(&list_var,str2,str,str3);   }  $$ = $1; }	
		   ; 

declaration_helper2 : ARRAY L_PAREN NUMBER R_PAREN OF INTEGER { sprintf(str, "%d",$3); $$ = str;  }
		    | INTEGER {$$ = "integer";  }
		    ;

statement	: expression_statement {$$ = "";  }
	  	| ifelse_statement {$$ = "";  }
		| while_statement { $$ = $1; }
		| dobegin_statement {$$ = ""; }
		| readwrite_statement {$$ = $1; }
		| continue_statement {$$ = ""; }
		;
			/* = dst,src          dst = src */
expression_statement : var ASSIGN expression { char* x; x = return_ascii($1); sprintf(str,"%d",$3); sprintf(str2," =%s,%s",value_return(list_var,x),value_return(list_var,str)); node_insert(&list_var,"","",str2); $$ = value_return(list_var,x);   }  
		  
		     ;

ifelse_statement 	: IF bool_exp THEN statement_helper ENDIF { $$ = "";  }
		  	| IF bool_exp THEN statement_helper ELSE statement_helper ENDIF { $$ = ""; }
			;

while_statement		: WHILE bool_exp BEGINLOOP statement_helper ENDLOOP {char* predicate_id; predicate_id = value_return(list_var,$2); char* label; label = value_return(list_var,$4); sprintf(str,"?:= L%d,%s",loop_token,predicate_id); node_insert(&list_func,"","",str); node_insert(&list_func,"","","L");  sprintf(str2,"L%d",loop_token);  $$ = str2; loop_token++;         }
		 	;

dobegin_statement	: DO BEGINLOOP statement_helper ENDLOOP WHILE bool_exp { $$ = "";   }
		  	;

readwrite_statement	: READ var readwrite_helper {char* x; x = return_ascii($2); sprintf(str,"   .<%s",value_return(list_var,x)); sprintf(str2," t%d",term_number); sprintf(str3,".<%s",value_return(list_var,x)); node_insert(&list_var,str2,str,str3); node_insert(&list_func,"","",str3);   $$ = str3;    }
		    	| WRITE var readwrite_helper {char* x; x = return_ascii($2); sprintf(str,"   .>%s",value_return(list_var,x)); sprintf(str2," t%d",term_number); sprintf(str3,".>%s",value_return(list_var,x)); node_insert(&list_var,str2,str,str3); node_insert(&list_func,"","",str3);  $$ = str3;  } 
			;

readwrite_helper	: %empty {$$ = ""; }
		 	| COMMA var readwrite_helper{  }
			;

continue_statement	: CONTINUE {$$ = "";  }
			;

statement_helper	: %empty { $$ = ""; }
		 	| statement SEMICOLON statement_helper { $$ = $1; /* char *x; x = value_return(temp,$1);   sprintf(str,":L%d\n",loop_num);  fprintf(fp,str) */ }
		 	;

bool_exp		: relation_and_exp bool_exp_helper {char *left_id; left_id = value_return(list_var,$1); if(strlen($2) == 0){ $$ = $1; } else {char *right_id; right_id = value_return(list_var,$2); sprintf(str2," t%d",term_number); sprintf(str3,"|| t%d,%s,%s",term_number,left_id,right_id); sprintf(str4,"   %s",str3); if(search_value(list_var,str3) == 1){ node_insert(&list_var,str2,str4,str3); node_insert(&list_func,"","",str3);   term_number++; } $$ = str3; } }
			;

relation_and_exp 	: relation_exp relation_and_helper { char* left_id; left_id = value_return(list_var,$1); if(strlen($2) == 0){ $$ = $1; }else{char* right_id; right_id = value_return(list_var,$2); sprintf(str2," t%d",term_number); sprintf(str3,"&& t%d,%s,%s",term_number,left_id,right_id); sprintf(str4,"   %s",str3); if(search_value(list_var,str3) == 1){ node_insert(&list_var,str2,str4,str3); node_insert(&list_func,"","",str3);  term_number++; } $$ = str3;   }   }
			;

relation_and_helper	: %empty {$$ = "";  }
		    	| AND relation_exp relation_and_helper { $$ = $2;  }
			;

bool_exp_helper 	: %empty {$$ = "";   }
		 	| OR relation_and_exp bool_exp_helper { $$ = $2;  }
			;

	
relation_exp		: TRUE {$$ = "True";  char *x = "True"; sprintf(str,"%s",x); sprintf(str2," t%d",term_number); if(search_value(list_var,str) == 1){ sprintf(str3,"   . t%d",term_number); node_insert(&list_var,str2,str3,x);  term_number++;   }  }

			| FALSE { $$ = "False"; char *x = "False"; sprintf(str,"%s",x); sprintf(str2," t%d",term_number); if(search_value(list_var,str) == 1){ sprintf(str3,"   . t%d",term_number); node_insert(&list_var,str2,str3,x); term_number++; } }

			| expression comp expression {sprintf(str,"%c",$1); if(bool_value($3) == 1){ sprintf(str2,"%c",$3); }else { sprintf(str2,"%d",$3); } char *src2; src2 = value_return(list_var,str); char *src3;  src3 = value_return(list_var,str2); sprintf(str3,"   %s t%d,%s,%s",$2,term_number,src2,src3); sprintf(str2," t%d",term_number); sprintf(str,"  . t%d",term_number); $$ = str3;  node_insert(&list_var,str2,str,str3); node_insert(&list_func,"","",str3); term_number++; $$ = str3;   }	      

			| NOT expression comp expression {sprintf(str,"%c",$2); if(bool_value($4) == 1){ sprintf(str2,"%c",$4); }else { sprintf(str2,"%d",$4); } char *src2; src2 = value_return(list_var,str); char *src3; src3 = value_return(list_var,str2); sprintf(str3,"   %s t%d,%s,%s",$3,term_number,src2,src3); sprintf(str2," t%d",term_number); sprintf(str,"   . t%d",term_number); $$ = str3;  node_insert(&list_var,str2,str,str3); node_insert(&list_func,"","",str3);  term_number++; sprintf(str4,"! t%d,%s",term_number,str2); term_number++; sprintf(str2," t%d",term_number); sprintf(str,"   . t%d",term_number); node_insert(&list_var,str2,str,str4); node_insert(&list_func,"","",str4);  $$ = str4;  }  

			| NOT TRUE { $$ = "Not True"; char *x = "Not True"; sprintf(str,"%s",x); sprintf(str2," t%d",term_number); sprintf(str3,"   t%d",term_number); if(search_value(list_var,str) == 1){ node_insert(&list_var,str2,str3,x); term_number++; } }

			| NOT FALSE { $$ = "Not False"; char *x = "Not False"; sprintf(str,"%s",x); sprintf(str2," t%d",term_number); sprintf(str3,"   t%d\n",term_number); if(search_value(list_var,str) == 1){ node_insert(&list_var,str2,str3,x);   term_number++; } }

			| L_PAREN bool_exp R_PAREN { sprintf(str,"%s",$2); $$ = $2;  }
			| NOT L_PAREN bool_exp R_PAREN { sprintf(str,"%s",$3);  $$ = $3; }
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

	    
expression_helper : %empty {$$ = 0;  }
		  /* dst = src1 + src2 = + dst,src1,src2 */ 
		  | PLUS mult_exp expression_helper { fresh_term = 0; if(bool_value($2) == 1){ sprintf(str,"%c",$2); } else {sprintf(str,"%d",$2); } char *src2; src2 = value_return(list_var,str);  sprintf(str2,"+ t%d,%s,%s",term_number, cur_string_value , src2); sprintf(str3," t%d",term_number); sprintf(str4,"   .%s",str2); node_insert(&list_var,str3,str4,str2); node_insert(&list_func,"","",str2); term_number++;   $$ = $2; }  

		  | MINUS mult_exp expression_helper { fresh_term = 0; if(bool_value($2) == 1){ sprintf(str,"%c",$2); } else {sprintf(str,"%d",$2); } char *src2; src2 = value_return(list_var,str);  sprintf(str2,"- t%d,%s,%s",term_number, cur_string_value , src2); sprintf(str3," t%d",term_number); sprintf(str4,"   .%s",str2); node_insert(&list_var,str3,str4,str2); node_insert(&list_func,"","",str2); term_number++; $$ = $2;  }
		  ;

mult_exp	: term mult_exp_helper {$$ = $1; } 
	 	;


mult_exp_helper : %empty {  }

		/* dst = src1 * src2 = * dst,src1,src2 */
		| MULT term mult_exp_helper {fresh_term = 0; if(bool_value($2) == 1){ sprintf(str,"%c",$2); }else {sprintf(str,"%d",$2); } char* src2; src2 = value_return(list_var,str); sprintf(str2,"* t%d,%s,%s",term_number, cur_string_value, src2); sprintf(str3," t%d",term_number); sprintf(str4,"   .%s",str2); node_insert(&list_var,str3,str4,str2); node_insert(&list_func,"","",str2); term_number++;  $$ = $2; }  /* cur_string_value is in src1 */

		| DIV term mult_exp_helper { fresh_term = 0; if(bool_value($2) == 1){ sprintf(str,"%c",$2); }else { sprintf(str,"%d",$2); } char* src2; src2 = value_return(list_var,str); sprintf(str2,"/ t%d,%s,%s", term_number, cur_string_value , src2); sprintf(str3," t%d",term_number); sprintf(str4,"   .%s",str2); node_insert(&list_var,str3,str4,str2); node_insert(&list_func,"","",str2);  term_number++; $$ = $2;  } 

		| MOD term mult_exp_helper { fresh_term = 0; if(bool_value($2) == 1){ sprintf(str,"%c",$2); }else { sprintf(str,"%d",$2); } char* src2; src2 = value_return(list_var,str); sprintf(str2,"%% t%d,%s,%s", term_number, cur_string_value, src2); sprintf(str3," t%d",term_number); sprintf(str4,"   .%s",str2);  node_insert(&list_var,str3,str4,str2); node_insert(&list_func,"","",str2); term_number++;  $$ = $2;   }
		;

term		: var {  $$ = $1;  }

		| NUMBER { sprintf(str, "   . p%d",point_number); sprintf(str2," p%d",point_number); sprintf(str3,"%d",$1); if(search_value(list_var, str3) == 1) { node_insert(&list_var,str2,str,str3); cur_string_value = str2; point_number++;  } else { if(fresh_term == 0){ cur_string_value = value_return(list_var,str3); fresh_term = 1; }} $$= $1; }  

		| MINUS NUMBER {sprintf(str,"   . p%d",point_number); sprintf(str2," p%d",point_number); sprintf(str3,"-%d",$2); if(search_value(list_var,str3) == 1) { node_insert(&list_var,str2,str,str3); cur_string_value = str2;  point_number++; }else { if(fresh_term == 0){ cur_string_value = value_return(list_var,str3); fresh_term = 1; } } $$ = -$2;  }

		| L_PAREN expression R_PAREN {sprintf(str,"   . p%d",point_number); sprintf(str2," t%d",point_number); sprintf(str3,"%d",$2); if(search_value(list_var,str3) == 1){  node_insert(&list_var,str2,str,str3); cur_string_value = str2;  term_number++;}else { if(fresh_term == 0) {  cur_string_value = value_return(list_var,str3); fresh_term = 1; }} $$ = $2;  }

		| MINUS L_PAREN expression R_PAREN {sprintf(str,"   . p%d",point_number); sprintf(str2," t%d",point_number); sprintf(str3,"-%d",$3);if(search_value(list_var,str3) == 1) { node_insert(&list_var,str2,str,str3); point_number++; }else { if(fresh_term == 0) { cur_string_value = value_return(list_var,str3); fresh_term = 1; } } $$ = -$3;  }
		;


var		: IDENT {int x; x = *$1; $$ = x; sprintf(str,"   . %s",$1); sprintf(str2," _%s",$1); sprintf(str3,"%d",x); cur_string_value = str2; if(search_value(list_var,str3) == 1){ node_insert(&list_var,str2,str,str3); }else {  if(fresh_term == 0) {cur_string_value = value_return(list_var,str3); fresh_term = 1; } }   }
    		

     		| IDENT L_PAREN expression R_PAREN {    }
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



		/*
		fclose(yyin); 
		
		
		/* After reading all the variables and written into a different file 
		* Take in all the input and then write it to here 
		char buff[BUZZ_SIZE];

		char result2[100];
		char *mil_ext = ".mil";
		strcpy(result2,output_file);
		strcat(result2,mil_ext);
		yyin = fopen(result , "r");
		yyout = fopen(result2, "w");
		finished_looping = 1;
		if(yyin == NULL){
			printf("File Opening Error!!");
		}
		 Reading all of the strings and printing on the mil file 
		while(fgets(buff,BUZZ_SIZE,yyin) != NULL){
			fprintf(yyout,"%s\n",buff); 
		}

		fclose(yyin);
		yyparse();		
		fclose(yyout);
		*/
		
	}
	
 //Calls yylex for tokens.
		
	 
	  
	return 0;
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


