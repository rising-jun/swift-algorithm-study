# 10828 스택

## 구현 방법
1. <String> 스택을 구현
2. 요구사항에 맞게 상황 설정
3. 실행 및 테스트

```swift

struct MyStack2{
    public private(set) var arr: [String] = []
    public private(set) var idx: Int = -1
    public mutating func push(_ val: String){
        self.arr.append(val)
        idx += 1
    }
    
    public func top() -> String{
        if idx == 0{
            return "-1"
        }
        return arr[idx - 1]
    }
    
    public func size() -> Int{
        return idx + 1
    }
    
    public func empty() -> Int{
        return size()  == 0 ? 1 : 0
    }
    
    public mutating func pop() -> String{
        if size() == 0{
            return "-1"
        }
        idx -= 1
        return self.arr.removeLast()
    }
}

```

- 배열내부의 count함수가 없는 언어에서 작동할 경우를 생각해보아 idx를 구현해보았습니다.
