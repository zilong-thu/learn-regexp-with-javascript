# 学习正则表达式-基于JavaScript

## 正则表达式的历史

高级程序语言的正则表达式几乎都从 Perl 语言发展而来。

## 为何要用正则?
正则表达式是为了专门解决文本的两个问题而产生的：

+ 查找特定的文本（搜索）
+ 查找并编辑特定的文本（替换）

### DSL

先说 DSL（[Domain Specified Language](https://en.wikipedia.org/wiki/Domain-specific_language)），领域专用语言。不同于那些完备的、通用计算机编程语言（GPL，即General Purpose Language），领域专用语言通常只是为了解决某个专门的问题而存在的。常见的DSL：

+ HTML
+ CSS（只解决样式问题）
+ 正则表达式（解决文本的模式匹配问题）
+ SQL（是的，wiki pedia把它列为DSL之一）

### 关于图灵完备性

## 正则表达式的应用场景

### 编译器

编译原理课程会告诉你，大部分编译型编程语言设计的程序在执行之前要经历三个步骤：

+ 分词/词法分析
+ 语法分析，生成抽象语法树（AST）
+ 翻译为字节码/机器码

在第一步词法分析中，正则表达式的作用就太大了。

### web 表单校验

web前端工程师非常熟悉的场景。

### CSS 选择器

[Sizzle.js](https://sizzlejs.com/) 使用了大量的正则表达式以匹配各式各样的 CSS 选择器。
