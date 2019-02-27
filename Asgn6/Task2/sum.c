#include<stdio.h>


static void StaticFunc()
{
        int i = 0;
        for (i=0; i<1000; i++);
}
void fun1(){
	for(int i=0;i<10000;i++);
}
void fun2(){
	for(int i=0;i<1000000;i++);
}
void fun3(){
	for(int i=0;i<11000;i++);
}
void TestFunc()
{
        int i = 0;
        for (i=0; i<20000000; i++);
        for (i=0; i<100; i++)
                StaticFunc();

}

int main()
{
        int i = 0;
        for (i=0; i<100000000; i++);
        TestFunc();
      fun1();
      fun2();
      fun3();
      	return 0;
}
