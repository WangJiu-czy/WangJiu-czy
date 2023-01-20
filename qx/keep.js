if ($response.body!==undefined){
    body=$response.body

    body=body.replace(/\s*/g,"")
    body =body.replace(/\"username\":".*?"/g,`"username":"枉久解锁"`)
    body=body.replace(/\"memberStatus\":\d+/g,`"memberStatus":1`)
    body=body.replace(/\"buttonText\:.*?"/,"已永久")
    body=body.replace(/\"status\":\w+/g,`"status":true`)
    body=body.replace(/\"errorCode\":\d+/g,`"errorCode":0`)
    body=body.replace(/\"videoTime\":\d+/g,`"videoTime":3000`)
    var resp=JSON.parse(body)
    if (resp["data"]!==undefined && resp["data"]["permissions"]!==undefined){
        let vip=resp["data"]["permissions"]

        for (let key in vip){
            vip[key]["status"]=true
        }
        $response.body=JSON.stringify(resp)
        $done($response)
    }
}else{
    $done($response)
}
