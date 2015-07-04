---
layout: post
title: "二叉树的最大深度--LintCode"
date: 2015-07-04 22:15:19
category: "LintCode"
tags: 枚举
author: tangmi
---
给定一个二叉树，找出其最大深度。
二叉树的深度为根节点到最远叶子节点的距离。
<!--break-->

#### 示例
    给出一棵如下的二叉树:
      1
     / \ 
    2   3
       / \
      4   5

#### 算法描述
    如果根结点为NULL，直接返回为0;
    如果根结点不为NULL且左孩子深度大于等于右孩子的深度，那么当前根结点的深度就是左孩子的深度+1；
    如果根结点不为NULL且左孩子深度小于右孩子的深度，那么当前根结点的深度就是右孩子的深度+1；
    对每个左孩子、右孩子也是采用同样的算法，递归调用直到某一节点为NULL时返回0；

#### 代码实现

    /**
    * Definition of TreeNode:
    * class TreeNode {
    * public:
    *     int val;
    *     TreeNode *left, *right;
    *     TreeNode(int val) {
    *         this->val = val;
    *         this->left = this->right = NULL;
    *     }
    * }
    */
    class Solution {
    public:
        /**
        * @param root: The root of binary tree.
        * @return: An integer
        */
        int maxDepth(TreeNode *root) {
            if(root == NULL)
                return 0;
            int leftDepth = maxDepth(root->left);
            int rightDepth = maxDepth(root->right);
            return leftDepth >= rightDepth ? leftDepth + 1 : rightDepth + 1;
        }
    };

