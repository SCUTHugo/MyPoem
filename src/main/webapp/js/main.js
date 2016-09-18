/**
 * Created by Administrator on 2016/9/4.
 */
window.onresize = function () {
    // 当屏幕宽度小于600px时，设置文本的margin-left和margin-right
    // 设置“生活除了眼前的苟且，还有诗和”和“远方”为一个h2
    var clientWidth = parseInt(document.body.clientWidth);
    var $main_content = $(".main-content");
    var $content = $(".dynamic-content");
    var $title = $(".dynamic-title");
    var $header_text = $(".main-header .col-sm-12");
    if(clientWidth < 600){
        // 发布内容
        $main_content.css("padding-left", "7px");
        $main_content.css("padding-right", "7px");
        // 发布内容之文本
        $content.css("margin-left", "8%");
        $content.css("margin-right", "8%");

        // 字体大小
        $title.css("font-size", "25px");
        $content.css("font-size", "18px");

        // 图片无法显示时的文字格式
        $header_text.html("<h2>生活除了眼前的苟且，还有诗和远方</h2>");
    }else{
        $main_content.css("padding-left", "25px");
        $main_content.css("padding-right", "25px");

        $content.css("margin-left", "15%");
        $content.css("margin-right", "15%");

        $title.css("font-size", "36px");
        $content.css("font-size", "20px");

        $header_text.html("<h2>生活除了眼前的苟且，还有诗和</h2><h2>远方</h2>");
    }

    // 屏幕宽度改变时，可能引起的导航栏位置改变（固定/top=211px）
    window.onscroll();


    // 屏幕宽度小于800时，导航栏变化
    if(clientWidth < 800){
        var $menu = $("#main-menu");
        $menu.find("ul").addClass("hide");
        $menu.find(".menu-small").removeClass("hide");
    }else{
        var $menu = $("#main-menu");
        $menu.find("ul").removeClass("hide");
        $menu.find(".menu-small").addClass("hide");
        // 隐藏小屏幕打开的下拉菜单，并恢复“向上”图标为“向下”
        $(".assit-menu").css("margin-top", "-105px");
        $(".menu-small").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
    }
};

// 窗口滑动时，800px（平板）以上的屏幕设置导航栏绝对定位
// 手机和平板不设置导航栏固定
window.onscroll = function(){
    if(parseInt(document.body.clientWidth) >= 800){
        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        var $nav = $(".main-navigation");
        var $search = $("#main-search");
        if(scrollTop >= 211){
            $nav.css("top", scrollTop);
            $search.css("top", "12px");
        }else{
            $nav.css("top", "211px");
            $search.css("top", "-45px");
        }
    }else{     /*屏幕宽度小于800，不设置导航栏固定*/
        var $nav = $(".main-navigation");
        var $search = $("#main-search");
        $nav.css("top", "211px");
        $search.css("top", "-45px");
    }


    // 当搜索框位于导航栏上时，搜索框样式改变，设置为下拉模式
    // var $main_search = $("#main-search");
    // var $poem_search = $(".poem-search");
    // if($main_search.css("top") == "12px"){
    //     $poem_search.addClass("hide");
    // }else{
    //     $poem_search.removeClass("hide");
    // }

    // 当搜索框位于导航栏上时，input缩短
    var $main_search = $("#main-search");
    var $poem_search = $(".poem-search");
    if($main_search.css("top") == "12px"){
        $poem_search.css("width", "140px");
    }else{
        $poem_search.css("width", "160px");
    }
}





$(function(){
    window.onresize();
    window.onscroll();

    // 删除“点赞”右边的边框
    var $uls = $(".dynamic-action ul");
    var $last_lis = $uls.find("li:last");
    $last_lis.css("border-right", "none");

    // 移动端处理hover事件   ps：暂时没用上
    document.body.addEventListener('touchstart', function(){ });
    // 设置评论点赞的悬停和点击事件
    var $lis = $(".dynamic-action li");
    $lis.attr("get", "false");    /*get属性初始化为false*/

    $lis.find("span").hover(function () {
        $(this).parent().css("color", "#E67E22");
        $(this).css("cursor", "pointer");
    }, function () {
        if($(this).parent().attr("get") != "true"){
            $(this).parent().css("color", "#808080");
        }
    });
    $lis.find("span").click(function () {
        var $li = $(this).parent();
        var index = $li.index();

            var get_value = $li.attr("get");
        // 收藏处理
            if(index == 0){
                clickLi($li, get_value);
            }
        // 转发处理
            else if(index == 1){
                $('#myModal').modal({
                    show: false,
                    backdrop: "static",
                    keyboard: false
                });
                // 从该条动态取得作者和诗，并显示在弹出框
                var content = $(".modal .modal-body .share-content");
                var $parents = $li.parents();
                var $current_article = null;        /*用户要转发的那个动态*/
                $parents.each(function () {
                    if($(this).hasClass("dynamic")){
                        $current_article = $(this);
                    }
                });
                var author = $current_article.find(".dynamic-author a").html();
                var title = $current_article.find(".dynamic-title a").html();
                content.find(".share-author").html(author);
                content.find(".share-title").html(title);
                $("#myModal").modal('show');
            }
        // 评论处理，还要设置“加载中”的样式
            else if(index == 2){
                clickLi($li, get_value);
                var $parents = $li.parents();
                var $current_article = null;        /*展开评论的那个动态*/
                $parents.each(function () {
                    if($(this).hasClass("dynamic")){
                        $current_article = $(this);
                    }
                });
                if(!$current_article)
                    alert("出错了，找不到评论图标对应的动态！");
                $current_article.css("border-bottom", "none");
                var $current_comment = $current_article.find(".comment-wrap");
                $current_comment.toggle("slow");

                // // 动画下滑显示（bug有点多，放弃）
                // // 正常显示评论框及避免下一条动态非正常显示，需考虑评论框的高度
                // var comment_height = $current_comment.height();
                // $current_comment.animate({"bottom": -comment_height}, "normal");
                // var $next_article = $current_article.next();
                // // $next_article.css("margin-top", comment_height + 15);
                // $next_article.animate({"margin-top": comment_height + 15}, "normal");
            }
        // 点赞处理
            else if(index == 3){
                var $thumb_number = $li.find(".thumb-number");
                var thumb_number_text = parseInt($thumb_number.html());   /*parseInt转换为数字*/
                if(get_value == "false"){
                    var new_thumb = thumb_number_text + 1;  /*new_thumb需传送给后台*/
                    $thumb_number.html(new_thumb);  /*不能用++*/
                    $li.attr("get", "true");   /*此变量标明该选项已被选中*/
                    $li.css("color", "#E67E22");
                }else if(get_value == "true"){
                    var new_thumb = thumb_number_text - 1;
                    $thumb_number.html(new_thumb);
                    $li.attr("get", "false");
                    $li.css("color", "#808080");
                }
            }
    });

    // 搜索框
    var $search = $(".poem-search");
    focusAndBlur($search, "搜索");

    // 屏幕小于750px时，下拉菜单的显示（动画）
    var $menu_small = $(".menu-small");
    var $assit_menu = $(".assit-menu");
    $menu_small.click(function () {
        if($(this).hasClass("glyphicon-chevron-down")){
            $assit_menu.animate({"margin-top":"65px"}, "normal", function () {
                $menu_small.removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
            });
        }else if($(this).hasClass("glyphicon-chevron-up")){
            $assit_menu.animate({"margin-top":"-105px"}, "normal", function () {
                $menu_small.removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
            });
        }
    });

    // 若header的图片无法显示，显示header的文字


    // 转发
    // 重置转发框内容
    var $share_word = $("#share-word");
    var $remain_word = $(".remain-word");
    resetShare($share_word, $remain_word, 120);
    // 转发理由输入框设置focus样式
    $share_word.focus(function () {
        $(this).css("border-color", "#E67E22");
    }).blur(function () {
        $(this).css("border-color", "rgb(204,204,204)");
    });
    focusAndBlur($share_word, "请输入转发理由");
    // 转发理由限制字数，使用户更专注于表达核心内容
    $share_word.keydown(function () {
        checkLength($(this), $remain_word, 120);
    });
    $share_word.keyup(function () {
        checkLength($(this), $remain_word, 120);
    });
    $share_word.keypress(function () {
        checkLength($(this), $remain_word, 120);
    });
    // 转发框关掉后，重置转发框
    var $close_button = $(".modal-header").find("button");
    $close_button.click(function () {
        resetShare($share_word, $remain_word, 120);
    });
    // 点击“转发”按钮后，先检查剩余字数是否小于0，小于0则给予提示
    var $share_button = $(".modal-footer").find("button");
    $share_button.attr("disabled", false);
    $share_button.click(function () {
        if($remain_word.html() < 0){
            // 提示字数超出限制
            $share_word.css("background-color", "rgb(255,221,220)");
            setTimeout(function () {
                $share_word.css("background-color", "white");
                setTimeout(function () {
                    $share_word.css("background-color", "rgb(255,221,220)");
                    setTimeout(function () {
                        $share_word.css("background-color", "white");
                    }, 300);
                }, 300);
            }, 300);
        }else{
            // 将该动态转发到用户的朋友圈（提示转发中）
            $(this).css("opacity", "0.9");
            $(this).html("转发中");
            $(this).attr("disabled", true);    //禁用，转发成功后需重新启用
            $(this).css("background-color", "#E67E22");  //避免禁用时默认背景颜色改变
            buffering();




            // 提示“转发成功”并定时关掉弹出窗

        }
    });
});


// “收藏”等被点击时的样式处理
function clickLi(target, get_value){
    if(get_value == "false"){
        target.attr("get", "true");
        target.css("color", "#E67E22");
    }else if(get_value == "true"){
        target.attr("get", "false");
        target.css("color", "#808080");
    }
}

// 输入框获得焦点与失去焦点
function focusAndBlur(target, text){
    target.focus(function () {
        if($(this).val() == text){
            $(this).val("");
        }
    });
    target.blur(function () {
        var value = $(this).val().replace(/\s+/g,"");  /*消除字符串所有空格*/
        if(value == ""){
            $(this).val(text);
        }
    });
}

// 检查转发理由的长度
function checkLength(target, changeOne, maxLength) {
    var len = target.val().length;
    changeOne.html(maxLength - len);
    if((maxLength - len) < 0){
        changeOne.css("color", "red");
    }else{
        changeOne.css("color", "black");
    }
}

// 重置转发框内容（刷新浏览器或重新点“转发”后用上）
function resetShare(share_word, remain_word, maxLength) {
    share_word.val("请输入转发理由");
    remain_word.html(maxLength);
    remain_word.css("color", "black");
}

// 转发中...
function buffering() {
    var $share_button = $(".modal-footer").find("button");
    $share_button.css("width", "80px");
    var pre = $share_button.html();
    var text = "转发中";
    if(pre != (text + "...")){
        $share_button.html(pre + '.');
    }else{
        $share_button.html(text);
    }
    setTimeout("buffering($('.modal-footer').find('button'), '转发中')", 700);
}
