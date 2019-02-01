#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//void mpy(double, double);
//void divd(double, double);

int main(int argc, char const *argv[])
{
	FILE* fptr;
	fptr = fopen("test","r");
	char string[100];

	while ( fgets(string, 100, fptr) != NULL ) {
    	
		double num1=0,num2=0;
		int i = 0,j=0;
		int flag = 0;
		char num1_str[50], num2_str[50];
		
		while(string[i]!=' '){

			if(string[i]!='.' && (string[i]>57 || string[i]<48)){
				printf("ERROR1\n");
				int flag = 1;
				break;
			}
			num1_str[j] = string[i];
			i++;j++;
		}
		if(flag)
			break;
		
		num1_str[j] = '\0';

		num1 = atof(num1_str);

		i++; j = 0;
		char c = string[i];

		i = i+2;
		while(string[i]!=' ' && string[i]!='\0' && string[i]!='\n'){

			if(string[i]!='.' && (string[i]>57 || string[i]<48)){
				int flag = 1;
				printf("ERROR2 %d\n",string[i]);
				break;
				
			}
			num2_str[j] = string[i];
			i++;j++;
		}
		if(flag==1){
			break;
		}
		
		num2 = atof(num2_str);
		switch(c){
			case '+' : add(num1,num2);
						break;
			case '-' : sub(num1,num2);
						break;
		        case '*' : mpy(num1,num2);
			 			break;
			 case '/' : divd(num1,num2);
		 			break;
			default : printf("ERROR3\n");
		}
		
	}

	return 0;
}
