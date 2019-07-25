#include <stdio.h>
#include <string.h>
#include "random_struct.h"

ExpStruct *create(){

	ExpStruct *temp = new ExpStruct();
	temp -> result_id = "";
	temp -> code = "";
	return temp;
}
