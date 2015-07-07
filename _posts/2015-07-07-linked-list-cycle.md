---
layout: post
title: "带环链表--LintCode"
date: 2015-07-07 21:18:09
category: "LintCode"
tags: 链表
author: tangmi
---
给定一个链表，判断它是否有环。
<!--break-->

#### 示例
    给出 -21->10->4->5, tail connects to node index 1，返回 true

#### 算法思路

    定义两个指针变量p和q，都指向head；
    在循环中，p走两步，q走一步，如果存在环，则总会让这两个指针相遇，则结束循环；
    如果p或p->next最终指向NULL，说明没有环（没有相遇）
    时间复杂度：
    如果不存在环：则为O(n/2)
    如果存在环：则为O(n)

#### 代码实现
    
    /**
     * Definition of ListNode
     * class ListNode {
     * public:
     *     int val;
     *     ListNode *next;
     *     ListNode(int val) {
     *         this->val = val;
     *         this->next = NULL;
     *     }
     * }
     */
    class Solution
    {
    public:
        /**
         * @param head: The first node of linked list.
         * @return: True if it has a cycle, or false
         */
        bool hasCycle(ListNode *head)
        {
            ListNode *p = head;
            ListNode *q = head;
            while(p != NULL && p->next != NULL)
            {
                p = p->next->next;
                q = q->next;
                if(p == q)
                {
                    break;
                }
            }

            if(p == NULL || p-> next == NULL)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    };

