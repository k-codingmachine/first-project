
SELECT LENGTH('오라클'), LENGTHB('오라클'),
     LENGTH('ORACLE'),LENGTHB('ORACLE')
FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME),
    EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
FROM EMPLOYEE;

------------------------------------------------------------------------------

/*
    * INSTR
    문자열로부터 특정 문자의 시작위치를 찾아서 반환
        시작 기본값은 1
     1 : 앞에서부터 찾겠다.
     -1 : 뒤에서부터 찾겠다.
*/
    
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; --찾을위치의 시작값은 1 기본값, 순서도 1 기본값
SELECT INSTR('AABAACAABBAA', 'B',1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B',-1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B',1,2) FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_') "_위치",INSTR(EMAIL,'@') "@위치"
FROM EMPLOYEE;

--------------------------------------------------------------------------------

/*
    *SUBSTR
    문자열에서 특정 문자열을 추출해서 반환(자바에서의 substring() 메소드와 유사)
    
    SUBSTR(STRING, POSITION, [LENGTH])  => 결과값이 CHARCTER 타입
    -STRING : 문자타입컬럼, 또는 '문자열 값'
    -POSITION : 문자열을 추출할 시작위치값 (음수값으로 제시 가능)
    -LENGTH :  추출할 문자 개수(생략시 끝까지 의미)
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) "성별"
FROM EMPLOYEE;

--여자사원들만 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8 ,1) = '4'; -- 나오는 숫자 = 문자열

--남자사원들만 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1', '3')
ORDER BY 1;

-- 함수 중첩 사용
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) "ID"
FROM EMPLOYEE;

/*
    *LPAD/ RPAD
    문자열을 조회할 때 통일감있게 조회하고자 할 때 사용합니다.
    
    LPAD/RPAD(STRING, 최종적으로 반환할문자의 길이 ,[덧붙이고자하는 문자]) => 결과값은 CHRACTER 타입
    
    문자열에 덧붙이고자하는 문자를 왼쪽 또는 오른쪽에 덧붙여서 최종 N길이만큼의 문자열의 반환
*/
SELECT EMP_NAME, RPAD(EMAIL, 15) --덧붙이고자하는 문자 생략시 기본값이 공백 
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(EMAIL, 15, '#') 
FROM EMPLOYEE;

-- 85918-2****** 조회 => 총 글자수 :14글자
SELECT RPAD('850918-2', 14, '*') FROM DUAL;

--함수 중첩사용
SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*')
FROM EMPLOYEE;

SELECT EMP_NAME, SUBSTR(EMP_NO, 1, 8) || '****' --연결연산자 활용도 가능
FROM EMPLOYEE;

--------------------------------------------------------------------------------

/*
    *LTRIM/RTRIM
    문자열에서 특정 문자를 제거한 나머지를 반환
    
    LTRIM/RTRIM(STRING, [제거하고자하는문자들])   => 결과값은 CHARACRER  타입
    

*/
SELECT LTRIM('   B R ') FROM DUAL;  --제거하고자하는 문자 생략시 기본값이 공백문자
SELECT LTRIM('123123BR123', '123') FROM DUAL;
SELECT LTRIM('ACABACCBR', 'ABC') FROM DUAL;

/*
    *TRIM
    문자열의 앞/뒤/양쪽에 있는 특정문자들을 제거한 나머지 문자열 반환
    
    TRIM([  [LEDAING|TRAILING|BOTH]  제거하고자하는 문자들 FROM ] STRING)
*/
-- 기본적으로 양쪽에 있는 문자들 다 찾아서 제거
SELECT TRIM('  B R  ') FROM DUAL;
SELECT TRIM('Z' FROM 'ZZZBRZZZ') FROM DUAL;

SELECT TRIM(LEADING'Z' FROM 'ZZZBRZZZ') FROM DUAL; -- LEADING : 앞 => LTRIM과 유사
SELECT TRIM(TRAILING'Z' FROM 'ZZZBRZZZ') FROM DUAL; --TRAILING : 뒤 => RTRIM과 유사
SELECT TRIM(BOTH 'Z' FROM 'ZZZBRZZZ') FROM DUAL; -- BOTH : 양쪽 => 생략시 기본값

SELECT TRIM('B' FROM 'ZZZBRZZZ') FROM DUAL; --사이에있는 문자 제거 불가 =>REPLACE 함수이용
--------------------------------------------------------------------------------

/*
    *LOWER/ UPPER/ INITCAP
    
    LOWER/ UPPER/ INITCAP(STRING) => 결과값은 CHARACTER타입
    
    LOWER : 다 소문자로 변경한 문자열 반환(자바에서의 toLowerCase()메소드유사)
    UPPER : 다 대문자로 변경한 문자열 반환(자바에서의 toUpperCase()메소드유사)
    INITCAP : 단어마다 앞글자를 대문자로 변경한 문자열 반환
*/
SELECT LOWER('Welcome To My World') FROM DUAL;
SELECT UPPER('Welcome To My World') FROM DUAL;
SELECT INITCAP('welcome to myworld') FROM DUAL;

--------------------------------------------------------------------------------

/*
    * REPLACE
    
    REPLACE(STRING, STR1, STR2)   =>결과값은  CHARACTER 타입
    
*/
SELECT REPLACE('ZZZBRZZZ', 'BR', '') FROM DUAL; 

SELECT EMP_NAME,EMAIL, REPLACE(EMAIL, 'br.com', 'gmail.com')    
FROM EMPLOYEE;

--------------------------------------------------------------------------------

/*
    <숫자 처리 함수>
    
    *ABS
    숫자의 절대값을 구해주는 함수
    
    ABS(NUMBER)  => 결과값은 NUMBER타입
    
*/
SELECT ABS(-10) FROM DUAL;
SELECT ABS(-5.7) FROM DUAL;

--------------------------------------------------------------------------------

/*
    *MOD
    두 수를 나눈 나머지값을 반환해주는 함수
    
    MOD(NUMBER, NUMBER) => 결과값은 NUMBER타입
*/
SELECT MOD(10,3) FROM DUAL;
--SELECT 10 % 3 FROM DUAL; --%같은 연산자 없음
SELECT 10/3 FROM DUAL;
SELECT MOD(-10.9, 3) FROM DUAL;

--------------------------------------------------------------------------------

/*
    *ROUND
    반올림한 결과를 반환
    
    ROUND(NUMBER, [위치]) ==> 결과값 NUMBER타입
*/
SELECT ROUND(123.456)FROM DUAL; --위치 생략시 0이 기본값
SELECT ROUND(123.456, 1) FROM DUAL;
SELECT ROUND(123.456, 5) FROM DUAL;
SELECT ROUND(123.456, -1) FROM DUAL;
SELECT ROUND(123.456, -2) FROM DUAL;

SELECT ROUND(15703, -3) FROM DUAL;
--------------------------------------------------------------------------------
/*
    *CEIL
    올림처리해주는 함수
    
    CEIL(NUMBER)
*/
SELECT CEIL(123.152) FROM DUAL;  --(위치지정 불가능)
SELECT CEIL(123.000) FROM DUAL;
SELECT CEIL(123.001) FROM DUAL;
--------------------------------------------------------------------------------
/*
    *FLOOR
    소수점 아래 버림처리하는 함수
    
    FLOOR(NUMBER)

*/
SELECT FLOOR(123.952) FROM DUAL;
/*

/*
    *TRUNC
    위치 지정 가능한 버림처리해주는 함수
    
    TRUNC(NUMBER,[위치])
*/
SELECT TRUNC(123.952) FROM DUAL;
SELECT TRUNC(123.952, 1) FROM DUAL;

--------------------------------------------------------------------------------

-- * SYSDATE : 시스템 날짜 및 시간 반환(현재 날짜 및 시간)
SELECT SYSDATE FROM DUAL;
/*
    <날짜 처리 함수>
*/


-- * MONTHS_BETWEEN(DATE1, DATE2) : 두 날짜 사이의 개월 수 반환 => 결과값은 NUMBER타입
--  내부적으로 DATE1 - DATE2 후 나누기 30또는 31 이 진행된다
-- 사원명, 입사일, 근무일수, 근무개월수
SELECT EMP_NAME, HIRE_DATE,
       FLOOR(SYSDATE - HIRE_DATE) "근무일수",
       CEIL(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) ||'개월차' "근무개월수"
FROM EMPLOYEE;

-- * ADD_MONTHS(DATE, NUMBER) : 특정 날짜에서 해당 숫자만큼의 개월수를 더해서 그 날짜 반환
--                              => 결과값은  DATE타입
SELECT ADD_MONTHS(SYSDATE,5) FROM DUAL;

--사원명, 입사일, 입사후 6개월이 된 날짜 조회
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6)
FROM EMPLOYEE;

-- * NEXT_DAY(DATE, 요일(문자|숫자)) : 특정 날짜 이후에 가까운 해당 요일의 날짜를 변환
--                                   => 결과값은 DATE 타입
SELECT SYSDATE, NEXT_DAY(SYSDATE, '금요일') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월') FROM DUAL;
-- 1:일, 2:월, 3:화, ....6:금, 7:토
SELECT SYSDATE, NEXT_DAY(SYSDATE, 6) FROM DUAL;

SELECT SYSDATE, NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL; --에러 현재언어가 KOREAN이기 때문

--언어변경
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_LANGUAGE = KOREAN;

-- *LAST_DAY(DATE) : 해당 월의 마지막 날짜를 구해서 반환 => 결과값은 DATE타입
SELECT LAST_DAY(SYSDATE) FROM DUAL;

-- 사원명, 입사일, 입사한 달의 마지막날짜, 입사한달의 근무한 일수
SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE),LAST_DAY(HIRE_DATE)-HIRE_DATE
FROM EMPLOYEE;

/*
    * EXTRACT : 특정 날짜로부터 년|월|일 값을 추출해서 반환
    
    EXTRACT(YEAR FROM DATE) : 년도만을 추출
    EXTRACT(MONTH FROM DATE) : 월말을 추출
    EXTRACT(DAY FROM DATE) : 일만을 추출
    
    => 결과값은 NUMBER타입
*/
SELECT EMP_NAME,
        EXTRACT(YEAR FROM HIRE_DATE) "입사년도",
        EXTRACT(MONTH FROM HIRE_DATE) "입사월",
        EXTRACT(DAY FROM HIRE_DATE) "입사일"
FROM EMPLOYEE
ORDER BY 입사년도, 입사월,입사일;

--------------------------------------------------------------------------------

/*
    <형변환 함수>
    * TO_CHAR : 숫자 타입 또는 날짜 타입의 값은 문자타입으로 변환시켜주는 함수
    
    TO_CHAR(숫자|날짜, [포맷])  => 결과값은 CHARACETER  타입
*/

-- 숫자타입 => 문자타입
SELECT TO_CHAR(1234) FROM DUAL; --'1234'

SELECT TO_CHAR(1234, '99999') FROM DUAL; -- 빈칸 공백으로 채우고
SELECT TO_CHAR(1234, '00000') FROM DUAL; -- 빈칸 0으로 채운다
SELECT TO_CHAR(1234, 'FM00000') FROM DUAL; --FM 의미없는 앞공백 없애줌
SELECT TO_CHAR(1234, 'L99999') FROM DUAL; --현재 설정된 나라(LOCAL)의 화폐단위
SELECT TO_CHAR(1234, '$99999') FROM DUAL;
SELECT TO_CHAR(1234, 'L99,999') FROM DUAL;

SELECT EMP_NAME, TO_CHAR(SALARY, 'L999,999,999'), TO_CHAR(SALARY*12, 'L999,999,999')
FROM EMPLOYEE;

--날짜타입 => 문자타입
SELECT SYSDATE, TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'AM HH24:MI:SS') FROM DUAL; --HH: 12시간 형식 / HH24: 24시간 형식 / AM|PM : 오전,오후(뭘 써도 상관X)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY-FMMM-DD DAY') FROM DUAL; --FM을 붙이면 0 없앨수있음(단, FM이 붙은 자리 이후 모두 적용)

--년도와 관련된 포맷
SELECT  TO_CHAR(SYSDATE, 'YYYY'),
        TO_CHAR(SYSDATE, 'RRRR'),
        TO_CHAR(SYSDATE, 'YY'),
        TO_CHAR(SYSDATE, 'RR'),
        TO_CHAR(SYSDATE, 'YEAR')
FROM DUAL;

-- 월과 관련된 포맷
SELECT  TO_CHAR(SYSDATE, 'MM'),
        TO_CHAR(SYSDATE, 'MON'),
        TO_CHAR(SYSDATE, 'MONTH'),
        TO_CHAR(SYSDATE, 'RM') --로마기호
FROM DUAL;        

-- 일에 관련된 포맷
SELECT  TO_CHAR(SYSDATE, 'DDD'), -- 년 기준 몇일째
        TO_CHAR(SYSDATE, 'DD'), -- 월 기준 몇일째
        TO_CHAR(SYSDATE, 'D')  -- 주 기준 몇일째(일요일:1)
FROM DUAL;

--요일에 대한 포맷
SELECT TO_CHAR(SYSDATE, 'DAY'),
       TO_CHAR(SYSDATE, 'DY') -- 요일을 빼고 나온다.
FROM DUAL;

-- EX) '1990년 02월 06일 (수)' 형식으로 조회
SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YYYY"년"MM"월"DD"일" (DY)')
FROM EMPLOYEE;

--------------------------------------------------------------------------------

/*
    *TO_DATE : 숫자타입 또는 문자타입 데이터를 날짜타입으로 변환시켜주는 함수
    
    TO_DATE(숫자|문자), [포맷])   => 결과값은 DATE타입
*/

SELECT TO_DATE(20101215) FROM DUAL;
SELECT TO_DATE(101215) FROM DUAL;
SELECT TO_DATE(071215) FROM DUAL; --에러(맨앞에 0은 없는것으로 판단됨)

SELECT TO_DATE('071215') FROM DUAL; --문자열로 변환하면 가능

SELECT TO_DATE('041030 143030', 'YYMMDD HH24MISS') FROM DUAL;

SELECT TO_DATE('140630', 'YYMMDD'),
       TO_DATE('980630', 'YYMMDD')
FROM DUAL; -- YY: 무조건 현재세기로 반영

SELECT TO_DATE('140630', 'RRMMDD'),
       TO_DATE('980630', 'RRMMDD')
FROM DUAL; -- RR : 해당 두자리 년도값이 50미만일경우 현재세기 반영, 50이상일경우 이전세기로 반영

--------------------------------------------------------------------------------

/*
    *TO_NUMBER : 문자타입의 데이터를 숫자타입으로 변환시켜주는 함수
    
    TO_NUMBER(문자, [포맷]  => 결과값은 NUMBER 타입

*/
SELECT '1000000' + '550000' FROM DUAL; --> 오라클에서는 자동형변환 잘되어있음

SELECT '1,000,000' + '550,000' FROM DUAL; --> 에러

SELECT TO_NUMBER('1,000,000', '9,999,999') + TO_NUMBER('550,000', '999,999') FROM DUAL;

--------------------------------------------------------------------------------

/*
    <NULL 처리 함수>
*/
-- *NVL(컬럼, 반환값)
-- 해당 컬럼값이 존재할 경우 기존의 값 반환
-- 해당 컬럼값이 존재하지 않을 경우(NULL일 경우) 반환값 반환
SELECT EMP_NAME, BONUS, NVL(BONUS, 0)
FROM EMPLOYEE;

SELECT EMP_NAME, (SALARY+SALARY * NVL(BONUS, 0)) * 12
FROM EMPLOYEE;

SELECT EMP_NAME, DEPT_CODE, NVL(DEPT_CODE, '부서없음')
FROM EMPLOYEE;

-- * NVL2(컬럼, 반환값1, 반환값2)
-- 해당 컬럼값이 존재할경우 반환값1 반환
-- 해당 컬럼값이 NULL일경우 반환값2 반환
SELECT EMP_NAME, NVL2(DEPT_CODE, 'O', 'X') "부서유무"
FROM EMPLOYEE;

-- *NULLIF(비교대상1, 비교대상2)
-- 두 개의 값이 일치하면 NULL반환
-- 두 개의 값이 일치하지 않으면 비교대상 1 값을 반환
SELECT NULLIF('123', '123') FROM DUAL;
SELECT NULLIF('123', '456') FROM DUAL;

--------------------------------------------------------------------------------

/*
    <선택 함수>
    *DECODE(비교대상(컬럼|산술연산|함수), 비교값1, 결과값1, 비교값2, 결과값2, ... ,[결과값N])

*/
-- 사번, 사원명, 주민번호, 성별
SELECT EMP_NAME, EMP_ID, EMP_NO, DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여') "성별"
FROM EMPLOYEE;

-- 사원명, 직급코드, 기존급여, 인상된 급여
-- J7인 사원은 급여를 10%인상 (SALARY * 1.1)
-- J6인 사원은 급여를 15%인상 (SALARY * 1.15)
-- J7인 사원은 급여를 20%인상 (SALARY * 1.2)
-- 그 외의 사원은 급여를 5%인상(SALARY * 1.05)
SELECT EMP_NAME, JOB_CODE, SALARY, 
DECODE(JOB_CODE, 'J7', SALARY* 1.1, 
                 'J6', SALARY*1.15,
                 'J5', SALARY * 1.2,
                       SALARY * 1.05) "인상된 급여"
FROM EMPLOYEE;

/*
    *CASE WHEN THEN
    
    CASE WHEN 조건식1 THEN 결과값1
         WHEN 조건식2 THEN 결과값2
         ...
         ELSE 결과값N
        END
*/
SELECT EMP_NAME,SALARY, 
       CASE WHEN SALARY>=5000000 THEN '고급'
            WHEN SALARY>=3500000 THEN '중급'
            ELSE '초급'
        END "등급"
FROM EMPLOYEE;

--------------------------------<그룹함수>---------------------------------------

--1. SUM(NUMBER컬럼) : 해당 컬럼값들의 총 합계를 구해서 반환해주는 함수

--전 사원의 총 급여합
SELECT SUM(SALARY) 
FROM EMPLOYEE; --전체 사원들이 한 그룹으로 묶임

-- 부서가 D9인 사원들의 총 급여합
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9'; --부서가 D9인 사원들이 한 그룹으로 묶임

--2. AVG(NUMBER컬럼) : 해당 컬럼들의 평균값을 구해서 반환
--전 사원의 평균급여 조회
SELECT SUM(SALARY) "총 급여", ROUND(AVG(SALARY)) "평균급여"
FROM EMPLOYEE;

SELECT EMP_NAME, AVG(SALARY) -- 단일행 함수랑 그룹함수랑 SELECT절에 같이 기술 불가
FROM EMPLOYEE;

--3. MIN(ANY타입컬럼) : 해당 컬럼값들 중에 가장 작은 값 구해서 반환
SELECT MIN(EMP_NAME),MIN(SALARY), MIN(HIRE_DATE)
FROM EMPLOYEE;

--4. MAX(ANY타입컬럼) : 해당 컬럼값들 중에 가장 큰 값 구해서 반환
SELECT MAX(EMP_NAME),MAX(SALARY), MAX(HIRE_DATE)
FROM EMPLOYEE;

--5. COUNT(*|컬럼|DISTINCT 컬럼) : 행 갯수를 세서 반환
--   COUNT(*) : 조회된 결과에 모든 행 갯수를 세서 반환
--   COUNT(컬럼) : 제시된 해당 컬럼값이 NULL이 아닌 것만 행 갯수 세서 반환
--   COUNT(DISTINCT 컬럼) : 해당 컬럼값 중복을 제거한 후 행 갯수 세서 반환

--전체 사원의 수
SELECT COUNT(*)
FROM EMPLOYEE;

--  D9 부서원들의 수
SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--남자 사원들의 수
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN('1','3');

-- 보너스를 받는 사원 수
SELECT COUNT(BONUS)
FROM EMPLOYEE;

SELECT COUNT(*)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- 부서배치를 받은 사원 수
SELECT COUNT(DEPT_CODE)
FROM EMPLOYEE;

-- 현재 사원들이 총 몇개의 부서에 분포되어있는지
SELECT COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;

-- D9부서의 부서원수, 총 급여합, 평균급여, 최소급여, 최대급여
SELECT COUNT(*) "부서원수", SUM(SALARY) "총급여합",CEIL(AVG(SALARY)) "평균급여", MIN(SALARY) "최소급여", MAX(SALARY) "최대급여"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';
