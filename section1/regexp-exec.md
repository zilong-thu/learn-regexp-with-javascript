# RegExp.prototype.exec()

## 语法

```javascript
/**
 * str: [String] 要匹配正则表达式的字符串
 * regexObj: [RegExp Object] 正则表达式对象
 */
regexObj.exec(str)
```

### 返回值

匹配成功，`exec()` 方法返回一个类数组对象，并更新正则表达式对象的属性。返回的类数组数组将完全匹配成功的文本作为第一项，将正则括号里匹配成功的（即捕获到的）作为数组填充到后面；该对象同时还具有一些属性，包括原始字符串的值等。

匹配失败，exec 方法将返回 `null`。

### 简单示例

```javascript
var res = /^1\d{10}$/.exec('12007011620');
```

上面的代码得到的 `res` 将是这样一个对象：

```javascript
{
  0: '12007011620',
  index: 0,
  input: '12007011620',
  groups: undefined,
  length: 1, // 此属性位于原型链上
}
```

## 例子：一个20行不到的 JavaScript 模板引擎

参考：[JavaScript template engine in just 20 lines](http://krasimirtsonev.com/blog/article/Javascript-template-engine-in-just-20-line)。这篇文章里给出的最终示例代码如下：

```javascript
var TemplateEngine = function(html, options) {
  var re = /<%([^%>]+)?%>/g;
  var reExp = /(^( )?(if|for|else|switch|case|break|{|}))(.*)?/g;
  var code = 'var r=[];\n';
  var cursor = 0;
  var match;

  var add = function(line, js) {
    js? (code += line.match(reExp) ? line + '\n' : 'r.push(' + line + ');\n') :
      (code += line != '' ? 'r.push("' + line.replace(/"/g, '\\"') + '");\n' : '');
    return add;
  }
  while(match = re.exec(html)) {
    add(html.slice(cursor, match.index))(match[1], true);
    cursor = match.index + match[0].length;
  }
  add(html.substr(cursor, html.length - cursor));
  code += 'return r.join("");';
  return new Function(code.replace(/[\r\t\n]/g, '')).apply(options);
}

// 测试代码
var template = 
  'My skills:' + 
  '<%if(this.showSkills) {%>' +
      '<%for(var index in this.skills) {%>' + 
      '<a href="#"><%this.skills[index]%></a>' +
      '<%}%>' +
  '<%} else {%>' +
  '<p>none</p>' +
  '<%}%>';

  console.log(TemplateEngine(template, {
    skills: ["js", "html", "css"],
    showSkills: true
  }));
```
