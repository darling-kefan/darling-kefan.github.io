---
layout: default
title: "Gerrit使用实例"
category: "Git"
tags: "Gerrit,git"
author: shouqiang tang

---

将使用过程记录下来作为参考，已备后用。

### 配置ssh

* 生成ssh-key

        shouqiang@shouqiang-VirtualBox:~/.ssh$ ssh-keygen -t rsa -C 'shouqiang-10.210.208.52'
        shouqiang@shouqiang-VirtualBox:~/.ssh$ ll  

* id_rsa.pub添加至gerrit

    复制id_rsa.pub文件内容，添加至gerrit -> setting(右上角个人中心处) -> SSH Public Keys处。

    <img src="/public/images/gerrit-add-sshkey.png" width="600" />

* 验证gerrit ssh连接

        shouqiang@shouqiang-VirtualBox:~/.ssh$ ssh -p 29418 shouqiang@10.216.27.44

          ****    Welcome to Gerrit Code Review    ****  

          Hi ***, you have successfully connected over SSH.  

          Unfortunately, interactive shells are disabled.  

          To clone a hosted Git repository, use:  

          git clone ssh://shouqiang@10.216.27.44:29418/REPOSITORY_NAME.git
  
        Connection to 10.216.27.44 closed.

-------------

### clone代码，同时下载commit-msg文件至本地

    $ git clone ssh://shouqiang@10.216.27.44:29418/video/project_name && scp -p -P 29418 shouqiang@10.216.27.44:hooks/commit-msg project_name/.git/hooks/
	$ git checkout feature-LIS # 切换至功能开发分支

上面的命令可以从gerrit上获取，如图：

<img src="/public/images/gerrit-clone.png" width="600" />

> 注意: 请尽量使用ssh方式clone代码，本人使用http方式clone代码后，切换分支git checkout feature-LIS切换失败（本地代码与远程代码库代码不一致，至今原因不明）。

-------------

### 创建change

* 创建change

        $ git add .
        $ git commit -m '注释'
        $ git push origin HEAD:refs/for/feature-LIS # feature-LIS表示分支名
        HEAD:refs/for/feature-LIS  
        Counting objects: 9, done.  
        Delta compression using up to 2 threads.  
        Compressing objects: 100% (9/9), done.  
        Writing objects: 100% (9/9), 893 bytes | 0 bytes/s, done.  
        Total 9 (delta 5), reused 0 (delta 0)  
        remote: Resolving deltas: 100% (5/5)  
        remote: Processing changes: new: 1, refs: 1, done      
        remote:   
        remote: New Changes:  
        remote:   http://10.216.27.44:8080/199 remove the comment code.  
        remote:   
        To ssh://shouqiang@10.216.27.44:29418/video/vms  
        * [new branch]      HEAD -> refs/for/feature-LIS  

* Review Change

    打开上面的http://10.216.27.44:8080/199，gerrit change如下图：

    <img src="/public/images/gerrit-create-change.png" width="800" />

    找团队成员帮你审核代码，审核完成后，接下来是Reply这个Change。

* Reply Change

    点击页面上的Reply...按钮，如下：

    <img src="/public/images/gerrit-reply-change.png" width="600" />

    > Code-Review取值2，同时Verified取值1的情况下，gerrit自动提交change push到git中心仓库；否则将不会自动提交。

---------------------------------

### 替换change

    $ # 修改代码 
    $ ..........
    $ git commit --amend # 保存退出

    remove the comment code.

    Change-Id: I38712de76a44f7797d5bbc72575522b537b2af4a

    # Please enter the commit message for your changes. Lines starting
    # with '#' will be ignored, and an empty message aborts the commit.
    #
    # Date:      Tue Mar 29 12:06:08 2016 +0800
    #
    # On branch feature-LIS
    # Your branch is ahead of 'origin/feature-LIS' by 1 commit.
    #   (use "git push" to publish your local commits)
    #
    # Changes to be committed:
    #   modified:   projects_php/platy/lisadmin/account/classes/Controller/Application.php
    #   modified:   projects_php/platy/lisadmin/account/classes/Controller/Default.php
    #
    # Changes not staged for commit:
    #   deleted:    projects_php/platy/rolly/classes/Model/Record.php

    $ git push origin HEAD:refs/for/feature-LIS

查看gerrit页面,增加了一个Patch Set，如下图：

<img src="/public/images/gerrit-add-patchset.png" width="800" />

接下来的流程和“创建Change”一样了，在这里不再熬述。

-----------------------------------------

### 问题解决

* 问题一、
        
        shouqiang@shouqiang-VirtualBox:~/www/sina/vms-gerrit$ git push origin HEAD:refs/for/feature-LIS  
        Counting objects: 160, done.
        Delta compression using up to 2 threads.
        Compressing objects: 100% (139/139), done.
        Writing objects: 100% (160/160), 41.93 KiB | 0 bytes/s, done.
        Total 160 (delta 54), reused 0 (delta 0)
        remote: Resolving deltas: 100% (54/54)
        remote: Processing changes: refs: 1, done    
        remote: ERROR: missing Change-Id in commit message footer
        remote: 
        remote: Hint: To automatically insert Change-Id, install the hook:
        remote:   gitdir=$(git rev-parse --git-dir); scp -p -P 29418 shouqiang@10.216.27.44:hooks/commit-msg ${gitdir}/hooks/
        remote: And then amend the commit:
        remote:   git commit --amend
        remote: 
        To ssh://shouqiang@10.216.27.44:29418/video/vms
         ! [remote rejected] HEAD -> refs/for/feature-LIS (missing Change-Id in commit message footer)
        error: failed to push some refs to 'ssh://shouqiang@10.216.27.44:29418/video/vms'

    解决方法：

        $ gitdir=$(git rev-parse --git-dir); scp -p -P 29418 shouqiang@10.216.27.44:hooks/commit-msg ${gitdir}/hooks/
        $ git commit --amend
		$ git push origin HEAD:refs/for/feature-LIS

------------------------

### 参考文档

[Gerrit Code Review - Uploading Changes](http://gerrit-documentation.googlecode.com/svn/Documentation/2.5/user-upload.html)  
[Gerrit Code Review - A Quick Introduction](http://gerrit-documentation.googlecode.com/svn/Documentation/2.5/intro-quick.html)
