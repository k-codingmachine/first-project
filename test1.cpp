#include <stdio.h>

int main(void){
	char name[256];
	char what[256];
	int age;
	double weight, height;
	printf("�̸��� ���ϱ�?\n");
	scanf("%s", name, sizeof(name));
	
	printf("���̴�?\n");
	scanf("%d",&age);
	
	printf("�����Դ�?\n");
	scanf("%lf",&weight);
	
	printf("�ⷰ���� ��� �˴ϱ�?\n");
	scanf("%lf",&height);
	
	printf("� ���˸� ���������?\n"); 
	scanf("%s", what, sizeof(what));
	
	printf("�̸�:\t����:%s\t������:%d\tŰ:%lf\t���˸�:%s\n", name, age, weight, height, what);
	return 0;
} 
