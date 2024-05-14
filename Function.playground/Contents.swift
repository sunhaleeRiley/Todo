import UIKit

//함수(Function), 메서드(Method)

func sayHello() {
    print("안녕하세요")
    print("반갑습니다")
}

sayHello()

struct Cat {
    let name: String //property
    let age: Int //property
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func cry() { //method
        print("야옹야옹")
    }
}

let 야옹이 = Cat(name: "야옹이", age: 4)
야옹이.cry()


//파라미터, 리턴값
print("-------매개변수(Parameter), 반환(Return)---------")

func add(number1: Int, number2: Int) -> Int {
//    print(number1 + number2)
    return number1 + number2
}

let 합 = add(number1: 10, number2: 20)
print(합)

print(add(number1: 2, number2: 3))

// (10 + 20) + 5
print(add(number1: add(number1: 10, number2: 20), number2: 5))
