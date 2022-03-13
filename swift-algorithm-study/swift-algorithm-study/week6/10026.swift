//
//  10026.swift
//  swift-algorithm-study
//
//  Created by 김동준 on 2022/03/13.
//

import Foundation

class Problem10026{
    var check: [[Bool]] = []
    var map: [[String]] = []
    var q = LinkedQueue()
    var count = 0
    var n = 0
    
    var dy = [0,0,1,-1]
    var dx = [1,-1,0,0]
    func run(){
        let line = readLine()!
        self.n = Int(line)!
        
        for i in 0 ..< n{
            let line2 = readLine()!
            var chars: [String] = []
            var checks: [Bool] = []
            for c in line2{
                chars.append(c.description)
                checks.append(false)
            }
            map.append(chars)
            check.append(checks)
        }
        
        for i in 0 ..< n{
            for j in 0 ..< n{
                if(map[i][j] == "R" && check[i][j] == false){
                    var node = Node<Point>()
                    node.val = Point(i, j)
                    q.add(node: node)
                    bfs(Point(i,j));
                    count += 1
                }
                if(map[i][j] == "G" && check[i][j] == false){
                    var node = Node<Point>()
                    node.val = Point(i, j)
                    q.add(node: node)
                    bfs(Point(i,j));
                    count += 1
                }
                if(map[i][j] == "B" && check[i][j] == false){
                    var node = Node<Point>()
                    node.val = Point(i, j)
                    q.add(node: node)
                    bfs(Point(i,j));
                    count += 1
                }
            }
        }
        print(count, terminator: " ")
        count = 0
        
        for i in 0 ..< n{
            check[i] = check[i].map{ _ in return false}
            map[i] = map[i].map{
                if($0.self == "G"){
                    return "R"
                }
                return $0
            }
        }
        for i in 0 ..< n{
            for j in 0 ..< n{
                if(map[i][j] == "R" && check[i][j] == false){
                    var node = Node<Point>()
                    node.val = Point(i, j)
                    q.add(node: node)
                    bfs(Point(i,j));
                    count += 1
                }

                if(map[i][j] == "B" && check[i][j] == false){
                    var node = Node<Point>()
                    node.val = Point(i, j)
                    q.add(node: node)
                    bfs(Point(i,j));
                    count += 1
                }
            }
        }
       print(count)
    }
    
    func bfs(_ point: Point){
        check[point.x][point.y] = true
        while(q.isEmpty() != "1"){
            var point = q.delete()!
            var x = point.x
            var y = point.y
            
            for i in 0 ..< 4{
                var px = x + dx[i]
                var py = y + dy[i]
                if(px >= 0 && py >= 0 && px < n && py < n){
                    if(check[px][py] == false && map[px][py] == map[x][y]){
                        check[px][py] = true
                        var node = Node<Point>()
                        node.val = Point(px, py)
                        q.add(node: node)
                    }
                }
            }
        }
    }
    
    
    class Node<T>{
        var next: Node?
        var val: T? = nil
    }
    
    class LinkedQueue{
        var head: Node<Point>?
        var tail: Node<Point>?
        var count: Int = 0{
            didSet{
                if count == 0{
                    head = nil
                    tail = nil
                }
            }
        }
        
        func add(node: Node<Point>){
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
        
        func delete() -> Point?{
            if count > 0{
                let val = head?.val
                head = head?.next
                count -= 1
                
                return val
            }
            
            return nil
        }
        
        func size() -> Int{
            return self.count
        }
        
        func isEmpty() -> String{
            return count == 0 ? "1" : "0"
        }
        
        func front() -> Point?{
            return head?.val
        }
        
        func back() -> Point?{
            return tail?.val
        }
    }
    struct Point{
        let x: Int
        let y: Int
        init(_ x: Int, _ y: Int){
            self.x = x
            self.y = y
        }
    }
}
