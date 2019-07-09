/* Mini Calculator */
/* calc.y */

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror(const char *msg);
	double findMod(double a, double b);
	extern int num_pos = 0;
	extern int num_line = 0;


	FILE *yyin;
	
%}

%union{
  double dval;
  int ival;
  char* tokenName;
}
%error-verbose
%start	input 
%token	<ival>	NUMBER 
%token  <tokenName> IDENT
%token  L_PAREN R_PAREN MINUS MULT DIV MOD PLUS SUB LT LTE GT GTE EQUAL EQ NEQ NOT AND OR ASSIGN COMMENT END SEMICOLON COLON COMMA ENDLOOP CONTINUE READ WRITE error_1 error_2 error_3 IF FALSE END_PROGRAM ENDIF ELSE DO BEGIN_PROGRAM ARRAY  WHILE TRUE THEN PROGRAM OF BEGINLOOP 	
%type	<ival>	exp 
%type   <ival>  term
%type   <ival>  mult_exp
%type 	<ival>  expression
%type   <tokenName> relation_exp
%type   <tokenName> comp EQ NEQ LT GT LTE GTE
%type   <tokenName> var
%type   <tokenName> true
%type   <tokenName> false
%type   <tokenName> relation_and_exp
%type   <tokenName> statement
%type   <tokenName> bool_exp
%left	PLUS MINUS
%left	MULT DIV
%nonassoc UMINUS


%%

input		: 
       		| input line   
		;	
	 	
line		: exp EQUAL END {printf("\t%d\n",$1); }
      		| COMMENT EQUAL END {}
		| COMMENT {}
    		;

exp		: NUMBER {printf("number -> NUMBER(%d)\n",$1);  $$ =  $1; }
		| exp PLUS exp	{$$ = $1 + $3; }
		| exp MULT exp	{ $$ = $1 * $3; }
		| exp DIV exp { if($3==0) yyerror("divide by zero"); else $$ = ($1 / $3); }
		| exp SUB exp { $$ = $1 - $3; }
		| exp MOD exp { $$ = findMod($1,$3); }
		| L_PAREN exp R_PAREN { $$ = $2; } 
		| MINUS exp %prec UMINUS { $$ = -$2; }
		;

var		: IDENT {printf("IDENT -> IDENT(%s)\n",$1); $$ = $1 }
   		| IDENT L_PAREN exp R_PAREN {printf("IDENT -> IDENT (%s)\n",$1); $$ = $1}
		;
end		: END { }
     		;

block 		: declaration SEMICOLON BEGIN_PROGRAM statement SEMICOLON { printf("block -> statement(%s) semicolon\n",$4);  }
		;

declaration	: IDENT COMMA IDENT COLON ARRAY L_PAREN NUMBER R_PAREN OF NUMBER { printf("declaration -> ident: %s , ident: %s colon. Array: %d of %d)\n",$1,$3,$7,$10); }  
	   	| IDENT COMMA IDENT COLON NUMBER  { printf("declaration2 -> ident: %s , ident: %s. Number: %d\n",$1,$3,$5); }
		| IDENT COLON NUMBER  { printf("declaration3 -> ident: %s Number: %d\n",$1,$3); }
		;

begin_program	: BEGIN_PROGRAM {printf("begin_program -> BEGIN_PROGRAM\n");}
	     	;

end_program	: END_PROGRAM {printf("end_program -> END_PROGRAM\n");}
	   	;

program 	: PROGRAM {printf("program -> PROGRAM\n"); }	
		;

array		: ARRAY {printf("array -> ARRAY\n"); }
     		;

colon		: COLON {printf("colon -> COLON\n"); }
     		;

term		: var {printf("term -> var(%s)\n",$1); }
		| NUMBER{ printf("term-> NUMBER(%d)\n",$1); $$ = $1}
		| SUB NUMBER {printf ("term -> -NUMBER(%d)\n",$2); $$ = -$2; }
		| L_PAREN exp R_PAREN {printf("term -> term(%d)\n",$2); $$ = $2;  }
		| SUB L_PAREN exp R_PAREN {printf("term -> term(%d)\n",$3); $$ = -$3; }
		;

semicolon	: SEMICOLON {printf("semicolon -> SEMICOLON\n"); }
	 	;
	
comma		: COMMA {printf("comma -> COMMA\n"); }
     		;

assign		: ASSIGN {printf("assign -> ASSIGN\n"); }
      		;

comp		: EQ {printf("comp -> EQ#0\n"); $$ = $1; }
    		| NEQ {printf("comp -> NEQ#0\n"); $$ = $1; }
		| LT {printf("comp -> LT#0\n"); $$ = $1; }
		| GT {printf("comp -> GT#0\n"); $$ = $1; }
		| LTE {printf("comp -> LTE#0\n"); $$ = $1; }
		| GTE {printf("comp -> GTE#0\n"); $$ = $1; }
		;

l_paren  	: L_PAREN {printf("l_paren -> L_PAREN\n"); }
       		;

r_paren	        : R_PAREN {printf("r_paren -> R_PAREN\n"); }
       		;

if		: IF {printf("if -> IF\n");  }
  		;

else		: ELSE {printf("else -> ELSE\n");  }
    		;

read		: READ {printf("read -> READ\n"); }
    		;

do		: DO {printf("do -> DO\n");  }
  		;

true		: TRUE {printf("true -> TRUE\n");  }
    		;

false		: FALSE {printf("false -> FALSE\n");  }
     		;


not		: NOT {printf("not -> NOT\n");  } 
		;

beginloop	: BEGINLOOP {printf("beginloop -> BEGINLOOP\n");  }  
	 	;

endloop 	: ENDLOOP {printf("endloop -> ENDLOOP\n");  }
       		;

continue	: CONTINUE {printf("continue -> CONTINUE\n");  }
		;

while		: WHILE {printf("while -> WHILE\n");  }
     		;

of		: OF {printf("of -> OF\n");  }
  		;

and		: AND {printf("and -> AND\n");  }
   		;

or		: OR {printf("or -> OR\n");  }
  		;

write		: WRITE {printf("write -> WRITE\n");  }
     		;

then		: THEN { printf("then -> THEN\n");  }
    		;

endif		: ENDIF {printf("endif -> ENDIF\n");   }
     		;

mult_exp	: term MULT term {printf("multiply_exp -> term: %d * term: %d\n",$1,$3); $$ = $1 * $3; }
		| term DIV term {printf("multiply_exp -> term: %d / term: %d\n",$1,$3); $$ = $1 / $3;  }
		| term MOD term {printf("multiply_exp -> term: %d mod term: %d\n",$1,$3); $$ = findMod($1,$3); }
		| term {printf("multiply_exp -> term: %d\n",$1); $$ = $1 }
		;

expression	: mult_exp {printf("expression -> term: %d\n",$1); $$ = $1; }
	 	| mult_exp PLUS mult_exp {printf("expression -> expression: %d + expression: %d\n",$1,$3); $$ = $1 + $3; }
		| mult_exp SUB mult_exp {printf("expression -> expression: %d - expression: %d\n",$1,$3); $$ = $1 - $3; }
		;
			
relation_exp	: TRUE {printf("relation_exp -> TRUE\n"); $$ = "TRUE"; }
	    	| FALSE {printf("relation_exp -> FALSE\n"); $$ = "FALSE"; }
		| expression comp expression {printf("relation_exp -> expression: %d comp: %s expression: %d\n",$1,$2,$3); $$ = $1 + $2 + $3; }
		| NOT expression comp expression {printf("relation_exp -> not expression #%d comp #%s expression #%d\n",$2,$3,$4); $$ = "not" + $2 + $3 + $4;  }
		| NOT TRUE {printf("relation_exp -> not TRUE\n"); $$ = "NOT TRUE"; }
		| NOT FALSE {printf("relation_exp -> not FALSE\n"); $$ = "NOT FALSE"; }
		| L_PAREN bool_exp R_PAREN {printf("relation_exp -> bool_exp: %s\n", $2); $$ = $2; }
		| not L_PAREN bool_exp R_PAREN {printf("relation_exp -> not bool_exp: %s\n",$3); $$ = $3;}
		;

relation_and_exp	: relation_exp {printf("relation_and_exp -> %s\n",$1); $$ = $1; }
			| relation_exp AND relation_exp {printf("relation_and_exp -> %s and %s\n",$1,$3); $$ = $1 +  " and "  + $3; }
			;

bool_exp		: relation_and_exp {printf("bool_exp -> %s\n",$1); $$ = $1; }
       			| relation_and_exp OR relation_and_exp {printf("bool_exp -> %s or %s\n",$1,$3); $$ = $1 + " or "  + $3; }
			;	
			
statement		: var ASSIGN expression{ printf("statement -> %s assign %d\n", $1, $3); $$ = $1 + ":=" + $3; }
	 		| IF bool_exp THEN statement SEMICOLON ENDIF { printf("statement -> if %s then %s\n",$2,$4); $$ = "if " + $2 + " then " + $4; }
			| IF bool_exp THEN statement SEMICOLON ELSE statement SEMICOLON ENDIF { printf("statement -> if %s then %s else %s\n",$2, $4, $7); $$ = "if " + $2 + " then " + $4 + " else " + $7; }
			| WHILE bool_exp BEGINLOOP statement SEMICOLON ENDLOOP { printf("statement -> while %s beginloop statement: %s\n", $2,$4); $$ = "while " + $2 + " beginloop " + $4; } 
			| DO BEGINLOOP statement SEMICOLON ENDLOOP WHILE bool_exp { printf("statement -> do %s while %s\n",$3,$7); $$ = "do " + $3 + " while " + $7; }
			| READ var { printf("statement -> read %s\n",$2); $$ = "read " + $2; } 
			| READ var COMMA var { printf("statement -> read %s comma %s\n",$2,$4); $$ = "read " + $2 + " , " + $4; }
			| WRITE var { printf("statement -> write %s\n", $2); $$ = "write " + $2; } 
			| WRITE var COMMA var { printf("statement -> write %s , %s\n",$2,$4); $$ = "write " + $2 + " , " + $4; }
			| CONTINUE { printf("statement -> continue\n"); $$ = "continue"; } 
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


