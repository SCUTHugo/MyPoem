<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--jsp使用EL表达式访问WEB-INF外的css等资源--%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>朋友圈</title>
    <link rel="stylesheet" href="${path}/css/reset.css" />
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/css/main.css" />
</head>
<body>
<!--为header设置背景图片-->
<header class="main-header">
    <!--当图片无法显示时，显示以下内容-->
    <div class="container hide">
        <div class="row">
            <div class="col-sm-12">
                <!--<h2 class="text-hide">这是一个现代诗分享平台</h2>  &lt;!&ndash;未设置样式&ndash;&gt;-->
                <h2>生活除了眼前的苟且，还有诗和</h2>  <!--未设置样式-->
                <h2>远方</h2>
            </div>
        </div>
    </div>
</header>

<!--导航栏-->
<nav class="main-navigation">
    <div id="main-menu">
        <ul class="menu">
            <li><a href="home.html">首页</a></li>
            <li><a href="recommend.html">今日推荐</a></li>
            <li class="current-page"><a href="friends.jsp">朋友圈</a></li>
            <li><a href="mine.html">个人中心</a></li>
        </ul>
        <!--小屏幕时显示的导航栏，默认隐藏-->
        <span class="menu-small hide glyphicon glyphicon-chevron-down"></span>
    </div>

    <!--搜索框  样式有待改善-->
    <div id="main-search">
        <form id="form-search" action="" method="post">
            <div class="input-group">
                <input name="poem-search" type="text" class="form-control poem-search" value="搜索" />
                <button class="btn btn-default" onclick="document.getElementById('form-search').submit()">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </div>
        </form>
    </div>
</nav>
<!--小屏幕时点击扩展图标的下拉菜单，默认隐藏-->
<div class="assit-menu">
    <ul class="menu">
        <li><a href="home.html">首页</a></li>
        <li><a href="recommend.html">今日推荐</a></li>
        <li class="current-page"><a href="friends.jsp">朋友圈</a></li>
        <li><a href="mine.html">个人中心</a></li>
    </ul>
</div>



<!--好友动态-->
<div class="content-wrap">
    <div class="container">
        <div class="row">
            <!--动态占8列-->
            <main class="col-md-9 main-content">
                <article id="5" class="dynamic">
                    <div class="dynamic-head">
                        <h1 class="dynamic-title">
                            <a href="zheyeshiyiqie.html">这也是一切</a>   <!--如何跳转到作者的相应页面，参考ghost网站-->
                        </h1>
                        <div class="dynamic-meta">
                            <span class="dynamic-author">
                                作者：
                                <a target="_blank" href="wangsai.html">王赛</a>
                            </span>
                            <time class="dynamic-time" title="2016年9月3日星期六上午9点30分" datetime="2016年9月3日星期六上午9点30分">2016-9-3</time>
                        </div>
                    </div>
                    <div class="dynamic-content">
                        <p>不是一切大树，都被风暴折断；</p>    <!--如何处理从数据库拿到的文本？用标点符号分割放置到p？？-->
                        <p>不是一切种子，都找不到生根的土壤；</p>   <!--是个发布页面限制格式-->
                        <p>不是一切真情，都流失在人心的沙漠里；</p>  <!--存储也有一定格式-->
                        <p>不是一切梦想，都甘愿被折断翅膀......</p>
                    </div>
                    <div class="row">   <!--用row包裹，给图片设置栅格系统-->
                        <div class="dynamic-img col-sm-7 col-xs-9">
                            <img src="${path}/img/ThisIsEverything.jpg" alt="这也是一切" />
                        </div>
                    </div>
                    <div class="dynamic-action">
                        <div class="row">
                            <ul>
                                <li class="col-xs-3 keep">
                                    <span class="glyphicon glyphicon-heart-empty"></span><span>收藏</span>
                                </li>
                                <li class="col-xs-3 share">
                                    <span class="glyphicon glyphicon-share"></span><span class="share-number">4</span>
                                </li>
                                <li class="col-xs-3 comment">
                                    <span class="glyphicon glyphicon-comment"></span><span class="comment-number">4</span>
                                </li>
                                <li class="col-xs-3 thumb">
                                    <span class="glyphicon glyphicon-thumbs-up"></span><span class="thumb-number">8</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--点击转发后，出现遮罩层-->


                    <!--点击评论后，显示的评论记录及评论框-->
                    <div class="comment-wrap">
                        <div class="dynamic-comment">
                            <div class="send-comment">
                                <!--不能在评论框前面放用户名，不同长度的用户名会导致评论框的位置变动-->
                                <!--<span class="my-name">张三</span>-->
                                <a href="mine.html">
                                    <img src="${path}/img/writeCommand.jpg" alt="输入你的评论" />
                                </a>
                                <textarea name="comment" class="input-comment" rows="2"></textarea>
                                <br />
                                <button class="btn-comment btn btn-default">
                                    评论
                                </button>
                            </div>
                            <div class="comment">
                                <a target="_blank" href="#" class="reviewer">李四</a>
                                :
                                <div class="reviewer-words">
                                    这是评论。这是评论。这是评论。这是评论。
                                </div>
                            </div>
                            <div class="comment">
                                <a target="_blank" href="#" class="reviewer">王五</a>
                                :
                                <div class="reviewer-words">
                                    这是评论。这是评论。这是评论。这是评论。
                                    这是评论。这是评论。这是评论。这是评论。
                                </div>
                            </div>
                            <div class="comment">
                                <a target="_blank" href="#" class="reviewer">周兆</a>
                                :
                                <div class="reviewer-words">
                                    这是评论。这是评论。这是评论。这是评论。
                                    这是评论。这是评论。这是评论。这是评论。
                                </div>
                            </div>
                            <div class="comment">
                                <a target="_blank" href="#" class="reviewer">王五</a>
                                :
                                <div class="reviewer-words">
                                    这是评论。这是评论。这是评论。这是评论。
                                    这是评论。这是评论。这是评论。这是评论。
                                    这是评论。这是评论。这是评论。这是评论。
                                    这是评论。这是评论。这是评论。这是评论。
                                </div>
                            </div>
                            <div class="more-comment">
                                <span>加载更多</span>
                            </div>
                        </div>
                    </div>
                </article>

                <article id="4" class="dynamic">
                    <div class="dynamic-head">
                        <h1 class="dynamic-title">
                            <a href="#">抉择</a>   <!--如何跳转到作者的相应页面，参考ghost网站-->
                        </h1>
                        <div class="dynamic-meta">
                           <span class="dynamic-author">
                               作者：
                               <a target="_blank" href="#">张三</a>
                           </span>
                            <time class="dynamic-time" title="2016年9月3日星期六上午9点30分" datetime="2016年9月3日星期六上午9点30分">2016-9-3</time>
                        </div>
                    </div>
                    <div class="dynamic-content">
                        <p>不是一切大树，都被风暴折断；</p>    <!--如何处理从数据库拿到的文本？用标点符号分割放置到p？？-->
                        <p>不是一切种子，都找不到生根的土壤；</p>   <!--是个发布页面限制格式-->
                        <p>不是一切真情，都流失在人心的沙漠里；</p>  <!--存储也有一定格式-->
                        <p>不是一切梦想，都甘愿被折断翅膀......</p>
                    </div>
                    <div class="row">
                        <div class="dynamic-img col-sm-7 col-xs-9">
                            <img src="${path}/img/choose.jpg" alt="这也是一切" />
                        </div>
                    </div>
                    <div class="dynamic-action">
                        <div class="row">
                            <ul>
                                <li class="col-xs-3">
                                    <span class="glyphicon glyphicon-heart-empty"></span><span>收藏</span>  <!--span之间若出现换行，实现出来会有间距-->
                                </li>
                                <li class="col-xs-3">
                                    <span class="glyphicon glyphicon-share"></span><span class="share-number">4</span>
                                </li>
                                <li class="col-xs-3">
                                    <span class="glyphicon glyphicon-comment"></span><span class="comment-number">4</span>
                                </li>
                                <li class="col-xs-3">
                                    <span class="glyphicon glyphicon-thumbs-up"></span><span class="thumb-number">10</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--点击评论后，显示的评论记录及评论框-->
                    <div class="comment-wrap">
                        <div class="dynamic-comment">
                            <div class="send-comment">
                                <!--不能在评论框前面放用户名，不同长度的用户名会导致评论框的位置变动-->
                                <!--<span class="my-name">张三</span>-->
                                <a href="mine.html">
                                    <img src="${path}/img/writeCommand.jpg" alt="输入你的评论" />
                                </a>
                                <textarea name="comment" class="input-comment" rows="2"></textarea>
                                <br />
                                <button class="btn-comment btn btn-default">
                                    评论
                                </button>
                            </div>
                            <div class="comment">
                                <a target="_blank" href="#" class="reviewer">李四</a>
                                :
                                <div class="reviewer-words">
                                    这是评论。这是评论。这是评论。这是评论。
                                </div>
                            </div>
                            <div class="comment">
                                <a target="_blank" href="#" class="reviewer">王五</a>
                                :
                                <div class="reviewer-words">
                                    这是评论。这是评论。这是评论。这是评论。
                                    这是评论。这是评论。这是评论。这是评论。
                                </div>
                            </div>
                            <div class="comment">
                                <a target="_blank" href="#" class="reviewer">周兆</a>
                                :
                                <div class="reviewer-words">
                                    这是评论。这是评论。这是评论。这是评论。
                                    这是评论。这是评论。这是评论。这是评论。
                                </div>
                            </div>
                            <div class="comment">
                                <a target="_blank" href="#" class="reviewer">王五</a>
                                :
                                <div class="reviewer-words">
                                    这是评论。这是评论。这是评论。这是评论。
                                    这是评论。这是评论。这是评论。这是评论。
                                    这是评论。这是评论。这是评论。这是评论。
                                    这是评论。这是评论。这是评论。这是评论。
                                </div>
                            </div>
                            <div class="more-comment">
                                <span>加载更多</span>
                            </div>
                        </div>
                    </div>
                </article>
            </main>
            <!--查找好友及分类占4列-->
            <aside class="col-md-3 sidebar">
                <div class="widget">
                    <h4 class="side-title">
                        查找好友
                    </h4>
                    <div class="side-search"></div>
                </div>
                <div class="widget">
                    <h4 class="side-title">
                        分类
                    </h4>
                    <div class="side-classify"></div>
                </div>
            </aside>
        </div>
    </div>
</div>

<!--点击转发后，弹出模态框-->
<div class="modal" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">转发</h4>
            </div>
            <div class="modal-body">
                <div class="share-content">
                    <a class="share-author" target="_blank" href="#"></a>
                    : &nbsp;
                    <span class="share-title"></span>
                </div>
                <div class="share-word">
                    <textarea name="share-word" id="share-word" cols="100" rows="5" title="20">请输入转发理由</textarea>
                    <span class="remain-word">120</span>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary">转发</button>
            </div>
        </div>
    </div>
</div>


<script src="${path}/js/jquery.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script src="${path}/js/main.js"></script>
</body>
</html>