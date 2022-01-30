//
//  3045.swift
//  swift-algorithm-study
//
//  Created by 김동준 on 2022/01/28.
//

import Foundation

func run(){
    let line = readLine()!
    let arrLine = line.components(separatedBy: " ")
    var n = Int(arrLine[0])!
    var k = Int(arrLine[1])!
    var list = LinkedList()
    var nodeList: [Node] = []
    for i in 0 ..< n{
        var node = Node()
        node.value = i + 1
        list.add(node: node)
    }
    print("<", terminator: "")
    list.printYose(k: k)
    
}

class Node{
    var next: Node? = nil
    var prev: Node? = nil
    var value: Int = 0
}

class LinkedList{
    var head: Node? = nil
    var tail: Node? = nil
    var count: Int = 0
    
    func add(node: Node){
        if head == nil{
            head = node
            count += 1
        }else{
            var currentNode = head
            for i in 0 ..< count - 1{
                currentNode = currentNode?.next
            }
            node.prev = currentNode
            currentNode!.next = node
            node.next = head
            tail = node
            tail?.next = head
            count += 1
        }
    }
    
    func delete(value: Int){
        var currentNode = head
            if currentNode?.value == value{
                currentNode?.next != nil ? (head = currentNode?.next) : (head = nil)
            }
        
        for i in 0 ..< count - 1{
            var next = currentNode?.next
            if next?.value == value{
                //print("delete \(currentNode!.prev?.value) \(currentNode!.value), \(currentNode?.next?.value)")
                next?.next != nil ? (currentNode?.next = next?.next) : (currentNode?.next = nil)
                break
            }
            //print("delete \(currentNode!.prev?.value) \(currentNode!.value), \(currentNode?.next?.value)")
            currentNode = currentNode?.next!
        }
    }
    
//    func printNode(){
//        guard var node = head else { return }
//        for i in 0 ..< 7 {
//            print(node.value, terminator: "")
//            node = node.next!
//        }
//        print()
//    }
    
    func printYose(k: Int){
        var current = head
        for i in 0 ..< count - 1 {
            //printNode()
            for j in 0 ..< k{
                if j == (k - 1) {
                    print("\(current!.value), ", terminator: "")
                    delete(value: current!.value)
                    current = current?.next

                }else{
                    current = current?.next
                }
            }
        }
        print("\(current!.value)>", terminator: "")
    }
    
}
