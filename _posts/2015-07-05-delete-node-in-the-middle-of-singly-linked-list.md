---
layout: post
title: "在O(1)时间复杂度删除链表节点--LintCode"
date: 2015-07-05 13:44:19
category: "LintCode"
tags: 链表
author: tangmi
---
给定一个单链表中的表头和一个等待被删除的节点(非表头或表尾)。请在在O(1)时间复杂度删除该链表节点。
<!--break-->

#### 示例
    给定 1->2->3->4，和节点 3，返回 1->2->4。

#### 算法思路

    一般做法是从表头开始遍历，时间复杂度是O(n)，但本题形参并没有给出表头指针且同时要求O(1)复杂度；
    所以想到的做法是把”待删除节点的下一个节点值“ 复制到”待删除节点“，并指向“待删除节点的下一个节点的下一个节点“；
    ”进而释放”下一个节点“ 来达到O(1)的删除操作；
    另外，注意题目中的”非表头或表尾“，如果是表尾节点，那么就不能这么做，因为释放了尾节点的话，上一个节点的next就变成悬浮指针了；

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
        * @param node: a node in the list should be deleted
        * @return: nothing
        */
        void deleteNode(ListNode *node)
        {
            if(node != NULL)
            {
                ListNode *tmp = node->next; // 待删除的下一个节点
                node->val = tmp->val; // 待删除节点值等于"下一个节点值"
                node->next = tmp->next; // 待删除节点指向"下一个节点的下一个节点"
                free(tmp); // 释放 "待删除节点的下一个节点"
            }
        }
    };

