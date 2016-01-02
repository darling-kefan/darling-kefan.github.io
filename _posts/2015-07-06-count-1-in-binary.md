---
layout: post
title: "二进制中有多少个1--LintCode"
date: 2015-07-06 19:41:01
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

    1：将num和1进行按位与操作（计算最低位是不是1），将结果累加，并将num右移一位；
    2：循环运行步骤1，直到num不大于0后，则结束，将累加结果返回；
    时间复杂度O(log n)，有更快的实现方法欢迎讨论 ^_^

#### 代码实现

    class Solution
    {
    public:
        /**
        * @param num: an integer
        * @return: an integer, the number of ones in num
        */
        int countOnes(int num)
        {
            int idx = 0;
            while(num > 0)
            {
                idx += num & 1;
                num = num >> 1;
            }
            return idx;
        }
    };

