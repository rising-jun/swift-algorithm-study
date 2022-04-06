//
//  TargetNumber.swift
//  swift-algorithm-study
//
//  Created by 김동준 on 2022/04/06.
//

import Foundation

class TargetNumber{
    func solution(_ numbers:[Int], _ target:Int) -> Int {
        var answer = 0
        
        func dfs(num: Int, depth: Int){
            if depth == numbers.count - 1{
                if target == num{
                    answer += 1
                }
                return
            }
            dfs(num: num + numbers[depth + 1], depth: depth + 1)
            dfs(num: num - numbers[depth + 1], depth: depth + 1)
        }
        dfs(num: 0, depth: -1)
        return answer
        
    }
    
}
