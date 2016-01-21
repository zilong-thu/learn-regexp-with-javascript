# 匹配单个字符

## 匹配纯文本

只是为了匹配一段纯文本，那么目的往往是确定其是否存在。似乎应该优先使用 `RegExp.prototype.test()` 方法，或者 `String.prototype.search()` 方法。前者返回一个表示是否匹配成功的布尔值；对于后者，如果匹配成功，则返回其在字符串中的位置下标（从0开始），否则返回 -1。

```
var str = 'some text for test, for test.';
var pattern = /for/;
console.log(str.search(pattern));  // 10
console.log(pattern.test(str));  // true
```

绝大多数正则表达式引擎的默认行为是只返回第一个匹配结果。尤其对于**搜索**型匹配，找到了一个，就没有必要再去找下一个了。如果是要进行文本替换，就不一样了。得使用标志（flags）来说明当前的匹配执行方式（全局，忽视大小写等等）。

添加`g`（global）标识符后，连续两次执行`pattern.exec(str)`：

```
var str = 'some text for test, for test.';
var pattern = /for/g;
console.log(pattern.exec(str));  // ["for", index: 10, input: "some text for test, for test."]
console.log(pattern.exec(str));  // ["for", index: 20, input: "some text for test, for test."]
```

## 匹配任意字符

`.`可以匹配任意的字符、字母、数字以及`.`本身。