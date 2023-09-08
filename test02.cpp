#include <Stdio.h>

int main(void){
	printf("%d", "qwertyuiop"[4]); //[] : 주소지로 가서! 3 : 인덱스 순서출력 
	// 문자열은 문자열이 저장된 메모리의 시작 주소를 반환한다.(예:4210688번지에서부터 문자열이 저장된다.)
	// 해당 주소지부터 4칸을 건너 뛴 후에 주소를 위치시킨후 [4]
	// 그 위치에 저장된 자료를 형식지정자(%c)에 맞게 해석해서 출력하라(printf함수 실행)!!!
	// 이 내용은 참고만..
	printf("\n================\n");
	int i;
	for(i=0; i<sizeof("qwertyuiop")-1; i++){
		printf("%c\n", "qwertyuiop"[i]-32);
	} 
	return 0;

}
