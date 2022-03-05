//
//  1260.swift
//  swift-algorithm-study
//
//  Created by 김동준 on 2022/03/05.
//

import Foundation

class Problem1260{
    var check: [Bool]!
    var road: [[Bool]]!
    var n = 0
    var r = 0
    var s = 0
    
    var queue = LinkedQueue()
    func run(){
        let line = readLine()!
        let arrLine = line.components(separatedBy: " ")
        n = Int(arrLine[0])!
        r = Int(arrLine[1])!
        s = Int(arrLine[2])!
        road = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)
        self.check = [Bool](repeating: false, count: n + 1)
        for i in 1 ... r{
            let line2 = readLine()!
            let arrLine2 = line2.components(separatedBy: " ")
            let v1 = Int(arrLine2[0])!
            let v2 = Int(arrLine2[1])!
            road[v1][v2] = true
            road[v2][v1] = true
        }
        dfs(v: s)
        initCheck()
        print()
        var node = Node<Int>()
        node.val = s
        queue.add(node: node)
        bfs(v: s)
    }
    
    func initCheck(){
        check = check.map{ _ in return false}
    }
    
    func dfs(v: Int){
        
        print("\(v)", terminator: " ")
        self.check[v] = true
        for i in 1 ... n{
            if check[i] == false && road[v][i] == true{
                dfs(v: i)
            }
        }
    }
    
    func bfs(v: Int){
        check[v] = true
        while(queue.isEmpty() != "1"){
            var a = queue.delete()

            print("\(a)", terminator: " ")
            for i in 1 ... n{
                if check[i] == false && road[a][i] == true{
                    var node = Node<Int>()
                    node.val = i
                    queue.add(node: node)
                    check[i] = true
                }
            }
        }
    }
    
    class Node<T>{
        var next: Node?
        var val: T? = nil
    }
    
    class LinkedQueue{
        var head: Node<Int>?
        var tail: Node<Int>?
        var count: Int = 0{
            didSet{
                if count == 0{
                    head = nil
                    tail = nil
                }
            }
        }
        
        func add(node: Node<Int>){
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
        
        func delete() -> Int{
            if count > 0{
                let val = head?.val
                head = head?.next
                count -= 1
                
                return val ?? -1
            }
            
            return -1
        }
        
        func size() -> Int{
            return self.count
        }
        
        func isEmpty() -> String{
            return count == 0 ? "1" : "0"
        }
        
        func front() -> Int{
            return head?.val ?? -1
        }
        
        func back() -> Int{
            return tail?.val ?? -1
        }
    }
    
}
