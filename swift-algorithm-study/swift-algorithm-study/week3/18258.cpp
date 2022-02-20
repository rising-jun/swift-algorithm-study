//
//  18258.cpp
//  swift-algorithm-study
//
//  Created by 김동준 on 2022/02/20.
//

#include <iostream>
#include <cstdio>
#include <string>
#include <stdlib.h>
using namespace std;

template <typename T>
struct Node{
public:
    T value;
    struct Node<T> *next = nullptr;
};

template <typename T>
class LinkedList{
    public:
    LinkedList() : head(nullptr), tail(nullptr) {}
    ~LinkedList() {}

    Node<int> *head = nullptr;
    Node<int> *tail = nullptr;
    int size = 0;

    void addNode(int value){
        Node<int> *node = new Node<int>;
        node->next = nullptr;
        node->value = value;

        if(head == nullptr){
            head = node;
            tail = node;
        }else{
            tail->next = node;
            tail = tail->next;
        }
        size ++;
    }

    int pop(){
        if(size > 0){
            int num = head->value;
            head = head->next;
            size --;
            if(size == 0){
                head = nullptr;
                tail = nullptr;
            }
            return num;
        }
        return -1;
    }

    int isEmpty(){
        return size == 0 ? 1 : 0;
    }

    int getSize(){
        return size;
    }

    int front(){
        if(size <= 0){
            return -1;
        }
        return head->value;
    }

    int back(){
        if(size <= 0){
            return -1;
        }
        return tail->value;
    }


};


int main(){
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int n = 0;
    cin >> n;
    LinkedList<string> queue;

    for(int i = 0; i < n; i++){
        string s = "";
        cin >> s;
        if(s == "push"){
            int value = 0;
            cin >> value;
            queue.addNode(value);
        }else if(s == "pop"){
            cout << queue.pop() << "\n";
        }else if(s == "size"){
            cout << queue.getSize() << "\n";
        }else if(s == "empty"){
            cout << queue.isEmpty() << "\n";
        }else if(s == "front"){
            cout << queue.front() << "\n";
        }else if(s == "back"){
            cout << queue.back() << "\n";
        }
    }
    return 0;
}

