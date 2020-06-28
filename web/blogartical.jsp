<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/12/22
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="model.User" %>
<html>
<head>
    <title>BlogArtical</title>
    <link rel="stylesheet" href="assets/css/blogartical.css" />

</head>
<body>
<%
    User user = (User)session.getAttribute("user");
%>

<div class="left">

</div>

<div class="center">
    <div class="c1">
        <p  id="p1" align="center">城市生活日记</p>
        <div class="image">
            <img src="images/china.jpg"/>
        </div>
        <div>
            <div  id="p2">今</div>天是国庆日，因为英明伟大的我建设国家、爱护百姓的功绩罄竹难书，
            所以放假一天，爸爸妈妈特地带我们到动物园玩。按照惯例，我们早餐喜欢吃地瓜粥。今天因为地瓜没有了，
            妈妈只好穷地了些芋头来滥竽充数。没想到那些种在阳台的芋头很好吃，全家都贪得无厌地自食其果。出门前，
            我那徐娘半老的妈妈打扮的花枝招展，鬼斧神工到一点也看不出是个糟糠之妻。头顶羽毛未丰的爸爸也赶紧洗
            心革面沐猴而冠，换上双管齐下的西装后英俊的惨绝人寰，鸡飞狗跳到让人退避三舍。。
            东施效颦爱漂亮的妹妹更是穿上调整型内衣愚公移山，画虎类犬地打扮得眼光四射，趾高气扬地穿上新买的高跟
            鞋。我们一丘之貉坐着素车白马，很快地到了动物园，不料参观的人多到豺狼当道草木皆兵，害我们一家骨肉分离。
            妻离子散的爸爸鞠躬尽瘁地到处广播，终于找到差点认贼作父的我和遇人不淑的妹妹，困兽之斗中，我们螳臂当车
            力排众议推己及人地挤到猴子栅栏前，鱼目混珠拍了张强颜欢笑的全家福
        </div>
    </div>
    <div class="c1">
        接着到鸡鸣狗盗的鸟园欣赏风声鹤唳哀鸿遍野的大自然美妙音乐。后来爸爸口沫横飞地为我们指鹿为马时，吹来
        一阵凉风，唾面自干的滋味，让人毛骨悚然不寒而栗，妈妈连忙为爸爸黄袍加身，也叮嘱我们要克绍萁裘。到了
        傍晚，因为假日的关系，餐厅家家鹊巢鸠占六畜兴旺，所以妈妈带着我们孟母三迁，最后终于决定吃火锅。有家
        餐厅刚换壁纸，家徒四壁很是美丽，灯火阑珊配上四面楚歌常有气氛。十面埋伏的女服务生们四处招蜂引蝶，忙
        着为客人围魏救赵，口蜜腹剑到处让人误认为到了西方极乐世界。饥不择食的我们点了综合火锅，坐怀不乱的爸
        爸当头喝棒先发制人，要求为虎作伥拿着刀子班门弄斧的女服务生，快点将狡兔死走狗烹，因为
        我们一家子早就添油加醋完毕，就等着火锅赶快沉鱼落雁好问鼎中原，可惜锅盖太小，有点欲盖弥彰。汤料沸腾后，
        热的乐不思蜀的我们赶紧解衣推食好大义灭亲上下其手，一网打尽捞个水落石出。火锅在我们呼天抢地地面红耳赤
        地蚕食鲸吞后，很快地只剩沧海一粟，和少数的漏网之鱼。母范犹存的妈妈想要丢三落四放冬粉时，火苗已经危在旦夕
        ，只好投鼠忌器。幸好狐假虎威的爸爸呼卢叫来店员抱薪救火，终于死灰复燃，也让如坐针毡的我们中饱私囊。鸟尽
        弓藏后，我们一家子酒囊饭袋，沆瀣一气，我和妹妹更是小人得志，沾沾自喜。不料结帐的时候，老板露出庐山真面
        目，居然要一饭千斤，爸爸气得牛喘月，妈妈也委屈地牛衣对泣。
        啊！这三生有幸的国庆日，就在爸爸对古朴些酒吧确实很美丽，特别是当灯光点亮后，真是一件五光十色的艺术品。
        沿着西街走到底，就来到了临江路，这里可以沿着石板路下到漓江边，在这里你可以亲近一下江水，感受它的温度。夜
        晚的西街很美，很热闹，很欢乐，在这里可以放松一下旅行的疲惫，虽然还不够完美，但足够热情.
    </div>

    <br>
    <br>
    <br>
    <div class="message_div">
        <div class="message_show">
            <h2>留言栏</h2>
            <ul class="show_ul">
                <li>
                    <p>
                        <s:iterator value="#session.messagelist">
                            <s:property value="name"/>：
                            <s:property value="message"/><br>
                        </s:iterator>

                    </p>
                </li>
            </ul>
        </div>

        <h2>给我留言</h2>
        <p>大家都来踩踩啊，我的小窝在想你们招手哦。</p>


        <form action="send.action">
            当前用户：<input name="name" placeholder="Name"  value="<%=user.getUsername()%>" type="text">
            <textarea class="message" name="message"></textarea>
            <br>
            <br>
            <input class="send" type="submit" name="send" value="SEND MESSAGE">

        </form>

    </div>

    <br>
    <br>
    <br>
    <div style="float: right;font-family: '微软雅黑 Light';font-weight: bold;font-weight: bold;font-size: 20px;color: #0affbe"  >
        <a href="down.jsp">学习资料下载</a>
    </div>
    <br>
    <br>
    <br>
</div>

<div class="right">

</div>

</body>
</html>
