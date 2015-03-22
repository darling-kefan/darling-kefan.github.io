---
layout: post
title: "ssh自动登录"
date: 2013-06-25 10:29:51
category: "技术"
tags: ssh 
author: bingwen
---


今天给我的MacBook Pro重装了一遍系统，运行速度健步如飞，然后需要重新配置一些东西，结果有些命令忘掉了，做个记录
<!--break-->

SSH免密码登陆
----------------

首先在自己的home目录下运行

`ssh-keygen -t rsa`

然后在.ssh目录下可以找到生成好的私钥id_rsa和公钥id_rsa.pub
再通过远程拷贝到服务器上

`scp ~/.ssh/id_rsa.pub user@host:~/.ssh/id_rsa.pub`

再把内容添加到authorized_keys中

`cat id_rsa.pub >> authorized_keys`

这样的话，在服务器上便有了你的公钥，下次ssh到该服务器的时候，ssh程序会自动先帮你check你的私钥和对方的公钥是否匹配，如果两边相互匹配，则可以直接登陆到服务器上，不再需要输入密码

SSH免账号登陆
--------------
上面使用密钥的方式只能免除输入密码的麻烦，但我们每次仍然需要输入

`ssh username@host.com`

这样的命令才能登陆，有的时候服务器的域名或者ip可能比较长或者难记，也是十分不方便的，为了解决这个问题，我们可以配置一下.ssh目录下的config文件（如果没有可以自己创建）,如下

	Host myhost
	HostName www.host.com
	user username`

这样的话，以后需要登陆服务器，只需要输入

`ssh myhost`

便可以直接登陆了，非常的方便
