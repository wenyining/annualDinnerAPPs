<%-- 
    Document   : danmu
    Created on : 2014-12-5, 17:54:09
    Author     : JAWEN
--%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Subtitle in HTML5</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="js/jquery-1.7.1.min.js"></script>
        <script>
            var st, ctx;
            var speed = 1000;
            var start = 0;
            var length = 21;
            var font = "200% Arial";
            var text;
            var pathname = window.location.pathname;



            $(document).ready(function () {
                getText();
                st = $('#subtitle')[0];
                ctx = st.getContext("2d");
                //ctx.width = device-width;
                //ctx.height = device-height;
                ctx.font = font;
                ctx.textAlign = 'left';
                setInterval(draw, speed);
                alert(pathname);
            });

            function draw() {
                drawBackground();
                drawText();
            }

            function drawText() {
                ctx.shadowOffsetY = 2;
                ctx.shadowBlur = 2;
                ctx.shadowColor = "silver"
                alpha = 1;
                ctx.save();
                ctx.fillStyle = "rgba(255,255,255," + alpha + ")";
                //add blank between two lines
                pad = 0;
                for (i = start; i < start + length; i++) {
                    if (i < text.length) {
                        ctx.fillText(text[i], st.width / 2 - ctx.measureText(text[i]).width / 2 - 30, st.height - 25 - (start + length - i) * 25 + pad * 10);
                    }
                    pad++;
                }
                start++;
                if (start == text.length) {
                    restart();
                }
                ctx.restore();
            }

            function drawBackground() {
                //ctx.fillStyle='black';
                //ctx.fillRect(0,0,st.width,st.height);
                var img = document.getElementById("scream");
                ctx.drawImage(img, 10, 10);
            }

            function getText() {
                text = new Array("000000", "11111", "22", "333", "4444", "5555", "66", "777777", "88888", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25");

                jQuery.support.cors = true;
                $.ajax(
                        {
                            type: "get",
                            url: '/annualDinner/comments',
                            data: '',
                            contentType: "application/json; charset=UTF-8",
                            dataType: "json",
                            success: function (data) {
                                //alert('success');
                                $.each(data, function (i, theItem) {
                                    //alert('Key: '+ option.text + ' Value:' + option.value);

                                });
                                alert(data[0]);
                                alert(b64_to_utf8(data[0]));
                                alert(window.atob(data[0]));
                                alert(decode_utf8(data[0]));
                                alert(encode_utf8(window.atob(data[0])));
                                alert(decode_utf8(window.atob(data[0])));
                                console.log(window.atob(JSON.stringify(data)));
                                alert(JSON.stringify(data));
                                alert(encode_utf8(JSON.stringify(data)));
                                text = JSON.stringify(data);
                            },
                            error: function (msg, url, line) {
                                alert('error trapped in error: function(msg, url, line)');
                                alert('msg = ' + msg + ', url = ' + url + ', line = ' + line);
                            }
                        });
            }

            function restart() {
                getText();
                //reset start=0
                start = 0;
            }

            function encode_utf8(s) {
                return unescape(encodeURIComponent(s));
            }

            function decode_utf8(s) {
                return decodeURIComponent(escape(s));
            }

            function utf8_to_b64(str) {
                return window.btoa(unescape(encodeURIComponent(str)));
            }

            function b64_to_utf8(str) {
                return decodeURIComponent(escape(window.atob(str)));
            }


        </script>
    </head>
    <body>
        <canvas id="subtitle" width="1366" height="768"></canvas>
        <img id="scream" src="1.jpg" alt="The Scream" hidden="hidden" width="1366" height="768"/>
    </body>
</html>

