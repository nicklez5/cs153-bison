/* Mini Calculator */
/* calc.y */

%{
	#include <stdio.h>
	#include <stdlib.h>
	void yyerror(const char *msg);
	extern int currLine;
	extern int currPos;
	extern int block_num;
	extern int declare_num;
	FILE *yyin;
	
%}

%union{
  double dval;
  int ival;
  char* tokenName;
}
%error-verbose
%start	input 
%token	<dval>	NUMBER 
%token  MULT DIV PLUS SUB EQUAL L_PAREN R_PAREN END MOD EQ NEQ LT GT LTE GTE SEMICOLON COLON COMMA ASSIGN ENDLOOP CONTINUE READ WRITE AND OR NOT TRUE FALSE DO BEGINLOOP WHILE ELSE ENDIF THEN IF OF ARRAY BEGIN_PROGRAM END_PROGRAM PROGRAM  
%type	<dval>	exp 
%type 	<dval>  var
%type   <dval>  term
%type   <dval>  mult_exp
%token  IDENT
%left	PLUS MINUS
%left	MULT DIV
%nonassoc UMINUS


%%

input:		/* empty */
		| input line {} 
		;
line:		exp EQUAL END {printf("\t%f\n",$1);}
    		;

exp:		NUMBER	{printf("number -> NUMBER(%f)\n",$1);  $$ =  $1; }
		| exp PLUS exp	{$$ = $1 + $3; }
		| exp MULT exp	{ $$ = $1 * $3; }
		| exp DIV exp { if($3==0) yyerror("divide by zero"); else $$ = $1 / $3; }
		| exp SUB exp { $$ = $1 - $3; }
		| exp MOD exp { $$ = $(($1 % $3)); }
		| L_PAREN exp R_PAREN { $$ = $2; } 
		| MINUS exp %prec UMINUS { $$ = -$2; }
		;

var:		IDENT {printf("IDENT -> IDENT(%s)\n",$1); $$ = $1 }
   		| IDENT L_PAREN exp R_PAREN {printf("IDENT -> IDENT (%s)\n",$1); $$ = $1}
		;

block: 		declaration SEMICOLON beginprogram statement SEMICOLON { printf("block -> statement(%s) semicolon\n",$4);  }
     		
		## dont think you need this because it can repeat for who gods no
		| declaration SEMICOLON declaration SEMICOLON beginprogram statement SEMICOLON 
		| declaration SEMICOLON beginprogram statement SEMICOLON statement SEMICOLON 
		;

declaration:	IDENT COMMA IDENT COLON ARRAY L_PAREN NUMBER R_PAREN OF NUMBER { printf("declaration -> ident: %s , ident: %s colon. Array size: %d of %d)\n",$1,$3,$7,$10); }  
	   	| IDENT COMMA IDENT COLON NUMBER  { printf("declaration2 -> ident: %s , ident: %s. Number %d\n",$1,$3,$5); }
		| IDENT COLON NUMBER  { printf("declaration3 -> ident: %s: Number %d\n",$1,$3); }
		;
begin_program:	BEGIN_PROGRAM {printf("begin_program -> BEGIN_PROGRAM\n");}
	     	;
end_program:	END_PROGRAM {printf("end_program -> END_PROGRAM\n");}
	   	;
program:	PROGRAM {printf("program -> PROGRAM\n"); }	
		;

array:		ARRAY {printf("array -> ARRAY\n"); }
     		;

colon:		COLON {printf("colon -> COLON\n"); }
     		;

term:		var {printf("term -> var(%s)\n",$1); $$ = $1 }
		| NUMBER{ printf("term-> NUMBER(%d)\n",$1); $$ = $1}
		| SUB NUMBER {printf ("term -> -NUMBER(%d)\n",$2); $$ = "-" + $2; }
		| L_PAREN exp R_PAREN {printf("term -> term(%d)\n",$2); $$ = $2;  }
		| SUB L_PAREN exp R_PAREN {printf("term -> term(%d)\n",$3); $$ = "-" + $3; }
		;

semicolon:	SEMICOLON {printf("semicolon -> SEMICOLON\n"); }
	 	;
	
comma:		COMMA {printf("comma -> COMMA\n"); }
     		;

assign:		ASSIGN {printf("assign -> ASSIGN\n"); }
      		;

comp:		 EQ {printf("comp -> EQ#0\n"); }
    		| NEQ {printf("comp -> NEQ#0\n"); }
		| LT {printf("comp -> LT#0\n"); }
		| GT {printf("comp -> GT#0\n"); }
		| LTE {printf("comp -> LTE#0\n"); }
		| GTE {printf("comp -> GTE#0\n"); }
		;

l_paren:	L_PAREN {printf("l_paren -> L_PAREN\n"); }
       		;

r_paren:	R_PAREN {printf("r_paren -> R_PAREN\n"); }
       		;

if:		IF {printf("if -> IF\n"); $$ = $1; }
  		;

else:		ELSE {printf("else -> ELSE\n"); $$ = $1; }
    		;

read:		READ {printf("read -> READ\n"); $$ = $1; }
    		;

do:		DO {printf("do -> DO\n"); $$ = $1; }
  		;
true:		TRUE {printf("true -> TRUE\n"); $$ = $1; }
    		;
false:		FALSE {printf("false -> FALSE\n"); $$ = $1; }
     		;
not:		NOT {printf("not -> NOT\n"); $$ = $1; } 
		;

beginloop:	BEGINLOOP {printf("beginloop -> BEGINLOOP\n"); }  
	 	;

endloop: 	ENDLOOP {printf("endloop -> ENDLOOP\n"); }
       		;
continue:	CONTINUE {printf("continue -> CONTINUE\n"); $$ = $1; }
		;
while:		WHILE {printf("while -> WHILE\n"); $$ = $1; }
     		;

of:		OF {printf("of -> OF\n"); }
  		;

and:		AND {printf("and -> AND\n"); $$ = $1; }
   		;
or:		OR {printf("or -> OR\n");  $$ = $1; }
  		;

write:		WRITE {printf("write -> WRITE\n"); $$ = $1; }
     		;

then:		THEN { printf("then -> THEN\n"); $$ = $1; }
    		;

endif:		ENDIF {printf("endif -> ENDIF\n");  $$ = $1; }
     		;

mult_exp:	term * term {printf("term -> term: %s * term: %s\n",$1,$3); $$ = $1 * $3; }
		| term / term {printf("term -> term: %s / term: %s\n",$1,$3); $$ = $1 + " " + "/" + " " + $3;  }
		| term % term {printf("term -> term: %s mod term: %s\n",$1,$3); $$ = $1 + " " + "mod" + " " + $3; }
		| term {printf("term -> term: %s\n",$1); }
		;

expression:	mult_exp {printf("expression -> term: %s\n",$1); $$ = $1; }
	 	| mult_exp + mult_exp {printf("expression -> expression: %s + expression: %s\n",$1,$3); }
		| mult_exp - mult_exp {printf("expression -> expression: %s - expression: %s\n",$1,$3); }
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


