# 匹配一组字符

## 字符集合

`[` 和 `]` 用来定义一个字符集合，可以匹配含有该集合任一元素的文本。

** 示例 1 **

用 JavaScript 写一个函数，返回当前月份的天数。

```javascript
function isLeapYear(year){
  return year%400 === 0 || (year%4 ===0 && year%100 !== 0);
}

function getDaysOfMonth(month){
  var date  = new Date();
  var month = month || date.getMonth() + 1;
  var year  = date.getFullYear();

  var totalDays = '31';

  if( /[469]|(11)/.test(month) ){
    totalDays = '30';
  } else if (month === 2) {
    totalDays = isLeapYear(year) ? '29' : '28';
  }

  return totalDays;
}
console.log(getDaysOfMonth(2));  // 2016年的话，输出 29
```

一年里有7个月份是31天，4个月份是30天。用正则表达式`/[469]|(11)/`去匹配4月、6月、9月或者11月。`|`为或者的意思。`()`包裹起来的是一个子表达式，因为`11`必须作为一个整体被匹配。

** 示例 2 **

前端从后端获取的字符串中含有圆括号，要将其显示在页面中。需要在遇到第一个圆括号后就进行换行，不然字符串可能因为太长而显示不全。不过，圆括号可能是英文半角，也可能是中文全角，所以考虑使用字符集合。

```javascript
var str = '新华书店(中关村图书大厦店)';
 var pattern = /([\(\（])/;
var result = str.replace(pattern, '\n$1');
console.log(result);
```

这段代码同时使用了字符集合、回溯引用。

## 字符集合区间

可以使用`[0-9]`匹配0至9之间的任意一个数字。这是`[0123456789]`的简写。效果与`\d`其实是一样的。
