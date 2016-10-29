# RegExp.prototype.exec()

## 语法

```
regexObj.exec(str)
```

### 返回值

匹配成功，TODO *

匹配失败，exec 方法将返回 `null`。


## 例子：一个20行不到的 JavaScript 模板引擎

参考：[JavaScript template engine in just 20 lines](http://krasimirtsonev.com/blog/article/Javascript-template-engine-in-just-20-line)。这篇文章里给出的最终示例代码如下：

```
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
