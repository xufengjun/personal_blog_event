<%--
  Created by IntelliJ IDEA.
  User: 2065423432
  Date: 2019/12/20
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="model.User" %>
<%@ page import="model.Message"%>
<html>
<head>
<title>HOME</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<style type="text/css">
    #hre{
        position: absolute;
        top: 10px;
        margin-left: 10px;

    }
</style>
</head>
<body>
<!-- Banner -->
<section id="banner">
    <div class="inner split">
        <div id="hre">
            <a href="user_login.jsp">登陆</a>
            <a href="user_register.jsp">注册</a>
        </div>
        <br>
        <section>
            <h2>欢迎来到我的博客，这是一个学习交流的平台。请登陆查看o。</h2>
        </section>
        <section>
            <p>聪明的人，有生活智慧的人，会有所为，有所不为。他们只计较对自己最重要的东西，
                并且知道什么年龄该计较什么，不该计较什么，有取有舍，收放自如。</p>
            <ul class="actions">
                <li><a href="#" class="button special">开始吧</a></li>

            </ul>
        </section>
    </div>
</section>

<!-- One -->
<section id="one" class="wrapper">
    <div class="inner split">
        <section>
            <h2>个人简介</h2>
            <p>来自潍坊，现居烟台，就读于鲁东大学。涉及方向有：网络爬虫、机器学习、Web 开发等。爱生活、爱艺术、爱书画、爱音乐、爱设计、爱编程。人生百态，笑口常开，秉承自我，谨慎独行。心静如水，静静的寻找生活的美好。</p>
            <ul class="actions">
                <li><a href="#" class="button alt">了解更多</a></li>
            </ul>
        </section>
        <section>
            <ul class="checklist">
                <marquee align="right" behavior="scroll" direction="up" loop="-1" onMouseOut="this.start()" onMouseOver="this.stop()" scrollamount="5" scrolldelay="60">
                    <li><a href="https://www.toutiao.com/a6772320674120729095/">庆祝澳门回归祖国20周年文艺晚会在澳门举行 习近平出席观看</a></li><br>
                    <li><a href="https://www.toutiao.com/a6772066939926741518/">被众院弹劾后特朗普回了这么一句话，中方今天也表态了</a></li><br>
                    <li><a href="https://www.toutiao.com/a6772339146519216647/">画面太美！山东舰海上转圈圈 网友：最厉害海上漂移</a></li><br>
                    <li><a href="https://www.toutiao.com/a6772245935213773319/">2019百度沸点北京榜单公布：新中国成立70周年无悬念上榜</a></li><br>
                    <li><a href="https://www.toutiao.com/a6772054832351019531/">爸爸穿"工作服"开家长会，照片传上网引争议，网友：想过孩子吗</a></li><br>
                    <li><a href="https://slamdunk.sports.sina.com.cn/rank#type=conference">2019-2020赛季常规赛排名</a></li><br>
                    <li><a href="https://www.toutiao.com/a6772054832351019531/">爸爸穿"工作服"开家长会，照片传上网引争议，网友：想过孩子吗</a></li><br>
                </marquee>
            </ul>
        </section>
    </div>
</section>

<!-- Two -->
<section id="two" class="wrapper style2 alt">
    <div class="inner">
        <div class="spotlight">
            <div class="image">
                <img src="images/pic01.jpg" alt="" />
            </div>
            <div class="content">
                <h3>城市生活日记</h3>
                <p>烟台的海,是一幅画,是一道广阔的背景,是一壮丽的舞台.世世代代的烟台人在这里上演着威武雄壮的活剧. </p>
                <ul class="actions">
                    <li><a href="#" class="button alt">Details</a></li>
                </ul>
            </div>
        </div>
        <div class="spotlight">
            <div class="image">
                <img src="images/pic02.jpg" alt="" />
            </div>
            <div class="content">
                <h3>生活点滴记录</h3>
                <p>走出夏日的浪漫,烟台的海步入秋的高远.久居这座城市的人都有这样的体验,一到立秋这天,海水立刻变得格外湛蓝,天空也显得格外明朗,较之昨日,空气中立刻就有了秋的凉意.告别了冬日的凝重、春日的轻盈、夏日的浪漫,秋天的海平添了几分充实与忙碌,渔家驾船出海了,货轮起锚远航了……</p>
                <ul class="actions">
                    <li><a href="#" class="button alt">Details</a></li>
                </ul>
            </div>
        </div>
        <div class="spotlight">
            <div class="image">
                <img src="images/pic03.jpg" alt="" />
            </div>
            <div class="content">
                <h3>鲁大学习随笔</h3>
                <p>大学是一个充满才华、学问，同时又是一个充满竞争、挑战的小舞台、小社会。我们每一个人就在这个舞台上扮演着不同的角色，那我们何不努力将自己的角色扮演得最好!</p>
                <ul class="actions">
                    <li><a href="#" class="button alt">Details</a></li>
                </ul>
            </div>
        </div>
        <ul class="actions special">
            <li><a href="#" class="button alt">加载更多</a></li>
        </ul>
    </div>
</section>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
<!-- Contact -->
<section id="contact" class="wrapper">
    <div class="inner split">
        <section>
            <h2>给我留言</h2>
            <p>留下自己的邮箱哦。</p>
            <form action="#" class="alt" method="POST">
                <div class="row uniform">
                    <div class="6u 12u$(xsmall)">
                        <input name="name" placeholder="Name" type="text">
                    </div>
                    <div class="6u$ 12u$(xsmall)">
                        <input name="email" placeholder="Email" type="email">
                    </div>
                    <div class="12u$">
                        <textarea name="message" placeholder="Message" rows="4"></textarea>
                    </div>
                </div>
                <ul class="actions">
                    <li><input class="alt" value="Send message" type="submit"></li>
                </ul>
            </form>
        </section>

        <section>
            <ul class="contact">
                <li class="fa-twitter"><a href="#">twitter.com/untitled-tld</a></li>
                <li class="fa-facebook"><a href="#">facebook.com/untitled-tld</a></li>
                <li class="fa-instagram"><a href="#">instagram.com/untitled-tld</a></li>
                <li class="fa-envelope"><a href="#">information@untitled.tld</a></li>
                <li class="fa-home">1234 Somewhere Road Suite 9823<br/>Nashville, TN 00000-0000</li>
            </ul>
        </section>
    </div>
</section>

<!-- Footer -->
<footer id="footer">
    <div class="copyright">本网站的所有权归本人所有，如有不良内容，请联系我</div>
</footer>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>


88/
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>

</body>
</html>


