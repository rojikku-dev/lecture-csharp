#set text(font: ("NanumGothic", "Malgun Gothic"))
#show raw: set text(font: ("Consolas", "SF Mono", "NanumGothic", "Malgun Gothic"))

#import "@preview/diatypst:0.9.1": *
#show: slides.with(
  title: "1주차 문법",
  subtitle: "C# 프로그래밍",
  date: datetime.today().display("[year]. [month]. [day]."),
  // authors: "© 2026. 지꾸. All rights reserved.",  
)

= 자료형
== 정수형
- 정수를 나타낼 때 사용하는 자료형
- 범위에 따라 여러 자료형으로 나뉘며 이에 따라 사용되는 메모리의 크기도 달라짐
#table(
  columns: (1fr, 2fr, 2fr),
  [타입], [범위], [크기],
  [`sbyte`], [$-128 ~ 127$], [부호 있는 8비트 정수],
  [`byte`], [$0 ~ 255$], [부호 없는 8비트 정수],
  [`short`], [$-32768 ~ 32767$], [부호 있는 16비트 정수],
  [`ushort`], [$0 ~ 65535$], [부호 없는 16비트 정수],
  [`int`], [$-2^31 ~ 2^31 - 1$], [부호 있는 32비트 정수],
  [`uint`], [$0 ~ 2^32 - 1$], [부호 없는 32비트 정수],
  [`long`], [$-2^63 ~ 2^63 - 1$], [부호 있는 64비트 정수],
  [`ulong`], [$0 ~ 2^64 - 1$], [부호 없는 64비트 정수],
)

== 실수형
- 실수를 나타낼 때 사용하는 자료형
- 표현 가능한 소수점(정밀성)과 범위에 따라 여러 자료형으로 나뉘며 이에 따라 사용되는 메모리의 크기도 달라짐
#table(
  columns: (1fr, 2fr, 2fr),
  [타입], [정밀성], [크기],
  [`float`], [$~6~9$ 자리 수], [4 Bytes],
  [`double`], [$~15~17$ 자리 수], [8 Bytes],
  [`decimal`], [$28~29$ 자리 수], [16 Bytes],
)

== 부울대수

- 참과 거짓을 나타낼 때 사용하는 자료형
- 참을 나타내는 `true`와 거짓을 나타내는 `false`로 구성됨

/ 사용 예:
  ```cs
  bool a = true;
  bool b = false;
  
  bool c1 = a && b;  // 논리 곱
  bool c2 = a || b;  // 논리 합
  bool c3 = !a;      // 논리 부정
  bool c4 = a ^ b;   // 배타적 논리합
  ```

== 배열

- 고정된 갯수의 동일한 타입의 여러 값들이 저장되어 있는 형태를 나타낼 때 사용하는 자료형

/ 사용 예:
  ```cs
  string[] name = new string[3];  // 크기가 3인 빈 문자열 배열
  name[0] = "Alice";
  name[1] = "Bob";
  name[2] = "Carol";
  
  int[] ages = [12, 9, 15];      // 미리 초기화 된 배열
  Console.WriteLine($"{name[0]}의 나이: {ages[0]}");
  ```

== 문자열

- 텍스트를 나타낼 때 사용하는 자료형
- 본래는 0과 65535 사이의 정수형 값들로 이뤄진 배열의 형태를 가짐
- 텍스트를 쌍따옴표로 감싸 표기함

/ 사용 예:
  ```cs
  string msg = "Hello, world!";
  string lines = "This is written\nwith C#";
  ```

== 리스트

- 여러 값들이 순서대로 저장되어 있는 형태를 나타낼 때 사용하는 자료형
- 내부의 값들은 모두 같은 타입을 가져야 함
  - 이후 일반화(Generic) 라는 개념에서 더 자세히 설명

/ 사용 예:
  ```cs
  List<int> li1 = new List<int>();  // 빈 리스트
  li1.Add(3);  // li1 에 3을 가장 뒤에 추가
  li1.Add(4);  // li1 에 4를 가장 뒤에 추가
  li1.ForEach(Console.WriteLine);  // 각 원소를 한 줄 씩 출력
  
  List<int> li2 = [2, 4, 8];
  ```

== 딕셔너리

- 키, 값 쌍들의 모임을 나타낼 때 사용하는 자료형
  - 이러한 자료형들을 Map 이라 부름
- 키와 값은 각각 모두 같은 타입을 가져야 함

/ 사용 예:
  ```cs
  Dictionary<string, int> ages
    = new Dictionary<string, int> {
      { "Alice", 12 },
      { "Bob", 9 }
    };  // 빈 딕셔너리의 경우 { ... } 를 생략하고 대신 ()를 기재
  
  ages["Carol"] = 15;  // 15라는 값을 Carol이라는 키로 저장
  Console.WriteLine(ages["Alice"]);  // Out: 12
  ```


= 변수와 범위

== 변수의 선언 및 재할당
/ 문법:
  ```
  <타입> <변수명> = <값>;
  ```

/ 사용 예:
  ```cs
  string name = "Alice";   // name 변수 선언
  int age = 12;            // age 변수 선언
  
  age = age + 1;           // age에 age + 1의 값을 할당
  Console.WriteLine(age);  // Out: 13 
  ```

== 타입 추론
/ 문법:
  ```
  var <변수명> = <타입 추론 가능한 값>;
  <타입> <변수명> = new();
  ```

/ 사용 예:
  ```cs
  var name = "Alice";         // string으로 추론
  List<uint> scores = new();  // List<uint>으로 추론
  ```

== 범위
- 변수는 유효한 범위를 갖으며 그 범위에 따라 전역변수와 지역변수로 나뉜다.
- 변수가 선언된 이후이자 변수가 속한 중괄호 범위 내의 끝까지가 선언된 변수의 범위가 된다.
- 변수가 가장 최상위의 중괄호에서 선언되었다면 이를 전역변수라 부른다.

```cs
int x = 3;               // x는 전역변수
{
  int y = 5;             // y는 지역변수
  Console.WriteLine(x);  // Out: 3
  Console.WriteLine(y);  // Out: 5
  // y의 범위가 끝나는 시점
}
Console.WriteLine(x);    // Out: 3
Console.WriteLine(y);    // Error!
```


= 조건문
== if-else 문
/ 문법:
  ```
  if (조건식) <코드 A> else <코드 B> // 조건식이 true이면 A 실행
  ```

/ 사용 예:
  ```cs
  var age = 12;
  if (age < 18) {  // 코드의 범위를 나타내기 위한 중괄호
    Console.WriteLine("18세 미만 입니다.");
  } else {
    Console.WriteLine("18세 이상 입니다.");
  }
  ```

= 반복문
== while 문
/ 문법:
  ```
  while (조건식) <코드> // 조건식이 true이면 코드를 실행 (반복)
  ```

/ 사용 예:
  ```cs
  int x = 5;
  while (x > 0) {
    Console.WriteLine(x);  // Out: 5 4 3 2 1
    x = x - 1;
  }
  ```

== for 문
/ 문법:
  ```
  for(<변수 선언>; <조건식>; <변수 증감식>) <코드>
  // 변수 선언 -> 조건식 -> 코드 -> 변수 증감식 -> 조건식 순서
  ```

/ 사용 예:
  ```cs
  for (int i = 0; i < 5; i = i + 1) {
    Console.WriteLine(i);
  }
  ```
== foreach 문
/ 문법:
  ```
  foreach (<타입 혹은 var> in <순회 가능한 값>) <코드>
  ```

/ 사용 예:
  ```cs
  foreach (var item in li1) {
    Console.WriteLine(item);  // Out: 3 4
  } 
  ```
