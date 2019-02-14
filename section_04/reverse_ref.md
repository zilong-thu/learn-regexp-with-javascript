# 捕获反向引用

正则表达式中最复杂的术语是正则中定义的**捕获（captures）**的反向引用。

有两种方法可引用到捕获到的匹配结果：一个是自身匹配，一个是替换字符串。不过，特点都是一样的：反向引用的内容需要在运行时才能确定。

常见的应用是使用捕获反向引用来匹配XML或者HTML这样的文本标记语言。下面是一个自身匹配的例子：

```javascript
var reg = /<(\w+)>(.*)<\/\1>/;
var htmlStr = '<strong></strong>';
console.log(reg.test(htmlStr));  // => true
```

另外一个常见的场景是，String.prototype.replace() 方法的第二个参数中，可以使用诸如`$1`来引用正则表达式里捕获到的匹配字符串。

```javascript
var str = 'fontFamily';
console.log(str.replace(/([A-Z])/g, '-$1').toLowerCase());  // => 'font-family'
```
