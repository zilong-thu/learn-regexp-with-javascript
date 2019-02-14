# 非捕获括号

圆括号 `()` 的作用有两个：分组和指定捕获。不过，很多时候只是想让其发挥分组的作用，不必进行捕获，那么可以使用所谓的“被动子表达式”（passive subexpression），即 `?:` 符号。

> (?:x)
> 匹配'x'但是不记住匹配项。这种被叫做非捕获括号。匹配到的子字符串不能通过结果数组的[1],...,[n]进行访问。

在 jQuery 源码中有这样一个经典正则表达式：

```javascript
// A simple way to check for HTML strings
// Prioritize #id over <tag> to avoid XSS via location.hash (#9521)
// Strict HTML recognition (#11290: must start with <)
// Shortcut simple #id case for speed

var rquickExpr = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]+))$/;
```

上面的注释里，单词 Prioritize 意为“优先考虑”。即，优先判断是否为 #id，然后再去判断是否为 HTML 标签，以避免基于 location.hash 的 XSS 攻击。

只会匹配两种格式：`#` 开头的 ID 选择器，以及 `<` 开头、`>` 结尾的 HTML 标签。

下面是几个测试用例：

```javascript
var str = ['#container', 'div #id', '<div>haha</div>', 'aaa<div>aa</div>', '<a>'];

str.forEach(item => {
  console.log(rquickExpr.test(item));
});

// true, false, true, false, true
```
