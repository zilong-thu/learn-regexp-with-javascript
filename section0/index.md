# 正则表达式概述

## 正则表达式的历史

“正则表达式”这个术语起源于20世纪中期的数学。1956年，一个名叫 Stephen Kleene 的数学家使用了名为“正则集合”的数学符号描述自动计算模式。

高级程序语言的正则表达式几乎都从 Perl 语言发展而来。

## 为何要用正则?

正则表达式是为了专门解决文本的两个问题而产生的：

+ 查找特定的文本（搜索）
+ 查找并编辑特定的文本（替换）

## DSL

先说 DSL（[Domain Specified Language](https://en.wikipedia.org/wiki/Domain-specific_language)），领域专用语言。不同于那些完备的、通用计算机编程语言（GPL，即General Purpose Language），领域专用语言通常只是为了解决某个专门的问题而存在的。常见的DSL：

+ HTML
+ CSS（只解决样式问题）
+ 正则表达式（解决文本的模式匹配问题）
+ SQL（是的，wiki pedia把它列为DSL之一）

## 关于图灵完备性
