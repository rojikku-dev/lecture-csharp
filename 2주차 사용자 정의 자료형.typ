#set text(font: ("NanumGothic", "Malgun Gothic"))
#show raw: set text(font: ("Consolas", "SF Mono", "NanumGothic", "Malgun Gothic"))

#import "@preview/diatypst:0.9.1": *
#show: slides.with(
  title: "2주차 사용자 정의 자료형",
  subtitle: "C# 프로그래밍",
  date: datetime.today().display("[year]. [month]. [day]."),
  // authors: "© 2026. 지꾸. All rights reserved.",  
)

= 사용자 정의 자료형
== 열거형 자료형
- 열거형은 정수 타입을 갖는 상수들의 모임으로 상태를 표현할 때 정의할 수 있는 자료형의 한 종류이다.

/ 예시:
  ```cs
  enum Sex {
    Female,
    Male,
    Other = -1
  }
  ```

== 클래스
- 클래스는 사용자 정의 자료형의 형태로 클래스를 작성함으로써 직접 나타내고자 하는 바를 표현하기 위한 자료형을 정의할 수 있다.
- 클래스는 크게 데이터 자체를 표현하기 위한 필드와 행위를 표현하기 위한 메소드로 구성된다.
- 클래스로부터 생성된 값을 인스턴스라 부른다.

/ 예시:
  ```cs
  class Vector2 {
    public double X, Y;     // 필드
  
    public double Size() {  // 메소드
      return Math.Sqrt(X * X + Y * Y);
    }
  }
  ```
