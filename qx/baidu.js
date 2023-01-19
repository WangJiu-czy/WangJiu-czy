if ($response.body) {
    $done({
        body: JSON.stringify({
            "product_infos": [{
                "product_id": "5310897792128633390",
                "start_time": 1640966400,
                "end_time": 2147483648,
                "buy_time": "1640966400",
                "cluster": "offlinedl",
                "detail_cluster": "offlinedl",
                "product_name": "gz_telecom_exp"
            }, {
                "product_name": "svip2_nd",
                "product_description": "超级会员",
                "function_num": 0,
                "start_time": 1674050066,
                "buy_description": "",
                "buy_time": 0,
                "product_id": "1",
                "auto_upgrade_to_svip": 0,
                "end_time": 2051193600,
                "cluster": "vip",
                "detail_cluster": "svip",
                "status": 0
            }],
            "currenttime": 1674060077,
            "reminder": {
                "reminderWithContent": [],
                "advertiseContent": []
            },
            "request_id": 417454661724952320
        })
    });
} else {
    $done({});
}