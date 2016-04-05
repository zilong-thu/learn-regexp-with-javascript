# 关于本书

## 作者
**[zilong-thu](https://github.com/zilong-thu)**

## 制作
本书使用 [GitBook](https://www.gitbook.com/) 提供的 npm 工具 [gitbook-cli@1.0.1](https://www.npmjs.com/package/gitbook-cli) 制作，然后发布在 Github Pages 服务上。

```
# 首先，全局安装 gitbook-cli 工具
npm install -g gitbook-cli
```

gitbook-cli 自带的命令比较少，如果是使用 github 提供的 githook 发布制作到 GitBook 网站上，倒也无妨。不过这里提供一个自动化的解决方案。

开发环境：

Macbook Pro OXS Yosemite 10.10.5

## 发布到 GitHub Pages

参考 [GitBook 简明教程: 发布到 GitHub Pages](http://www.chengweiyang.cn/gitbook/github-pages/README.html)：

第一次执行了 `gitbook build` 之后，创建 `gh-pages` 分支：

```
# 创建 gh-pages 分支
$ git checkout --orphan gh-pages
$ git rm --cached -r .
$ git clean -df
$ rm -rf *~

# 手动添加 .gitignore 文件
$ echo "*~" > .gitignore
$ echo "_book" >> .gitignore
$ git add .gitignore
$ git commit -m "Ignore some files"
$ git push origin gh-pages
```

## 自动化发布

这是我添加的自动化发布方法。方法一：

在 master 分支下，添加 package.json 文件。添加以下关键代码：

```
"scripts": {
    "git-push-master": "git checkout master && git add --all && git commit -m 'source files update' && git push origin master",
    "build": "gitbook build && cp package.json ./_book",
    "git-push-gh-pages": "git checkout gh-pages && cp -r _book/* . && git add --all && git commit -m 'new build' && git push origin gh-pages && git checkout master",
    "deploy": "npm run git-push-master && npm run build && npm run git-push-gh-pages"
  }
```

以后每次写完内容后，只要执行 `npm run deploy` 即可把源码发布到 `master` 分支，把书籍发布到 `gh-pages` 分支。每个命令都会等待上一个命令正常结束之后才会执行（即同步阻塞执行）。

上面的 `scripts` 其实是 shell 脚本，写到`package.json`里的一个缺点是不能换行。那么可以在项目的根目录下添加一个 `deploy.sh`文件，内容为：

```
#!/bin/bash

git checkout master
git add --all
git commit -m 'source files update'
git push origin master

gitbook build
cp package.json ./_book

git checkout gh-pages
cp -r _book/* .
git add --all
git commit -m 'new build'
git push origin gh-pages

git checkout master
```

第一句话 `#!/bin/bash` 指定了这段命令由 bash 来解释执行。

注：`./deploy.sh` 命令需要一定的执行权限。

```
chmod 774 deploy.sh
```

