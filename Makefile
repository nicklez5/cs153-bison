
parse:	grammar_l.lex calc3.y
	bison -v -d --file-prefix=y calc3.y
	flex grammar_l.lex
	g++ -std=c++11 -g -o my_complier random_struct.c y.tab.c lex.yy.c -lfl
clean: 
	rm -f lex.yy.c y.tab.* y.output *.o calc	

