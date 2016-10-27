正则表达式中最复杂的术语是正则中定义的**捕获（captures）**的反向引用。

反向引用的内容需要在运行时才能确定。常见的应用是使用捕获反向引用来匹配XML或者HTML这样的文本标记语言。

```
var reg = /<(\w+)>(.*)<\/\1>/;
var htmlStr = '<strong></strong>';
console.log(reg.test(htmlStr));
```
