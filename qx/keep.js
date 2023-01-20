if ($response.body!==undefined){
    body=$response.body

    body=body.replace(/\s*/g,"")
    body =body.replace(/\"username\":".*?"/g,`"username":"枉久解锁"`)
    body=body.replace(/\"memberStatus\":\d+/g,`"memberStatus":1`)
    body=body.replace(/\"buttonText\:.*?"/,"已永久")
    body=body.replace(/\"status\":\w+/g,`"status":true`)
    body=body.replace(/\"errorCode\":\d+/g,`"errorCode":0`)
    body=body.replace(/\"videoTime\":\d+/g,`"videoTime":3000`)
    $done(body)
    
}else{
    $done()
}
