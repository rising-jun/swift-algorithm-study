//
//  10828.swift
//  swift-algorithm-study
//
//  Created by 김동준 on 2022/02/12.
//

import Foundation

class Problem10828{
    func run(){
        let rl = readLine()!
        var num = Int(rl)!
        var st = MyStack()
        for i in 0 ..< num{
            let line = readLine()!
            let arrLine = line.components(separatedBy: " ")
            
            switch arrLine[0]{
            case "push":
                st.push(arrLine[1])
                break
            case "top":
                print(st.top())
                break
            case "size":
                print(st.size())
                break
            case "empty":
                print(st.empty())
                break
            case "pop":
                print(st.pop())
                break
            default: break
            }
            
        }
        
    }
}

struct MyStack{
    public private(set) var arr: [String] = []
    
    public mutating func push(_ val: String){
        self.arr.append(val)    }
    
    public func top() -> String{
        if arr.count == 0{
            return "-1"
        }
        return arr[arr.count - 1]
    }
    
    public func size() -> Int{
        return arr.count
    }
    
    public func empty() -> Int{
        return arr.count == 0 ? 1 : 0
    }
    
    public mutating func pop() -> String{
        if arr.count == 0{
            return "-1"
        }
        return self.arr.removeLast()
    }
    
    
    
}

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
        return self.arr.removeLast()
    }
}
