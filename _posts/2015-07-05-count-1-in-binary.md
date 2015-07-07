---
layout: post
title: "二进制中有多少个1--LintCode"
date: 2015-07-06 21:51:21
category: "LintCode"
tags: 位运算
author: tangmi
---
计算在一个 32 位的整数的二进制表式中有多少个 1.

<!--break-->

#### 示例
    给定 32 (100000)，返回 1
    给定 5 (101)，返回 2
    给定 1023 (111111111)，返回 9

#### 算法思路

    //TODO
    时间复杂度：O(1) 

#### 代码实现

    class Solution
    {
    public:
        /*
        * @param n: An integer
        * @return: True or false
        */
        bool checkPowerOf2(int n)
        {
            if(n > 0 && (n & n-1) == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    };

