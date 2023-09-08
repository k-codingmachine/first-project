#include <stdio.h>

int main(void){
	char name[256];
	char what[256];
	int age;
	double weight, height;
	printf("이름이 뭡니까?\n");
	scanf("%s", name, sizeof(name));
	
	printf("나이는?\n");
	scanf("%d",&age);
	
	printf("몸무게는?\n");
	scanf("%lf",&weight);
	
	printf("기럭지는 어떻게 됩니까?\n");
	scanf("%lf",&height);
	
	printf("어떤 범죄를 저질렀어요?\n"); 
	scanf("%s", what, sizeof(what));
	
	printf("이름:\t나이:%s\t몸무게:%d\t키:%lf\t범죄명:%s\n", name, age, weight, height, what);
	return 0;
} 
