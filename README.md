# spring-security-demo #


----------

## version 7.0 Remember Me(下次自动登录) ##


![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v7.0/v70001.png)

登陆时如果勾选了【remember me】，则即使关闭了浏览器，再打开相关链接时，也不需要输入登陆信息：

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v7.0/v70002.png)


这样处理后，勾选Remember me登录会在PERSISTENT_LOGINS表中，生成一条记录：


![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v7.0/v70003.png)


logout时，该记录以及客户端的cookie都会同时清空。

参考文章：

[Spring Security笔记：Remember Me(下次自动登录)](http://www.cnblogs.com/yjmyzz/p/remember-me-sample-in-spring-security3.html)

[Spring Security Remember Me Example](http://www.mkyong.com/spring-security/spring-security-remember-me-example/)

----------
## version 6.0 登录尝试次数限制 ##
运行效果

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v6.0/v60001.png)

连续3次输错密码后，将看到下面的提示

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v6.0/v60002.png)

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v6.0/v60005.png)

这时如果查下数据库，会看到

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v6.0/v60003.png)

错误尝试次数，在db中已经达到阀值3

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v6.0/v60004.png)

而且该用户的“是否未锁定”字段值为0，如果要手动解锁，把该值恢复为1，并将T_USER_ATTEMPTS中的尝试次数，改到3以下即可。

参考文章：

[Spring Security笔记：登录尝试次数限制](http://www.cnblogs.com/yjmyzz/p/limit-login-attempts-in-spring-security3.html)

 [Spring Security : limit login attempts example](http://www.mkyong.com/spring-security/spring-security-limit-login-attempts-example/#)

----------


## version 5.0 使用BCrypt算法加密存储登录密码 ##


bcrypt算法与md5/sha算法有一个很大的区别，每次生成的hash值都是不同的，这样暴力猜解起来或许要更困难一些。同时大家可能也发现了，加密后的字符长度比较长，有60位，所以用户表中密码字段的长度，如果打算采用bcrypt加密存储，字段长度不得低于60。

最后要做的事情，就是把db中原来明文的密码值，改成经过bcrypt加密后的字符串即可。

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v5.0/v50001.png)

tips:如果你仍然喜欢用传统的sha算法来处理密码，只要把23行改成 <password-encoder hash="sha" />  就可以了。

参考文章：

[Spring Security笔记：使用BCrypt算法加密存储登录密码](http://www.cnblogs.com/yjmyzz/p/use-bcrypt-algorithm-hashing-password-in-spring-security3.html)

[Spring Security password hashing example](http://www.mkyong.com/spring-security/spring-security-password-hashing-example/)


----------


## version 4.0 使用数据库进行用户认证 ##

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v4.0/v40001.png)

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v4.0/v40002.png)

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v4.0/v40003.png)

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v4.0/v40004.png)

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v4.0/v40005.png)


参考文章： 

[Spring Security笔记：使用数据库进行用户认证(form login using database)](http://www.cnblogs.com/yjmyzz/p/form-login-using-database-with-spring-security3.html)

[Spring Security Form Login Using Database](http://www.mkyong.com/spring-security/spring-security-form-login-using-database/)

----------

## version 3.0 HTTP Basic 认证##
再次访问/admin，会弹出下面的对话框：

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v3.0/v30001.png)


有点象访问局域网共享时，windows弹出的输入用户名/密码对话框，输入spring-security.xml里定义的用户名/密码后，就可以访问了，so easy!

要注意的是：每次关闭浏览器后，登录即自动过期，生命周期有点类似Session




参考文章： 

[Spring Security笔记：HTTP Basic 认证](http://www.cnblogs.com/yjmyzz/p/3851235.html)



----------

## version 2.0 自定义登录页##
运行效果：

登录页正常显示的截图
![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v2.0/v20001.png)



登录失败的截图

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v2.0/v20002.png)


有兴趣的还可以看下对应的html源代码

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v2.0/v20003.png)


防跨站提交攻击的_csrf隐藏域，会生成一个随机的类似guid字符串来做校验，以确定本次http post确实是从本页面发起的，这跟asp.net里mac ViewState的思路一致。


参考文章： 

[Spring Security笔记：自定义登录页](http://www.cnblogs.com/yjmyzz/p/how-to-custom-login-form-page-with-spring-security3.html)

----------


## version 1.0 Hello World##
运行效果：

访问/welcome时，毫无阻力

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v1.0/v10001.png)

访问/admin时，会重定向到Spring Security自动生成的login页面 spring_security_login

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v1.0/v10002.png)

在登录页面输入yjmyzz/123456后，自动跳转到登录前的页面 /admin

![](https://raw.githubusercontent.com/CoderDream/spring-security-demo/master/doc/snapshot/v1.0/v10003.png)


参考文章： 

[Spring Security笔记：Hello World](http://www.cnblogs.com/yjmyzz/p/spring-security-with-spring-mvc-helloworld.html)