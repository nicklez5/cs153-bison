#include "linked_list.c"

int main(){
	node* T = create();
	node_insert(&T,"_pid0","._hello","0");
	node_insert(&T,"_pid",". _hello44","1");
	printf("Last value: %s\n",value_return(T,"1"));
	node* _t = back_list(T);
	printf("Value: %s\n",_t -> code);
	if(_search(T,"_pid") == 0){
		printf("You havent made it fam\n");
	}	
	
}
