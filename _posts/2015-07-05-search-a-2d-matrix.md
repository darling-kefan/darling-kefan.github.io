---
layout: post
title: "搜索二维矩阵--LintCode"
date: 2015-07-05 00:01:18
category: "LintCode"
tags: 二分查找 矩阵
author: tangmi
---
写出一个高效的算法来搜索 m × n矩阵中的值。
这个矩阵具有以下特性：
每行中的整数从左到右是排序的,每行的第一个数大于上一行的最后一个整数。

<!--break-->

#### 示例
    考虑如下矩阵:
    [
      [1, 3, 5, 7],
      [10, 11, 16, 20],
      [23, 30, 34, 50]
    ]
    给出 target = 3，返回 true

#### 算法思路

    1. 首先对所有行末元素通过二分查找找到小于等于target的行下标；
    2. 再对该行所有元素通过二分查找，如果找到等于target的元素则返回true，否则返回false。
    时间复杂度：O(log(n) + log(m)) 

#### 代码实现
    class Solution
    {
    public:
        /**
        * @param matrix, a list of lists of integers
        * @param target, an integer
        * @return a boolean, indicate whether matrix contains target
        */
        bool searchMatrix(vector<vector<int> > &matrix, int target)
        {
            int mid = -1;
            int low = 0;
            int high = matrix.size() - 1;

            if(matrix.empty())
                return false;

            while(low <= high)
            {
                mid = (low + high) / 2;
                if(target <= matrix[mid][matrix[mid].size() - 1])
                {
                    high = mid - 1;
                }
                else if(target > matrix[mid][matrix[mid].size() - 1])
                {
                    low = mid + 1;
                }
            }

            low = 0;
            high = matrix[mid].size() - 1;
            vector<int> tmpVec = matrix[mid];
            while(low <= high)
            {
                mid = (low + high) / 2;
                if(target == tmpVec[mid])
                {
                    return true;
                }
                else if(target < tmpVec[mid])
                {
                    high = mid - 1;
                }
                else if(target > tmpVec[mid])
                {
                    low = mid + 1;
                }
            }
            return false;
        }
    };

