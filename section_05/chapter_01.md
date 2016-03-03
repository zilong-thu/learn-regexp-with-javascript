## ^
`^` 字符有两种含义，对应不同的语境。

### ① 表示字符集合的**非**：

示例：将url的查询参数解析成字典对象

参考文章：[2016十家公司前端面试小记](http://www.cnblogs.com/xxcanghai/p/5205998.html?utm_source=tuicool&utm_medium=referral)

```
function getQueryObject(url) {
    url = url == null ? window.location.href : url;
    var search = url.substring(url.lastIndexOf("?") + 1);
    var obj = {};
    var reg = /([^?&=]+)=([^?&=]*)/g;
    search.replace(reg, function (rs, $1, $2) {
        var name = decodeURIComponent($1);
        var val = decodeURIComponent($2);                
        val = String(val);
        obj[name] = val;
        return rs;
    });
    return obj;
}
```

来看一下这个正则表达式的演化：

+ `[^?&=]` 表示要匹配的字符不是 `?` 也不是 `&` 也不是等于号 `=`，除了这仨，其他字符都可以。`^` 字符在 `[]`里面表示 “非” 的意思。
+ `[^?&=]+` 后面紧跟着一个加号 `+`，表示前面的字符至少出现一个，也可以是多个。
+ `([^?&=]+)` 用圆括号包起来，表示要记住这个字符串了，后面可能会引用匹配到的实际字符串。
+ `([^?&=]+)=` 紧跟着要有一个等于号。
+ `([^?&=]+)=([^?&=]*)` URL查询字符串，等号后面的值是可以为空的，因此用 `*` 来进行匹配，表示 除了`?&=`之外的字符可以重复出现零次或多次。

### ② 表示一段字符串以什么开头
