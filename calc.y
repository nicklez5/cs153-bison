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
%token MULT DIV PLUS SUB EQUAL L_PAREN R_PAREN END MOD EQ NEQ LT GT LTE GTE SEMICOLON COLON COMMA ASSIGN ENDLOOP CONTINUE READ WRITE AND OR NOT TRUE FALSE DO BEGINLOOP WHILE ELSE ENDIF THEN IF OF ARRAY BEGIN_PROGRAM END_PROGRAM PROGRAM  
%type	<dval>	exp
%token  IDENT
%left	PLUS MINUS
%left	MULT DIV
%nonassoc UMINUS


%%

input:		/* empty */
		| input line {currLine++;} 
		;
line:		exp EQUAL END {printf("\t%f\n",$1);}
    		;

exp:		NUMBER	{printf("number -> NUMBER(%f)\n",$1); currLine++; $$ = currLine; }
		| exp PLUS exp	{$$ = $1 + $3; }
		| exp MULT exp	{ $$ = $1 * $3; }
		| exp DIV exp { if($3==0) yyerror("divide by zero"); else $$ = $1 / $3; }
		| exp SUB exp { $$ = $1 - $3; }
		| exp MOD exp { $$ = $(($1 % $3)); }
		| L_PAREN exp R_PAREN { $$ = $2; } 
		| MINUS exp %prec UMINUS { $$ = -$2; }
		;

var:		IDENT {printf("IDENT -> IDENT(%s)\n",$1); currLine++; $$ = currLine; }
   		| IDENT L_PAREN exp R_PAREN {printf("IDENT -> IDENT (%s)\n",$1); currLine++; $$ = currLine;}
		;

block: 		declaration SEMICOLON beginprogram statement SEMICOLON {block_num++; printf("block%d -> statement#%d semicolon#%d block%d#%d\n",block_num,$4,$2,block_num,currLine); currLine++; $$ = currLine; }
     		
		## dont think you need this because it can repeat for who gods no
		| declaration SEMICOLON declaration SEMICOLON beginprogram statement SEMICOLON 
		| declaration SEMICOLON beginprogram statement SEMICOLON statement SEMICOLON 
		;

declaration:	IDENT COMMA COLON ARRAY L_PAREN NUMBER R_PAREN OF NUMBER { declare_num++; printf("declaration -> ident#%f declaration2#%f colon#%f declaration3#%f\n",$1,$7,$3,$9); currLine++; $$ = currLine; }  
	   	| IDENT COMMA IDENT COLON NUMBER  { declare_num++; printf("declaration2 -> comma#%f ident#%f declaration2#%f\n",$2,$1,$3); currLine++; $$ = currLine; }
		| IDENT COLON NUMBER  {
begin_program:	BEGIN_PROGRAM {printf("begin_program -> BEGIN_PROGRAM\n");}
	     	;
end_program:	END_PROGRAM {printf("end_program -> END_PROGRAM\n");}
	   	;
program:	PROGRAM {printf("program -> PROGRAM\n"); currLine = 1; block_num = 1; declare_num = 1; }	
		;

array:		ARRAY {printf("array -> ARRAY\n"); currLine++; $$ = currLine; }
     		;

colon:		COLON {printf("colon -> COLON\n"); currLine++; $$ = currLine; }
     		;

term:		var {printf("term -> var(%s)\n",$1); currLine++; $$ = currLine; }
		| NUMBER{ printf("term-> NUMBER(%s)\n",$1); currLine++; $$ = currLine; }
		| SUB NUMBER {printf ("term -> -NUMBER(%s)\n",$2); currLine++; $$ = currLine; }
		| L_PAREN exp R_PAREN {printf("term -> term(%s)\n",$2); currLine++; $$ = currLine; }
		| SUB L_PAREN exp R_PAREN {printf("term -> term(%s)\n",$3); currLine++; $$ = currLine; }
		;

semicolon:	SEMICOLON {printf("semicolon -> SEMICOLON\n"); currLine++; $$ = currLine; }
	 	;
	
comma:		COMMA {printf("comma -> COMMA\n"); currLine++; $$ = currLine; }
     		;

assign:		ASSIGN {printf("assign -> ASSIGN\n"); currLine++; $$ = currLine; }
      		;

comp:		 EQ {printf("comp -> EQ#0\n"); currLine++; $$ = currLine; }
    		| NEQ {printf("comp -> NEQ#0\n"); currLine++; $$ = currLine; }
		| LT {printf("comp -> LT#0\n"); currLine++; $$ = currLine; }
		| GT {printf("comp -> GT#0\n"); currLine++; $$ = currLine; }
		| LTE {printf("comp -> LTE#0\n"); currLine++; $$ = currLine;}
		| GTE {printf("comp -> GTE#0\n"); currLine++; $$ = currLine; }
		;

l_paren:	L_PAREN {printf("l_paren -> L_PAREN\n"); currLine++; $$ = currLine;}
       		;

r_paren:	R_PAREN {printf("r_paren -> R_PAREN\n"); currLine++; $$ = currLine;}
       		;

if:		IF {printf("if -> IF\n"); currLine++; $$ = currLine;}
  		;

else:		ELSE {printf("else -> ELSE\n"); currLine++; $$ = currLine;}
    		;

read:		READ {printf("read -> READ\n"); currLine++; $$ = currLine;}
    		;

do:		DO {printf("do -> DO\n"); currLine++; $$ = currLine;}
  		;
true:		TRUE {printf("true -> TRUE\n"); currLine++; $$ = currLine;}
    		;
false:		FALSE {printf("false -> FALSE\n"); currLine++; $$ = currLine;}
     		;
not:		NOT {printf("not -> NOT\n"); currLine++; $$ = currLine;} 
		;

beginloop:	BEGINLOOP {printf("beginloop -> BEGINLOOP\n"); currLine++; $$ = currLine;} 
	 	;

endloop: 	ENDLOOP {printf("endloop -> ENDLOOP\n"); currLine++; $$ = currLine;}
       		;
continue:	CONTINUE {printf("continue -> CONTINUE\n"); currLine++; $$ = currLine;}
		;
while:		WHILE {printf("while -> WHILE\n"); currLine++; $$ = currLine;}
     		;

of:		OF {printf("of -> OF\n"); currLine++; $$ = currLine;}
  		;

and:		AND {printf("and -> AND\n"); currLine++; $$ = currLine;}
   		;
or:		OR {printf("or -> OR\n"); currLine++; $$ = currLine;}
  		;

write:		WRITE {printf("write -> WRITE\n"); currLine++; $$ = currLine;}
     		;

then:		THEN { printf("then -> THEN\n"); currLine++; $$ = currLine;}
    		;

endif:		ENDIF {printf("endif -> ENDIF\n"); currLine++; $$ = currLine;}
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


