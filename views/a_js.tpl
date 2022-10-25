<script type="text/javascript">
    (function () {
        window.TypechoComment = {
            dom : function (id) {
                return document.getElementById(id);
            },
            create : function (tag, attr) {
                var el = document.createElement(tag);
                for (var key in attr) {
                    el.setAttribute(key, attr[key]);
                }
                return el;
            },
            reply : function (cid, coid) {
                var comment = this.dom(cid), parent = comment.parentNode,
                    response = this.dom('respond-post-115'), input = this.dom('comment-parent'),
                    form = 'form' == response.tagName ? response : response.getElementsByTagName('form')[0],
                    textarea = response.getElementsByTagName('textarea')[0];
                if (null == input) {
                    input = this.create('input', {
                        'type' : 'hidden',
                        'name' : 'parent',
                        'id'   : 'comment-parent'
                    });
                    form.appendChild(input);
                }
                input.setAttribute('value', coid);
                if (null == this.dom('comment-form-place-holder')) {
                    var holder = this.create('div', {
                        'id' : 'comment-form-place-holder'
                    });
                    response.parentNode.insertBefore(holder, response);
                }
                comment.appendChild(response);
                this.dom('cancel-comment-reply-link').style.display = '';
                if (null != textarea && 'text' == textarea.name) {
                    textarea.focus();
                }
                return false;
            },
            cancelReply : function () {
                var response = this.dom('respond-post-115'),
                    holder = this.dom('comment-form-place-holder'), input = this.dom('comment-parent');
                if (null != input) {
                    input.parentNode.removeChild(input);
                }
                if (null == holder) {
                    return true;
                }
                this.dom('cancel-comment-reply-link').style.display = 'none';
                holder.parentNode.insertBefore(response, holder);
                return false;
            }
        };
    })();
</script>
<script type="text/javascript">
    (function () {
        var event = document.addEventListener ? {
            add: 'addEventListener',
            triggers: ['scroll', 'mousemove', 'keyup', 'touchstart'],
            load: 'DOMContentLoaded'
        } : {
            add: 'attachEvent',
            triggers: ['onfocus', 'onmousemove', 'onkeyup', 'ontouchstart'],
            load: 'onload'
        }, added = false;
        document[event.add](event.load, function () {
            var r = document.getElementById('respond-post-115'),
                input = document.createElement('input');
            input.type = 'hidden';
            input.name = '_';
            input.value = (function () {
                var _Z21fAX = //'l'
                    '7'+'J'//'J'
                    +//'v4'
                    '665'+//'ie'
                    'e'+'ac3'//'Vw'
                    +/* '1v'//'1v' */''+//'wOm'
                    'wOm'+'0'//'7r3'
                    +//'z4'
                    'z4'+'B7'//'B7'
                    +//'Ib'
                    '0b'+'cfc'//'W'
                    +'f76'//'XI'
                    +//'Oe'
                    'Oe'+/* '5'//'5' */''+//'ID9'
                    'f'+//'m'
                    '03'+'94'//'Q'
                    +//'zSU'
                    'c1'+//'G'
                    'f'+'2'//'zPU'
                    +//'Aq'
                    '73'+//'ob'
                    '95'+//'5t'
                    '0'+'d'//'F'
                    , _Hef = [[1,2],[8,11],[9,11],[9,11],[17,19]];
                for (var i = 0; i < _Hef.length; i ++) {
                    _Z21fAX = _Z21fAX.substring(0, _Hef[i][0]) + _Z21fAX.substring(_Hef[i][1]);
                }
                return _Z21fAX;
            })();
            if (null != r) {
                var forms = r.getElementsByTagName('form');
                if (forms.length > 0) {
                    function append() {
                        if (!added) {
                            forms[0].appendChild(input);
                            added = true;
                        }
                    }
                    for (var i = 0; i < event.triggers.length; i ++) {
                        var trigger = event.triggers[i];
                        document[event.add](trigger, append);
                        window[event.add](trigger, append);
                    }
                }
            }
        });
    })();
</script>