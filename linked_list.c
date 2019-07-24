#include <stdio.h>
#include <string.h>
#include "linked_list.h"



node *create(){

	node *temp = NULL;
	temp = (node*)malloc(sizeof(node));
	temp -> next = NULL;
	temp -> result_id = "";
	temp -> code = "";
	temp -> value = "";
	return temp;
	
}
/* returns 0 if its true or return 1 if its not */
int _search(node *head,char *temp_key){
	node* current = head;
	while (current != NULL){
		if(strcmp(current -> result_id, temp_key) == 0){
			return 0;
		}
		current = current -> next;
	}
	return 1;
}
/* returns 0 if its true  */ 
int search_value(node *head,char *temp_value){
	node *current = head;
	while (current != NULL){
		if(strcmp(current -> value, temp_value) == 0){
			return 0;
		}
		current = current -> next;
	}
	return 1;
}
void node_insert(node **head,char *temp_id, char *temp_code, char *temp_key){
	node *p_0 = malloc(sizeof(struct node));
	p_0 -> next = NULL;
	p_0 -> result_id = temp_id;
	p_0 -> code = temp_code;
	p_0 -> value = temp_key;
	

	if(*head == NULL){
		*head = p_0;
	}else{
		p_0 -> next = *head;
		*head = p_0;

	}
	
}
void print_all_id(node *head,FILE *_fp){
	node *current = head;
	while( current != NULL) {
		fprintf(_fp,"   .%s\n",current -> result_id);
		current = current -> next;
	}


}
void print_all_value(node *head,FILE *_fp){
	node *current = head;
	char *random_str = "START";
	fprintf(_fp,": %s\n",random_str);
	int loop_num = 0;
	while( current != NULL) {
		if(strcmp(current->value , "L") == 0){
			fprintf(_fp,": L%d\n",loop_num);
			loop_num++;
		}else{
			fprintf(_fp,"   %s\n",current -> value);
		}
		
		current = current -> next;
	}
	

}
char *code_return(node *head,char *temp_id){
	char *_failed = "";
	node *p = NULL;
	p = head;
	while(p != NULL){
		if(strcmp(p -> result_id , temp_id) == 0){
			return p -> code;
		}
		p = p->next;
	}
	return _failed;	
}
char *value_return(node *head, char *temp_value){
	char *_failed = "";
	node *p = NULL;
	p = head;
	while(p != NULL){
		if(strcmp(p -> value , temp_value) == 0){
			return p -> result_id;
		}
		p = p->next;
	}
	return _failed;
}
node *back_list(node *head){
	node *p = NULL;
	p = head;
	while(p ->next != NULL){
		p = p -> next;
	}
	return p;	
}
