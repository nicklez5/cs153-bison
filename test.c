#include <iostream>
#include <iterator>
#include <map>
#include <string.h>

using namespace std;

int main(){

	map<string,string> _map;
	string x = "_p0";
	string y = "integer";
	_map.insert(pair<string,string>(x,y));
	map<string,string>::iterator itr;
	for(itr = _map.begin(); itr != _map.end(); ++itr){
		cout << '\t' << itr->first
		     << '\t' << itr->second << '\n';	
		
	}
	
	
	return 0;



	/*
	node* T = create();
	node_insert(&T,"_pid0","._hello","0");
	node_insert(&T,"_pid",". _hello44","1");
	printf("Last value: %s\n",value_return(T,"1"));
	node* _t = back_list(T);
	printf("Value: %s\n",_t -> code);
	if(_search(T,"_pid") == 0){
		printf("You havent made it fam\n");
	}
	*/	
	
}
