if ($response.body!==undefined){
    
    var resp=JSON.parse(body)
    if (resp["data"]!==undefined && resp["data"]["permissions"]!==undefined){
        let vip=resp["data"]["permissions"]
    resp["data"]["username"]="枉久解锁"
    for (let key in vip){
        vip[key]["status"]=true
    }
      $response.body=JSON.stringify(resp)
        
    }
}
    

$done($response.body)



