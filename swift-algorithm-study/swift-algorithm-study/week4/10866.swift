//
//  10866.swift
//  swift-algorithm-study
//
//  Created by 김동준 on 2022/02/26.
//

import Foundation

struct Problem10866{
    func run(){
        let rl = readLine()!
        var num = Int(rl)!
        var deque = Deque<String>()
        for i in 0 ..< num{
            let line = readLine()!
            let arrLine = line.components(separatedBy: " ")
            
            switch arrLine[0]{
            case "push_back":
                var node = Node<String>()
                node.val = arrLine[1]
                deque.pushBack(node: node)
            case "push_front":
                var node = Node<String>()
                node.val = arrLine[1]
                deque.pushFront(node: node)
            case "pop_back":
                print(deque.popBack())
            case "pop_front":
                print(deque.popFront())
            case "size":
                print(deque.size())
            case "empty":
                print(deque.empty())
            case "front":
                print(deque.front())
            case "back":
                print(deque.back())
            default: break
            }
            //deque.printLinked()
        }
    }
    
    class Node<T>{
        var next: Node?
        var prev: Node?
        var val: T? = nil
    }
    
    struct Deque<T>{
        var head: Node<T>?
        var tail: Node<T>?
        var count: Int = 0{
            didSet{
                if count == 0{
                    head = nil
                    tail = nil
                }
            }
        }
        
        mutating func pushFront(node: Node<T>){
            guard var currentNode = self.head else {
                head = node
                tail = node
                count += 1
                return
            }
            head = node
            head?.next = currentNode
            currentNode.prev = head
            count += 1
        }
        
        mutating func pushBack(node: Node<T>){
            guard var currentNode = self.tail else {
                head = node
                tail = node
                count += 1
                return
            }
            node.prev = tail
            tail?.next = node
            tail = tail?.next
            count += 1
        }
        
        mutating func popFront() -> T{
            guard var value = self.head?.val else {
                return "-1" as! T
            }
            head = head?.next
            head?.prev = nil
            count -= 1
            return value
        }
        
        mutating func popBack() -> T{
            guard var value = self.tail?.val else {
                return "-1" as! T
            }
            tail = tail?.prev
            tail?.next = nil
            count -= 1
            return value
        }
        
        func size() -> Int{
            return count
        }
        
        func empty() -> Int{
            return count == 0 ? 1 : 0
        }
        
        func front() -> T{
            guard let value = head?.val else{
                return "-1" as! T
            }
            return value
        }
        
        func back() -> T{
            guard let value = tail?.val else{
                return "-1" as! T
            }
            return value
        }
        
        func printLinked(){
            guard var currentNode = self.head else {
                return
            }
            
            print("\(currentNode.val!), ", terminator: "")
            while currentNode.next != nil{
                guard let next = currentNode.next else {
                    return
                }
                currentNode = next
                print("\(currentNode.val!), ", terminator: "")
            }
            print()
            //print("\(currentNode.val), ", terminator: "")
        }
        
    }
    
    
}
