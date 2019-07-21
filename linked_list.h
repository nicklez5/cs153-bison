#include <stdlib.h>

typedef struct node{
	char *value;				/* the value of the code */
	char *result_id;			/* the identifier */ 
   	char *code;  				/* the result of the code */	
	struct node *next;
}node;


node *create();

void node_insert(node **head,char *temp_id,char *temp_code,char *temp_key);
int _search(node *head,char *temp_key);
int search_value(node *head,char *temp_value);
char *value_return(node *head, char *temp_value);
char *code_return(node *head, char *temp_id);
node *back_list(node *head);
