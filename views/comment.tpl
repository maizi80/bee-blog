<!--评论输出地方-->

<section id="comments" class="comments">
    <!-- 隐藏评论 -->
    <div class="commentwrap comments-hidden" style="display: block;">
        <div class="notification"><i class="iconfont"></i>查看评论</div>
    </div>
    <!-- 输出评论信息 -->
    <div class="comments-main" style="display: none;">
        <h3 id="comments-list-title">Comments | <a><span class="noticom">{{.article.CommentCount}}</span>条评论</a></h3>
        <div id="loading-comments"><span></span></div>
        <!-- 评论内容 -->
        <div id="comments-ajax">
            <ol class="comment-list">
                {{range $key,$common := .commons}}
                <li class="comment comment-even depth-1" id="li-comment-{{$common.Id}}">
                    <div id="comment-{{$common.Id}}" class="comment_body contents">
                        <div class="profile">
                            <a href="#"><img alt="{{$common.UserName}}" src="/static/images/akinadeaava.jpg" class="avatar avatar-50 photo" height="50" width="50"></a>
                        </div>
                        <section class="commeta">
                            <div class="left">
                                <h4 class="author"><a href="#">{{$common.UserName}}</a></h4>
                            </div>
                            <a rel="nofollow" class="comment-reply-link" href="#" onclick="return TypechoComment.reply(&#39;comment-{{$common.Id}}&#39;, {{$common.Id}});" aria-label="回复给{{$common.UserName}}">回复</a>
                            <div class="right">
                                <div class="info"><time datetime="{{$common.CreatedAt}}">{{$common.CreatedAt}}</time></div>
                            </div>
                        </section>
                        <div class="body">
                            <p>
                                <!-- 评论@ -->
                                {{str2html $common.Content}} <!-- 评论内容 -->
                            </p>
                        </div>
                    </div>
                    <!-- 嵌套评论代码 -->
                    {{if gt ($common.Children|len) 0}}
                    <div class="children">
                        <ol class="comment-list">
                            {{range $k,$children := $common.Children}}
                            <li class="comment comment-odd depth-2" id="li-comment-{{$children.Id}}">
                                <div id="comment-{{$children.Id}}" class="comment_body contents">
                                    <div class="profile">
                                        <a href="#"><img alt="{{$children.UserName}}" src="/static/images/akinadeaava.jpg" class="avatar avatar-50 photo" height="50" width="50"></a>
                                    </div>
                                    <section class="commeta">
                                        <div class="left">
                                            <h4 class="author"><a href="#">{{$children.UserName}}</a></h4>
                                        </div>
                                        <a rel="nofollow" class="comment-reply-link" href="#" onclick="return TypechoComment.reply(&#39;comment-{{$children.Id}}&#39;, {{$children.Id}});" aria-label="回复给{{$children.UserName}}">回复</a>
                                        <div class="right">
                                            <div class="info"><time datetime="{{$children.CreatedAt}}">{{$children.CreatedAt}}</time></div>
                                        </div>
                                    </section>
                                    <div class="body">
                                        <p>
                                            <a href="#" rel="nofollow" class="cute atreply">@{{$common.UserName}}</a> :                                    <!-- 评论@ -->
                                            {{$children.Content}} <!-- 评论内容 -->
                                        </p>
                                    </div>
                                </div>
                            </li>
                            {{end}}
                        </ol>
                    </div>
                    {{end}}
                </li>
                {{end}}
            </ol>
        </div>
        <!--评论框-->
        <!-- 判断设置是否允许对当前文章进行评论 -->
        <div id="respond_box">
            <div id="respond-post-115" class="comment-respond">
                <div class="cancel-comment-reply">
                    <a id="cancel-comment-reply-link" href="#" rel="nofollow" style="display:none" onclick="return TypechoComment.cancelReply();">取消回复</a>
                </div>
                <!-- 输入表单开始 -->
                <form action='{{urlfor "CommentController.Post" ":aid" .article.Id}}' id="commentform">
                    <input type="hidden" name="uid" id="uid" value="{{.user.Id}}">
                    {{if .user.Id}}
                    <!-- 如果当前用户已经登录 -->
                    <div class="author-updown">Welcome back <b>{{.user.Name}}</b>, <a id="toggle-comment-info">[ 修改 ] ↓</a></div>
                    {{end}}
                    <div id="comment-author-info" >
                        <input type="text" name="email" id="email" class="commenttext" placeholder="Email" value="{{.user.Email}}" size="22" tabindex="1">
                        <label for="email"></label>
                        <input type="text" name="name" id="name" class="commenttext" value="{{.user.Name}}" size="18" placeholder="Name" tabindex="3">
                        <label for="name"></label>
                    </div>
                    <div class="clear"></div>

                    <p><textarea name="content" id="comment" class="OwO-textarea" placeholder="come on baby !" tabindex="4" cols="50" rows="5"></textarea></p>
                    <div class="com-footer">
                        <input class="submit" name="submit" type="submit" id="submit" tabindex="5" value="发表评论">
                        <input type="hidden" name="comment_post_ID" value="{{.article.Id}}" id="comment_post_ID">
                        <input type="hidden" name="comment_parent" id="comment_parent" value="0">
                        <!--表情-->
                        <div class="OwO">
                            <div class="OwO-logo"><span>OωO表情</span></div>
                            <div class="OwO-body" style="width: 447%">
                                <ul class="OwO-items OwO-items-image OwO-items-show" style="max-height: 197px;">
                                    <li class="OwO-item" title="@(高兴)"><img src="/static/images/smilies/alu/gaoxing.png"></li>
                                    <li class="OwO-item" title="@(不高兴)"><img src="/static/images/smilies/alu/bugaoxing.png"></li>
                                    <li class="OwO-item" title="@(皱眉)"><img src="/static/images/smilies/alu/zhoumei.png"></li>
                                    <li class="OwO-item" title="@(大囧)"><img src="/static/images/smilies/alu/dajiong.png"></li>
                                    <li class="OwO-item" title="@(惊喜)"><img src="/static/images/smilies/alu/jingxi.png"></li>
                                    <li class="OwO-item" title="@(无语)"><img src="/static/images/smilies/alu/wuyu.png"></li>
                                    <li class="OwO-item" title="@(傻笑)"><img src="/static/images/smilies/alu/shaxiao.png"></li>
                                    <li class="OwO-item" title="@(期待)"><img src="/static/images/smilies/alu/qidai.png"></li>
                                    <li class="OwO-item" title="@(喜极而泣)"><img src="/static/images/smilies/alu/xijierqi.png"></li>
                                    <li class="OwO-item" title="@(脸红)"><img src="/static/images/smilies/alu/lianhong.png"></li>
                                    <li class="OwO-item" title="@(来亲亲)"><img src="/static/images/smilies/alu/laiqinqin.png"></li>
                                    <li class="OwO-item" title="@(汗如雨下)"><img src="/static/images/smilies/alu/hanruyuxia.png"></li>
                                    <li class="OwO-item" title="@(酷炸天)"><img src="/static/images/smilies/alu/kuzhatian.png"></li>
                                    <li class="OwO-item" title="@(抠鼻)"><img src="/static/images/smilies/alu/koubi.png"></li>
                                    <li class="OwO-item" title="@(叼烟)"><img src="/static/images/smilies/alu/diaoyan.png"></li>
                                    <li class="OwO-item" title="@(吐血)"><img src="/static/images/smilies/alu/tuxie.png"></li>
                                    <li class="OwO-item" title="@(流口水)"><img src="/static/images/smilies/alu/liukoushui.png"></li>
                                    <li class="OwO-item" title="@(呕吐不止)"><img src="/static/images/smilies/alu/outubuzhi.png"></li>
                                    <li class="OwO-item" title="@(吐舌)"><img src="/static/images/smilies/alu/tushe.png"></li>
                                    <li class="OwO-item" title="@(闭嘴)"><img src="/static/images/smilies/alu/bizui.png"></li>
                                    <li class="OwO-item" title="@(丢脸)"><img src="/static/images/smilies/alu/diulian.png"></li>
                                    <li class="OwO-item" title="@(含羞)"><img src="/static/images/smilies/alu/hanxiu.png"></li>
                                    <li class="OwO-item" title="@(不出所料)"><img src="/static/images/smilies/alu/buchusuoliao.png"></li>
                                    <li class="OwO-item" title="@(装逼)"><img src="/static/images/smilies/alu/zhuangbi.png"></li>
                                    <li class="OwO-item" title="@(尴尬)"><img src="/static/images/smilies/alu/ganga.png"></li>
                                    <li class="OwO-item" title="@(喷水)"><img src="/static/images/smilies/alu/penshui.png"></li>
                                    <li class="OwO-item" title="@(炒鸡愤怒)"><img src="/static/images/smilies/alu/chaojifennu.png"></li>
                                    <li class="OwO-item" title="@(干得好)"><img src="/static/images/smilies/alu/gandehao.png"></li>
                                    <li class="OwO-item" title="@(鄙视)"><img src="/static/images/smilies/alu/bishi.png"></li>
                                    <li class="OwO-item" title="@(捂眼)"><img src="/static/images/smilies/alu/wuyan.png"></li>
                                    <li class="OwO-item" title="@(无所谓)"><img src="/static/images/smilies/alu/wusuowei.png"></li>
                                    <li class="OwO-item" title="@(喜大普奔)"><img src="/static/images/smilies/alu/xijidaben.png"></li>
                                    <li class="OwO-item" title="@(思考)"><img src="/static/images/smilies/alu/sikao.png"></li>
                                    <li class="OwO-item" title="@(鼓掌)"><img src="/static/images/smilies/alu/guzhang.png"></li>
                                    <li class="OwO-item" title="@(发现此事并不简单)"><img src="/static/images/smilies/alu/fxcsbbjd.png"></li>
                                    <li class="OwO-item" title="@(汗)"><img src="/static/images/smilies/alu/han.png"></li>
                                    <li class="OwO-item" title="@(泪流成河)"><img src="/static/images/smilies/alu/llch.png"></li>
                                    <li class="OwO-item" title="@(阴暗)"><img src="/static/images/smilies/alu/yinan.png"></li>
                                    <li class="OwO-item" title="@(蜡烛)"><img src="/static/images/smilies/alu/lazhu.png"></li>
                                    <li class="OwO-item" title="@(投降)"><img src="/static/images/smilies/alu/touxiang.png"></li>
                                    <li class="OwO-item" title="@(吐血倒地)"><img src="/static/images/smilies/alu/tuxiedaodi.png"></li>
                                    <li class="OwO-item" title="@(便便)"><img src="/static/images/smilies/alu/bianbian.png"></li>
                                    <li class="OwO-item" title="@(长草)"><img src="/static/images/smilies/alu/zhangcao.png"></li>
                                    <li class="OwO-item" title="@(肿包)"><img src="/static/images/smilies/alu/zhongbao.png"></li>
                                    <li class="OwO-item" title="@(陷入深思)"><img src="/static/images/smilies/alu/xrss.png"></li>
                                    <li class="OwO-item" title="@(献花)"><img src="/static/images/smilies/alu/xianhua.png"></li>
                                    <li class="OwO-item" title="@(绿绿)"><img src="/static/images/smilies/alu/lvlv.png"></li>
                                    <li class="OwO-item" title="@(中枪)"><img src="/static/images/smilies/alu/zhongqiang.png"></li>
                                    <li class="OwO-item" title="@(击掌)"><img src="/static/images/smilies/alu/jizhang.png"></li>
                                    <li class="OwO-item" title="@(扇耳光)"><img src="/static/images/smilies/alu/shanerguang.png"></li>
                                    <li class="OwO-item" title="@(中刀)"><img src="/static/images/smilies/alu/zhongdao.png"></li>
                                </ul>
                                <div class="OwO-bar">
                                    <ul class="OwO-packages">
                                        <li class="OwO-package-active"><span>阿鲁</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript" src="/static/js/OwO.js." defer="defer"></script>
                    </div>
                    <input type="hidden" name="_" value="7665eac300bcfcf76f0394c1f273950d">
                </form>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</section>