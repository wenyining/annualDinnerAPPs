<%-- 
    Document   : danmu
    Created on : 2014-12-5, 17:54:09
    Author     : JAWEN
--%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" value="IE=9">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/corelib/style.css" />
        <!-- Run 'make' to corelib the file -->
        <script src="${pageContext.request.contextPath}/corelib/CommentCoreLibrary.js"></script>

        <!-- A few helpers to do some decoding/fetching below-->
        <script src="${pageContext.request.contextPath}/js/libxml.js"></script>
        <style>
            pre{margin:0;}
            pre.error{color:#f00;}
            pre.warning{color:#FFC500;}
            .s-button, .abp .button{
                display:block; border:1px solid #f88; padding:8px 6px 8px 6px; 
                background:#000; color:#f88; float:left;
                -moz-user-select: none;
                -khtml-user-select: none; 
                -webkit-user-select: none; 
                -o-user-select: none; 
                user-select: none; 
                cursor:default;
            }
            .s-button:hover,.abp .button:hover{background:#f88; color:#000;}
        </style>
        <!-- Scripting Extensions -->
        <script src="${pageContext.request.contextPath}/corelib/scripting/Host.js"></script>

        <title>弹幕演示</title>
    </head>
    <body>
        <div id="player-unit" style="width:100%;clear:both;">
            <div class="m20 abp" id="player" style="height:100%;">
                <div id="commentCanvas" class="container"></div>
                <video id="abpVideo" autobuffer="true" data-setup="{}" width="100%" height="100%" style="z-index:-1;width:100%;height:100%;top:0;left:0;right:0;bottom:0;" preload="auto">
                </video>
            </div>
            <div class="controls">
                <a class="button" onclick="load('kanpai.xml');" href="javascript:;">Start</a>
                <a class="button" onclick="stop();" href="javascript:;">Stop</a>
                <a class="button" onclick="resume();" href="javascript:;">Resume</a>
                <div style="clear:both;"></div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <script>
            var isWindowedFullscreen = false;
            function launchFullScreen() {
                alert("full screen");
                element = $("#player-unit");
                cm.setBounds();
                element.width = window.innerWidth;
                if (element.requestFullscreen) {
                    element.requestFullscreen();
                } else if (element.mozRequestFullscreen) {
                    element.mozRequestFullscreen();
                } else if (element.webkitRequestFullscreen) {
                    element.webkitRequestFullscreen();
                }
            }

            function launchWindowFull(element) {
                if (!isWindowedFullscreen) {
                    element.style.position = "fixed";
                    element.style.top = "0";
                    element.style.bottom = "0";
                    element.style.left = "0";
                    element.style.right = "0";
                    element.style.width = "auto";
                    element.style.height = "auto";
                } else {
                    element.style.position = "";
                    element.style.top = "";
                    element.style.bottom = "";
                    element.style.left = "";
                    element.style.right = "";
                }
                cm.getBounds();
                isWindowedFullscreen = !isWindowedFullscreen;
            }

            var cm = new CommentManager($('commentCanvas'));
            var bscripter = new CCLScripting("${pageContext.request.contextPath}/corelib/scripting/Worker.js");
            bscripter.logger = new function () {
                this.log = function (t) {
                    var pre = document.createElement("pre");
                    pre.textContent = "[" + (window.playhead / 1000) + "] " + t.toString();
                    $("debug-console").appendChild(pre);
                    while ($("debug-console").children.length > 200) {
                        $("debug-console").removeChild($("debug-console").children[0]);
                    }
                    $("debug-console").scrollTop = 100000;
                };
                this.error = function (t) {
                    var pre = document.createElement("pre");
                    pre.textContent = "[" + (window.playhead / 1000) + "] " + t.toString();
                    pre.className = "error";
                    $("debug-console").appendChild(pre);
                    while ($("debug-console").children.length > 200) {
                        $("debug-console").removeChild($("debug-console").children[0]);
                    }
                    $("debug-console").scrollTop = 100000;
                };
                this.warn = function (t) {
                    var pre = document.createElement("pre");
                    pre.textContent = "[" + (window.playhead / 1000) + "] " + t.toString();
                    pre.className = "warning";
                    $("debug-console").appendChild(pre);
                    while ($("debug-console").children.length > 200) {
                        $("debug-console").removeChild($("debug-console").children[0]);
                    }
                    $("debug-console").scrollTop = 100000;
                };
            };
            cm.scripting = bscripter.getSandbox($("commentCanvas"));
            cm.init();

            var tmr = 0;
            var start = 0;
            var playhead = 0, lasthead = 0;

            function timeupdate() {
                playhead = new Date().getTime() - start;
                cm.time(playhead);
                if (cm.scripting && playhead - lasthead > 300) {
                    ;
                    cm.scripting.send("Update:TimeUpdate", {
                        "state": "playing",
                        "time": playhead
                    });
                    lasthead = playhead;
                }
            }

            function load(dmf, dmfmd) {
                if (dmfmd == null)
                    dmfmd = 'bilibili';
                cm.clear();
                start = 0;
                try {
                    clearTimeout(tmr);
                } catch (e) {
                }
                CommentLoader(dmf, cm, dmfmd);
                cm.startTimer();
                start = new Date().getTime();
                lasthead = playhead;
                tmr = setInterval(timeupdate, 42);
            }
            function stop() {
                cm.stopTimer();
                if (cm.scripting) {
                    cm.scripting.send("Update:TimeUpdate", {
                        "state": "pause",
                        "time": playhead
                    });
                }
                clearTimeout(tmr);
            }
            function resume() {
                cm.startTimer();
                start = new Date().getTime() - playhead;
                lasthead = playhead;
                tmr = setInterval(timeupdate, 42);
            }
        </script>
    </body>
</html>

