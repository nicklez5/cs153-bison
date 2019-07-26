/* Mini Calculator */
/* calc.y */

%{
	#include <iostream>
	#include <stdio.h>
	#include <stdlib.h>	
	#include <string>
	#include <string.h>
	#include <map>
	#include <iterator> 
	#include "random_struct.h"
	#include <sstream>
	#include <vector>
	using namespace std;
	void yyerror(const char *msg);
	double findMod(double a, double b);
	char *my_itoa(char *dest,int i);
	char *return_ascii(int i);
	string newVirtualReg();
	string newVirtualReg2();
	ostringstream oss;
	int bool_value(int dest);
	extern int num_pos ;
	extern int num_line;
	const char *program_name; 
	char *totalLine;
	#define ITOA(n) my_itoa((char [41]) {0},(n))
	#define BUZZ_SIZE 1024
	map<string,string> _map; 
	map<string,string> func_map;
	vector<string> func_vec; 
	string type_1 = "SCALAR";
	string type_2 = "ASSIGN";
	string type_3 = "WHILE";
	string type_4 = "PLUS";
	string type_5 = "READ/WRITE";
	string null_str = "";
	char str[12];
	char *writeable;
	int point_number = 0;
	int term_number = 0;
	
	
	int loop_token = 0;
	//struct node *list_var;
	//struct node *list_func;

	extern FILE *yyin;
	extern FILE *yyout;
	extern int yylex(void);
	extern int yyparse(void); 
%}

%union{
  double dval;
  int ival;
  char* tokenName;
  struct ExpStruct *ExpType;
}
%error-verbose
%start	program 
%token	<ival>	NUMBER 
%token  <tokenName> IDENT
%token  L_PAREN R_PAREN MINUS MULT DIV MOD PLUS SUB LT LTE GT GTE EQUAL EQ INTEGER NEQ NOT AND OR ASSIGN  COMMENT END SEMICOLON COLON COMMA ENDLOOP CONTINUE READ WRITE error_1 error_2 error_3 IF FALSE END_PROGRAM ENDIF ELSE DO BEGIN_PROGRAM ARRAY  WHILE TRUE THEN PROGRAM OF BEGINLOOP 	
 



%type    <ExpType> var expression expression_helper mult_exp_helper term mult_exp bool_exp_helper relation_exp relation_and_helper bool_exp relation_and_exp readwrite_helper
%type    <tokenName> comp declaration_helper2 declaration_helper declaration  

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

declaration	: declaration_helper COLON declaration_helper2 { if(strcmp($3,"INTEGER") != 0 ){ string str_1 = string($1); string num_str = string($3); oss.str(""); oss << "[] _" << str_1 << ", " <<  num_str;  _map.insert(pair<string,string>(oss.str(),type_1));        } }
		;  

declaration_helper : %empty {char *p = (char*)""; $$ = p; }
		   | IDENT declaration_helper { $$ = $1;      } 
		   | IDENT COMMA declaration_helper{ string str_1 = string($1); oss.str(""); oss << " _" << str_1; _map.insert(pair<string,string>(oss.str(),type_1)); string str_2 = string($3); oss.str(""); oss << " _" << str_2; _map.insert(pair<string,string>(oss.str(),type_1)); $$ = $1;  }	
		   ; 

declaration_helper2 : ARRAY L_PAREN NUMBER R_PAREN OF INTEGER { int x; x = $3; string xyz = to_string(x); const char *pchar = xyz.c_str(); char *p = (char*)pchar; $$ = p;    }
		    | INTEGER { char *p = (char*)"INTEGER"; $$ = p;  }
		    ;

statement	: expression_statement { }
	  	| ifelse_statement {  }
		| while_statement { }
		| dobegin_statement {   }
		| readwrite_statement { }
		| continue_statement { }
		;
			/* = dst,src          dst = src */
expression_statement : var ASSIGN expression { oss.str(""); oss << "   =" << $1 -> result_id << "," << $3 -> result_id; func_vec.push_back(oss.str());      }  
		  
		     ;

ifelse_statement 	: IF bool_exp THEN statement_helper ENDIF {   }
		  	| IF bool_exp THEN statement_helper ELSE statement_helper ENDIF {  }
			;

while_statement		: WHILE bool_exp BEGINLOOP statement_helper ENDLOOP { oss.str(""); oss << "   := L" << loop_token; func_vec.push_back(oss.str()); oss.str(""); loop_token++; oss << ": L" << loop_token; func_vec.push_back(oss.str());      }
		 	;

dobegin_statement	: DO BEGINLOOP statement_helper ENDLOOP WHILE bool_exp {   }
		  	;

readwrite_statement	: READ var readwrite_helper {oss.str(""); oss << "   .<" << $2 -> result_id; /*string _result_id = newVirtualReg();*/ /*_map.insert(pair<string,string>(_result_id,type_5)); */ func_vec.push_back(oss.str());  string extra_str = string($3 -> result_id); if(strlen(extra_str.c_str()) != 0){ oss.str(""); oss << "   .<" << $3 -> result_id; /*_map.insert(pair<string,string>(_id2,type_5));*/ func_vec.push_back(oss.str());   } }

		    	| WRITE var readwrite_helper { oss.str(""); oss << "   .>" << $2 -> result_id; /* string _result_id = newVirtualReg(); */ /*_map.insert(pair<string,string>(_result_id,type_5)); */ func_vec.push_back(oss.str());   string extra_str = string($3 -> result_id); if(strlen(extra_str.c_str()) != 0) { oss.str(""); oss << "   .>" << $3 -> result_id; /*_map.insert(pair<string,string>(_id2,type_5));*/ func_vec.push_back(oss.str());    }}
			;

readwrite_helper	: %empty {ExpStruct *temp = create(); $$ = temp;  }
		 	| COMMA var readwrite_helper{ $$ = $2;   }
			;

continue_statement	: CONTINUE {  }
			;

statement_helper	: %empty {  }
		 	| statement SEMICOLON statement_helper { }
		 	;

bool_exp		: relation_and_exp bool_exp_helper  {ExpStruct *temp = create(); string temp_str = string($2 -> result_id); if(strlen(temp_str.c_str()) == 0) { $$ = $1; } else { temp -> result_id = newVirtualReg(); _map.insert(pair<string,string>(temp -> result_id,type_3));  oss.str(""); oss << "   ||" << temp -> result_id << "," << $1 -> result_id << "," << $2 -> result_id; temp -> code = oss.str(); func_vec.push_back(temp -> code); $$ =  temp; } }
			;

relation_and_exp 	: relation_exp relation_and_helper {ExpStruct *temp = create(); string temp_str = string($2 -> result_id); if(strlen(temp_str.c_str()) == 0) { $$ = $1; }else { temp -> result_id = newVirtualReg();  _map.insert(pair<string,string>(temp -> result_id,type_3));  oss.str(""); oss << "   &&" << temp -> result_id << "," << $1 -> result_id << "," << $2 -> result_id; temp -> code = oss.str(); func_vec.push_back(temp -> code);  $$ =  temp; }  }
			;

relation_and_helper	: %empty {ExpStruct *temp = create(); $$ = temp; }
		    	| AND relation_exp relation_and_helper {$$ = $2; }
			;

bool_exp_helper 	: %empty {ExpStruct *temp = create(); $$ = temp;  }
		 	| OR relation_and_exp bool_exp_helper { $$ = $2;  }
			;

	
relation_exp		: TRUE {ExpStruct *temp = create(); temp -> result_id = ""; oss.str(""); oss << ": L" << loop_token; func_vec.push_back(oss.str()); $$ = temp;  }

			| FALSE {ExpStruct *temp = create(); temp -> result_id = ""; oss.str(""); oss << ": L" << loop_token; func_vec.push_back(oss.str());  $$ = temp; }

			| expression comp expression {oss.str(""); oss << ": L" << loop_token; func_vec.push_back(oss.str());  ExpStruct *temp = create(); temp -> result_id = newVirtualReg(); string _comp = string($2); oss.str(""); oss << "   " << _comp << temp -> result_id << "," << $1 -> result_id << "," << $3 -> result_id; temp -> code = oss.str(); _map.insert(pair<string,string>(temp -> result_id,type_3)); func_vec.push_back(temp -> code);  oss.str(""); string _LHS = newVirtualReg(); oss << "   " << "==" << _LHS << "," << temp -> result_id << ", 0"; _map.insert(pair<string,string>(_LHS,type_3)); int other_loop = loop_token + 1; func_vec.push_back(oss.str()); oss.str(""); oss << "   " << "?:= L" << other_loop << "," << _LHS; func_vec.push_back(oss.str());   /*oss << ": L" << loop_token; func_vec.push_back(oss.str());*/  $$ =  temp;  } 

			| NOT expression comp expression {ExpStruct *temp = create(); temp -> result_id = newVirtualReg(); string _comp = string($3); oss.str(""); oss << "   " << _comp << temp -> result_id << "," << $2 -> result_id << "," << $4 -> result_id; temp -> code = oss.str(); _map.insert(pair<string,string>(temp -> result_id,type_3)); oss.str(""); oss << ": L" << loop_token; func_vec.push_back(oss.str()); func_vec.push_back(temp -> code); string new_id = newVirtualReg(); _map.insert(pair<string,string>(new_id, type_3)); oss.str(""); oss << "   !" << new_id  << "," << temp -> result_id; temp -> code = oss.str(); temp -> result_id = new_id;  func_vec.push_back(temp -> code);  $$ = temp; }
			
			| NOT TRUE {ExpStruct *temp = create(); temp -> result_id = ""; oss.str(""); oss << ": L" << loop_token; func_vec.push_back(oss.str());  $$ = temp; }

			| NOT FALSE {ExpStruct *temp = create(); temp -> result_id = ""; oss.str(""); oss << ": L" << loop_token; func_vec.push_back(oss.str());  $$ = temp; }

			| L_PAREN bool_exp R_PAREN {ExpStruct *temp = create(); temp -> result_id = $2 -> result_id; temp -> code = $2 -> code; oss.str(""); oss << ": L" << loop_token; func_vec.push_back(oss.str());  $$ = temp;  }
			| NOT L_PAREN bool_exp R_PAREN {ExpStruct *temp = create(); temp -> result_id = newVirtualReg(); string get_id = $3 -> result_id; oss.str(""); oss << "   !" << temp -> result_id << get_id; temp -> code = oss.str(); _map.insert(pair<string,string>(temp -> result_id,type_3)); $$ = temp; }
			;

comp		: EQ {char *p = (char*)"=="; $$ = p;  }
    		| NEQ { char *p = (char*)"!="; $$ = p; }
		| LT { char *p = (char*)"<"; $$ = p;  }
		| GT { char *p = (char*)">"; $$ = p;  }
		| LTE { char *p = (char*)"<=";  $$ = p; }
		| GTE { char *p = (char*)">="; $$ = p;  }
		;

expression 	: mult_exp expression_helper {ExpStruct *temp = create(); string left_side = $1 -> result_id; string right_side = $2 -> result_id; if(strlen(right_side.c_str()) != 0){  temp -> result_id = newVirtualReg2(); oss.str(""); _map.insert(pair<string,string>(temp -> result_id,type_4)); oss << "   +" << temp -> result_id << "," << left_side << "," << right_side;  temp -> code = oss.str(); func_vec.push_back(temp -> code); $$ = temp; }else {$$ = $1;} }
		;

	    
expression_helper : %empty {ExpStruct *temp = create(); $$ = temp; }
		  /* dst = src1 + src2 = + dst,src1,src2 */ 
		  | PLUS mult_exp expression_helper {$$ = $2;  }  

		  | MINUS mult_exp expression_helper { $$ = $2;  }
		  ;

mult_exp	: term mult_exp_helper {$$ = $1; } 
	 	;


mult_exp_helper : %empty {ExpStruct *temp = create(); $$ = temp; }

		/* dst = src1 * src2 = * dst,src1,src2 */
		| MULT term mult_exp_helper {ExpStruct *temp = create(); $$ = temp;   } 

		| DIV term mult_exp_helper {ExpStruct *temp = create(); $$ = temp;  } 

		| MOD term mult_exp_helper { ExpStruct *temp = create(); $$ = temp;    }
		;

term		: var { $$ = $1; }

		| NUMBER {ExpStruct *temp = create(); int x; x = $1; string xyz = to_string(x); oss.str(""); oss << " " << xyz; temp -> result_id = oss.str(); oss.str(""); oss << "   ." << temp -> result_id; temp -> code = oss.str(); /* _map.insert(pair<string,string>(temp -> result_id,type_1)); */  $$ = temp; }  

		| MINUS NUMBER {ExpStruct *temp = create(); int x; x = $2; oss.str(""); oss << "-" << x; temp -> result_id = oss.str(); oss.str(""); oss << "   ." << temp -> result_id; temp -> code = oss.str();  _map.insert(pair<string,string>(temp -> result_id,type_1));  $$ = temp;  }

		| L_PAREN expression R_PAREN {ExpStruct *temp = create(); $$ = temp;  }

		| MINUS L_PAREN expression R_PAREN { ExpStruct *temp = create(); $$ = temp; }
		;


var		: IDENT {ExpStruct *temp = create(); string str_1 = string($1); oss.str(""); oss << " _" << str_1; temp -> result_id = oss.str(); oss.str(""); oss << "   . _" << str_1; temp -> code = oss.str(); if(_map.find(temp -> result_id) == _map.end()){ _map.insert(pair<string,string>(temp -> result_id,type_1)); } $$ =  temp;  }

     		| IDENT L_PAREN expression R_PAREN {ExpStruct *temp = create(); string str_1 = string($1); oss.str(""); oss << "_" << str_1; temp -> result_id = oss.str(); oss.str(""); oss << "   . _" << str_1; temp -> code = oss.str(); if(_map.find(temp -> result_id) == _map.end()){_map.insert(pair<string,string>(temp -> result_id,type_1));  } $$ = temp; }
		;
%%

int main(int argc,char **argv){
	if(argc == 4){
		yyin = fopen(argv[1],"r");
		if(yyin == NULL){
			printf("syntax: %s filename\n",argv[0]);
		}//endif
		yyparse();
		fclose(yyin); 
		cout << "Hello0" << endl;
	}else if(argc == 5){

		yyparse();
		cout << "Hello1" << endl;
	}else if(argc == 2){
		

		char *output_file = argv[1];

		string min_file = string(output_file); 
		char *file_ext = (char*)".mil";
		cout << "Old File: " << min_file << endl;

		size_t lastindex = min_file.find_last_of(".");
		string raw_file = min_file.substr(0,lastindex);

		oss.str("");
		oss << raw_file << file_ext;

		string MIL_FILE = oss.str();
		cout << "New File: " << MIL_FILE << endl;

		yyout = fopen(MIL_FILE.c_str(),"w");
		
		/* Reading the file and parsing it */
		yyin = fopen(argv[1],"r");


		if(yyin == NULL){
			printf("syntax: %s filename\n",argv[0]);
		}
		 
		yyparse();

		fclose(yyin);
	 	
		map<string,string>::iterator it;
		for(it = _map.begin(); it != _map.end(); it++){
			string xyz = it->first;
			fprintf(yyout,"   .%s\n",xyz.c_str());
		}
		fprintf(yyout,": START\n");
		vector<string>::iterator rit = func_vec.begin();
		for(; rit != func_vec.end(); ++rit){
			string xyz_2 = *rit;
			fprintf(yyout,"%s\n",xyz_2.c_str());
		}
		
		
		
		fclose(yyout);


		
		
	}
	
 
		
	 
	  
	return 0;
}
string newVirtualReg2(){
	ostringstream buffer;
	buffer << " t" << term_number;
	term_number++;
	return buffer.str();
}
string newVirtualReg(){
	ostringstream buffer;
	buffer << " p" << point_number;
	point_number++;
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


