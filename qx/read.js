    let body = `
     <html>
      <head>
          <meta charset="UTF-8">
      </head>
      <style>
          div {position:absolute; top:50%; left:50%; margin:0 0 0 -234px; width:auto; height:auto; border:0px solid #008800; font-size: 7vw;}
      </style>
      <body bgcolor="#FFFFFF"><p p style="text-align: center;font-size:7vw;">🍅
🎃
☁️ </p><p style="text-align:right;font-size:7vw;"></p><div id="timer"></div></body>
      <script>
          var oBox= document.getElementById('timer');
          var maxtime = parseInt(Math.random() * (10 - 9 + 1) + 9 + 1, 11)- 4;
          setTimeout(()=>window.history.go(-1),maxtime*1050);
          function CountDown() {
              if (maxtime >= 0) {
                 oBox.innerHTML = '返回倒计时'+maxtime+'秒';
                  --maxtime;
              } else{
                  clearInterval(timer);
                  window.history.back();
//window.history.go(-1);
  
              }
          }
          timer = setInterval("CountDown()", 1000);
        </script>
      </html>
      `
      const headers = {
        "Connection": "keep-alive",
        'Content-Type': 'text/html; charset=utf-8'
      };
        $done({status: 'HTTP/1.1 200 OK', headers, body})

   
