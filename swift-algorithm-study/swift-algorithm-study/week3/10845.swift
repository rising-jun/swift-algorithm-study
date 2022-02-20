//
//  10845.swift
//  swift-algorithm-study
//
//  Created by 김동준 on 2022/02/20.
//

import Foundation

struct Problem10845{
    func run(){
        let rl = readLine()!
        var num = Int(rl)!
        var queue = LinkedQueue()
        for i in 0 ..< num{
            let line = readLine()!
            let arrLine = line.components(separatedBy: " ")
            
            switch arrLine[0]{
            case "push":
                var node = Node<String>()
                node.val = arrLine[1]
                queue.add(node: node)
                break
            case "front":
                print(queue.front())
                break
            case "size":
                print(queue.size())
                break
            case "empty":
                print(queue.isEmpty())
                break
            case "pop":
                print(queue.delete())
                break
            case "back":
                print(queue.back())
                break
            default: break
                
            }
            //queue.printQueue()
        }
    }
    
    class Node<T>{
        var next: Node?
        var val: T? = nil
        
        //        init(next: Node, val: T){
        //            self.next = next
        //            self.val = val
        //        }
    }
    
    class LinkedQueue{
        var head: Node<String>?
        var tail: Node<String>?
        var count: Int = 0{
            didSet{
                if count == 0{
                    head = nil
                    tail = nil
                }
            }
        }
        
        func add(node: Node<String>){
            guard var currentNode = self.head else {
                head = node
                tail = node
                count += 1
                return
            }
            tail?.next = node
            tail = tail?.next
            count += 1
        }
        
        func delete() -> String{
            if count > 0{
                let val = head?.val
                head = head?.next
                count -= 1
                
                return val ?? "-1"
            }
            
            return "-1"
        }
        
        func size() -> Int{
            return self.count
        }
        
        func isEmpty() -> String{
            return count == 0 ? "1" : "0"
        }
        
        func front() -> String{
            return head?.val ?? "-1"
        }
        
        func back() -> String{
            return tail?.val ?? "-1"
        }
        
        func printQueue(){
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
            //print("\(currentNode.val), ", terminator: "")
        }
        
    }
    
    
    
}

