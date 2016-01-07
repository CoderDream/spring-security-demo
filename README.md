# spring-security-demo


version 2.0
运行效果：

登录页正常显示的截图
![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v2.0/v20001.png)



登录失败的截图

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v2.0/v20002.png)


有兴趣的还可以看下对应的html源代码

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v2.0/v20003.png)


防跨站提交攻击的_csrf隐藏域，会生成一个随机的类似guid字符串来做校验，以确定本次http post确实是从本页面发起的，这跟asp.net里mac ViewState的思路一致。



version 1.0
运行效果：

访问/welcome时，毫无阻力

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v1.0/v10001.png)

访问/admin时，会重定向到Spring Security自动生成的login页面 spring_security_login

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v1.0/v10002.png)

在登录页面输入yjmyzz/123456后，自动跳转到登录前的页面 /admin

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v1.0/v10003.png)
