import UIKit

//삼항 연산자, Ternary Operator

//1. if문 사용
let isMember: Bool = false

if isMember == true {
    print("회원입니다.")
} else {
    print("회원이 아닙니다.")
}

print("-------------------")
//2. 삼항 연산자 사용
print(isMember == true ? "회원입니다." : "회원이 아닙니다.")

//조건 ? true일때 : false일떄

print("-------------------")
//3. 삼항 연산자를 사용해서 변수 대입

let fee = (isMember == true) ? 1000 : 2000

print("가격:", fee)
