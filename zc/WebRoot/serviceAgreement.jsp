<%@ page language="java" import="java.util.*,demo.applist" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>服务协议</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
</head>
<body>
<div class="navbar-fixed-top">
    <div class="chen-header">
        <div class="container">
            <% 
        	String userEmail=(String)request.getSession().getAttribute("userEmail");
        	if(userEmail==null){
        		out.print("<div class='header-bar'>");
        		out.print("<a href='login.jsp'>登录</a>");
        		out.print("<a href='register.jsp'>注册</a>");
        		out.print("</div>");
        	}else{
        		out.print("<div class='header-login'>");
        		out.print("<a href='mytest?pageNum=1'>我的测试</a>");
  				out.print("<a href='userCenter'>您好，"+userEmail+"</a>");
        		out.print("<a href='loginOut'>退出</a>");
        		out.print("</div>");
        	}
        %>
        </div>
    </div>
    <nav class="navbar navbar-default chen-index" role="navigation">
        <div class="container" id="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand test-list" href="index.jsp">
                    <img src="images/logo.png" alt="Logo">
                </a>
            </div>
            <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="compatibleTest.jsp">兼容测试</a></li>
                    <li><a href="funTest.jsp">功能测试</a></li>
                    <li><a href="collapseTest.jsp">崩溃收集</a></li>
                    <li><a href="phoneCheck.jsp">真机调试</a></li>
                    <li><a href="safeTest.jsp">安全测试</a></li>
                    <li><a href="ABTest.jsp">A/B测试</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="h103"></div>
<div class="chen-contact">
    <div class="contact-expert">
        <p>为您打造更高品质的APP</p>
        <p>WE'RE  EXPERT</p>
    </div>
    <div class="nav">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-2 col-sm-2"></div>
                <div class="col-md-3 col-sm-3 col-xs-4"><a href="aboutUs.jsp">关于我们</a></div>
                <div class="col-md-2 col-sm-3 col-xs-4"><a href="serviceAgreement.jsp">服务协议</a></div>
                <div class="col-md-3 col-sm-3 col-xs-4"><a href="contactUs.jsp">联系我们</a></div>
                <div class="col-md-2 col-sm-2"></div>
            </div>
        </div>
    </div>
    <div class="service">
        <div class="container">
            <h3>1. 特别提示</h3>
            <p>1.1 深圳市前海运通技术有限公司(以下称"前海运通")同意按照本协议的规定及其不时发布的操作规则提供基于移动互联网的相关服务(以下称"移动网络服务")， 为
                获得移动网络服务，服务使用人(以下称"用户")同意本协议的全部条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"同意"按 钮即表示
                用户完全接受本协议项下的全部条款。 本协议下的条款可由前海运通随时变更，用户须定期审阅本协议。协议条款一旦发生变动，前海运通将会在相关页面上提示
                变更内容。变更后的协议在相关的页面上 公布即有效代替原来的协议。用户如不同意前海运通对本协议的所作的任何变更，应立即停止使用前海运通提供的服务。
                如用户在本协议变更后继续使用前海运通的 服务，即视作用户已完全同意变更后的协议。用户可随时造访本页查阅最新服务协议。用户在使用前海运通提供的各项
                服务之前，应仔细阅读本服务协议，如用户不 同意本服务协议及/或随时对其的修改，请停止使用前海运通提供的服务。</p>
            <h3>2.服务内容</h3>
            <p>2.1 前海运通服务的具体内容由前海运通根据实际情况提供，例如真机测试、自动测试、智能监控、安全检测、安全评估、论坛、电子邮件、发表新闻评论等。前海
                运通保留随时变更、终止或终止部分或全部移动网络服务的权利。</p>
            <p>2.2 前海运通是专为无物流的文化和虚拟产品提供的云服务测试及监控平台，通过真机测试，实时监控，适配测试、安全检测、安全评估等，为用户获取移动设备使
                用服务提供优选渠道。</p>
            <h3>3. 使用规则</h3>
            <p>3.1 用户承诺以其真实身份注册成为前海运通的用户，并保证所提供的个人身份资料信息真实、完整、有效，依据法令规定和本协议约定对所提供的信息承担相应的
            法律 责任。前海运通有权审查用户注册所提供的身份信息是否真实、有效。用户以其真实身份注册成为前海运通用户后，需要修改所提供的个人身份资料信息的，
                云测网 络应当及时、有效地为其提供该项服务。</p>
            <p>3.2 用户注册成功后，前海运通将给予每个用户一个用户账号及相应的密码。该用户账号和密码由用户负责保管。用户有义务妥善保管其账号及密码，并正确、安全
            地使 用其账号及密码，并对登录后所持账号产生的行为依法享有权利和承担责任。前海运通应积极地采取技术与管理等合理措施保障用户账号的安全、有效。任何
                一方未尽上述义务导致账号密码遗失、账号被盗等情形而给用户和他人的民事权利造成损害的，应当承担由此产生的法律责任。</p>
            <p>3.3 用户发现其账号或密码被他人非法使用或有使用异常的情况的，应及时根据前海运通公布的处理方式通知前海运通，并有权通知前海运通采取措施暂停该账号的
            登录和使用。前海运通在收到用户要求采取措施暂停其账号登录和使用的通知后，应当要求用户提供并核实与其注册身份信息相一致的个人有效身份信息。前海运
            通核实 用户所提供的个人有效身份信息与所注册的身份信息相一致的，应当及时采取措施暂停用户账号的登录和使用。前海运通违反前述约定，未及时采取措施暂
            停用户账 号的登录和使用，因此而给用户造成损失的，应当承担其相应的法律责任。用户没有提供其个人有效身份证件或者用户提供的个人有效身份证件与所注册
            的身份信息 不一致的，前海运通有权拒绝用户前述请求。3.4 用户为了维护其合法权益，向前海运通提供与所注册的身份信息相一致的个人有效身份信息时，前海
                运通应当为用户提供账号注册人证明、原始注册信息等必要的协助和支持，并根据需要向有关行政机关和司法机关提供相关证据信息资料。</p>
            <h3>4.移动网络服务保护</h3>
            <p>4.1用户只有在获得前海运通或其他相关权利人的书面授权之后才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。</p>
            <h3>5. 用户信息保护</h3>
            <p>5.1在不透露单个用户隐私资料的前提下，前海运通有权对整个用户数据库进行技术分析并对已进行分析、整理后的用户数据库进行商业上的利用。尽管前海运
                通 对用户的隐私权保护做了极大的努力，但是仍然不能保证现有的安全技术措施使用户的技术信息等不受任何形式的损失。</p>
            <p>5.3未经用户许可前海运通不得向任何第三方公开或共享用户注册资料中的姓名、个人有效身份证件号码、联系方式、家庭住址等个人身份信息，但下列情况除外：
                5.3.1 用户或用户监护人授权前
            海运通披露的；5.3.2 有关法令要求前海运通披露的；5.3.3 司法机关或行政机关基于法定程序要求前海运通提供的；5.3.4 前海运通为了维护自己合法权益而向
                用户提起诉讼或者仲裁时；5.3.5 应用户监护人的合法要求而提供用户个人身份信息时；5.3.6 为维护社会公众的利益。</p>
            <h3>6. 免责声明</h3>
            <p>6.1 Test通行证所有者不保证以下事宜：6.1.1 本服务将符合您的要求6.1.2 本服务将不受干扰、及时提供、安全可靠或不会出错。</p>
            <p>6.2 用户明确同意其使用前海运通服务所存在的风险将完全由其自己承担；因其使用前海运通服务而产生的一切后果也由其自己承担，前海运通对用户不承担任何
                责任。</p>
            <h3>7. 违约赔偿</h3>
            <p>7.1 用户同意保障和维护前海运通及其他用户的利益，如因用户违反有关法律、法规或本协议项下的任何条款而给前海运通或任何其他第三人造成损失，用户同意
                承担由此造成的损害赔偿责任。</p>
            <h3>8. 法律管辖</h3>
            <p>8.1 本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。</p>
            <p>8.2 如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均应向法院提起诉讼。</p>
            <h3>9. 其他规定</h3>
            <p>9.1 本协议构成双方对本协议之约定事项及其他有关事宜的完整协议，除本协议规定的之外，未赋予本协议各方其他权利。</p>
            <p>9.2 如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</p>
        </div>
    </div>
</div>
<div class="chen-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6  col-xs-6">
                <div class="footer-item">
                    <h3 class="text-center"><i class="fa fa-headphones"></i>帮助中心</h3>
                    <p>如果您在使用过程中遇到哪些问题，包
                        括应用描述、使用方法、报告解读等，
                        都可以随时联系我们。</p>
                    <a href="aboutUs.jsp">立即进入&gt;&gt;</a>
                </div>
            </div>
            <div class="col-md-3 col-sm-6  col-xs-6">
                <div class="footer-item">
                    <h3 class="text-center"><i class="fa fa-commenting-o"></i>错误反馈</h3>
                    <p>如果您在使用过程中遇到错误信息，包
                        括报告无法下载、信息错误、提交错误
                        等，都可以随时反馈给我们。</p>
                    <a href="feedback.jsp">立即进入&gt;&gt;</a>
                </div>
            </div>
            <div class="col-md-3 col-sm-6  col-xs-6">
                <div class="footer-item">
                    <h3 class="text-center"><i class="fa fa-user"></i>服务咨询</h3>
                    <p>如果您在使用过程中对于我们的服务
                        不明白，都可以随时联系我们。随时
                        为您解答。</p>
                    <a href="contactUs.jsp">立即进入&gt;&gt;</a>
                </div>
            </div>
            <div class="col-md-3 col-sm-6  col-xs-6">
                <div class="footer-item">
                    <h3 class="text-center"><i class="fa fa-phone"></i>联系我们</h3>
                    <p>用心服务，时刻等待您的电话，谢谢
                        您的来电。</p>
                    <a href="contactUs.jsp">立即进入&gt;&gt;</a>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="com-md-6 col-sm-6 col-xs-6 text-left">
                <div class="footer-left">
                    <h3>联系我们</h3>
                    <p>电 话：0755-86313688</p>
                    <p>Email：zc@expdatacloud.com</p>
                    <p>地 址：深圳市福田区福华一路138号深圳国际商会大厦B座1706</p>
                </div>
            </div>
            <div class="com-md-6 col-sm-6 col-xs-6 text-right">
                <div class="footer-right">
                    <img src="images/erweima.jpg" alt="">
                    <p>© Copyright 2015-2016. 深圳市前海运通技术有限公司 粤ICP备16028168号</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="js/adaptive.js"></script>
<script>
window['adaptive'].desinWidth = 1400;
window['adaptive'].baseFont = 16;
window['adaptive'].maxWidth = 1400;
window['adaptive'].init();
</script>
</body>
</html>