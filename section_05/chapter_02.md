## 量词

```
var reg = /\d+\.?\d[1, 2]/g;
var str = [2, 2., 2.00001, 2.2, 2.22, 2.222, .22];
str.forEach(item => { console.log(item, ' is:', reg.test(str)); });
```
