if (typeof $response !== "undefined" ){


        body = $response.body
        let obj = JSON.parse(body)   
				
				if(obj.check_finish!== "undefined"){
					delete obj.check_finish
					    body = JSON.stringify(obj)
              $done({body: body})
					}



} else{
   $done()
	}
