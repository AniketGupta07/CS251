#include <stdio.h>

void divd(double a, double b){

	if(b == 0)
	{
		printf("ERROR Division by zero\n");
		return;
	}
	printf("%lf\n",a/b);
}
