# MyFootball
仿懂球帝IOS客户端
持续更新中……


#
接口统计  

#首页 https://api.dongqiudi.com/app/tabs/iphone/1.json?mark=gif
    {
        id 文章id
        title 标题
        share_title 分享标题
        comment_total 评论数
        share 文章链接
        thumb 列表图片
        top 
        top_color
        url 文章在app webView打开的链接
        scheme 推送统一跳转标识
        is_video 是否是视频 （列表图片显示播放标志）
        collcetion_type
        add_to_tab
        show_comments
        publish_at 发布时间
        sort_timestamp 时间戳
        channel 分类   =》feed article video 
        label 右下角分类
        label_color 颜色
        cover =》pic ：整个cell的图片
        album 
            total 总张数
            pics [显示的三张]
        author: {
            name: 仰卧撑足球,
            user_id: 2956374,
            level: normal,
            medal_url: 
        },
        extend =》cover album 
    }

        ad: [
        {
        id: 321787,
        title: 不是信用卡，额度竟有10万，你不来一张？,
        share_title: 不是信用卡，额度竟有10万，你不来一张？,
        description: ,
        comments_total: 0,
        share: https://www.dongqiudi.com/article/321787,
        thumb: http://img1.dongqiudi.com/fastdfs1/M00/68/91/180x135/crop/-/pIYBAFkC7SGAIl17AAAVFPAajKI15.jpeg,
        slide_thumb: http://img1.dongqiudi.com/fastdfs1/M00/68/91/640x400/-/-/pIYBAFkC7SGAIl17AAAVFPAajKI15.jpeg,
        top: false,
        top_color: ,
        url: https://ultimavip.cn/m/lposter.html?source=dqd_0429_t_lposter,
        url1: https://ultimavip.cn/m/lposter.html?source=dqd_0429_t_lposter,
        scheme: https://ultimavip.cn/m/lposter.html?source=dqd_0429_t_lposter,
        is_video: false,
        collection_type: null,
        pid: 0,
        add_to_tab: null,
        show_comments: false,
        published_at: 2017-04-28 15:20:03,
        sort_timestamp: 1493364003,
        redirect: true,
        channel: article,
        position: 8,
        is_ad: true,
        ad_id: 20170428152003688398,
        label_color: #deb929,
        label: 广告
        },
        {
        id: 321891,
        title: 为运动而生，酷爽一夏！阿迪洗护全新系列折扣/买赠进行中,
        share_title: 为运动而生，酷爽一夏！阿迪洗护全新系列折扣/买赠进行中,
        description: ,
        comments_total: 42,
        share: https://www.dongqiudi.com/article/321891,
        thumb: http://img1.dongqiudi.com/fastdfs1/M00/68/A2/180x135/crop/-/pIYBAFkDDgqASHP5AAAu-YG19bk213.jpg,
        slide_thumb: http://img1.dongqiudi.com/fastdfs1/M00/68/A2/640x400/-/-/pIYBAFkDDgqASHP5AAAu-YG19bk213.jpg,
        top: false,
        top_color: ,
        url: https://api.dongqiudi.com/article/321891.html,
        url1: https://api.dongqiudi.com/article/321891.html,
        scheme: dongqiudi:///news/321891,
        is_video: false,
        collection_type: null,
        pid: 0,
        add_to_tab: 0,
        show_comments: true,
        published_at: 2017-04-28 17:56:01,
        sort_timestamp: 1493373361,
        channel: article,
        label: ,
        label_color: ,
        position: 14,
        is_ad: true,
        ad_id: 20170428182708324293
        }
        ]

比赛直播 https://api.dongqiudi.com/data/index 
        [
            {
                relate_type: match,
                relate_id: 2413219,
                match_id: 2413219,
                team_A_id: 425,
                team_A_name: 广州富力,
                team_A_logo: http://img.dongqiudi.com/data/pic/425.png,
                team_B_id: 18584,
                team_B_name: 贵州恒丰智诚,
                team_B_logo: http://img.dongqiudi.com/data/pic/18584.png,
                date_utc: 2017-04-28,
                time_utc: 11:35:00,
                start_play: 2017-04-28 11:35:00,
                status: Played,
                fs_A: 1,
                fs_B: 3,
                ps_A: ,
                ps_B: ,
                ets_A: ,
                ets_B: ,
                as_A: 1,
                as_B: 3,
                gameweek: 7,
                suretime: 1,
                playing_time: 90,
                competition_id: 51,
                competition_name: 中超,
                TVList: 广东体育,贵州大众,青海卫视,聚力体育,
                videoFlag: true,
                webLivingFlag: true
            },
            {
                relate_type: match,
                relate_id: 2306084,
                match_id: 2306084,
                team_A_id: 1255,
                team_A_name: 亚特兰大,
                team_A_logo: http://img.dongqiudi.com/data/pic/1255.png,
                team_B_id: 1242,
                team_B_name: 尤文图斯,
                team_B_logo: http://img.dongqiudi.com/data/pic/1242.png,
                date_utc: 2017-04-28,
                time_utc: 18:45:00,
                start_play: 2017-04-28 18:45:00,
                status: Played,
                fs_A: 2,
                fs_B: 2,
                ps_A: ,
                ps_B: ,
                ets_A: ,
                ets_B: ,
                as_A: 2,
                as_B: 2,
                gameweek: 34,
                suretime: 1,
                playing_time: 90,
                competition_id: 13,
                competition_name: 意甲,
                TVList: 网络直播,
                videoFlag: true,
                webLivingFlag: true
                }
        ]

#热门 https://api.dongqiudi.com/app/tabs/iphone/104.json?mark=gif&version=500
{
"id": 104,
"label": "热门",
"prev": "https://api.dongqiudi.com/app/tabs/iphone/104.json?before=1493395369&mark=gif&version=500",
"next": "https://api.dongqiudi.com/app/tabs/iphone/104.json?after=1264.1493354324&page=2&mark=gif&version=500&version=500",
"max": 1493395369,
"min": 1264,
"page": 1,
"contents": [
{
"day": "2017-04-29",
"articles": [
{
"id": 322061,
"title": "前拜仁新闻官：瓜迪奥拉是天才，比拜仁所有主帅都出色",
"share_title": "前拜仁新闻官：瓜迪奥拉是天才，比拜仁所有主帅都出色",
"description": "",
"comments_total": 597,
"share": "https://www.dongqiudi.com/article/322061",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/87/180x135/crop/-/o4YBAFkDZQeALZv0AAMa3cy73S8279.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/article/322061.html?from=tab_104",
"url1": "https://api.dongqiudi.com/article/322061.html?from=tab_104",
"scheme": "dongqiudi:///news/322061",
"is_video": false,
"collection_type": null,
"add_to_tab": "0",
"show_comments": true,
"published_at": "2017-04-29 00:02:49",
"sort_timestamp": 1493395369,
"channel": "article"
},

]
},
{
"day": "2017-04-28",
"articles": [
{
"id": 321703,
"title": "曼市德比复盘：平局为穆帅带来欧战新启示",
"share_title": "曼市德比复盘：平局为穆帅带来欧战新启示",
"description": null,
"comments_total": 534,
"share": "https://www.dongqiudi.com/article/321703",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/18/180x135/crop/-/o4YBAFkCo1GAeT3jAAEX7xMn2Ko433.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/321703.html?from=tab_104",
"url1": "https://api.dongqiudi.com/v2/feed/321703.html?from=tab_104",
"scheme": "dongqiudi:///feed/321703",
"is_video": false,
"collection_type": null,
"add_to_tab": "0",
"show_comments": true,
"published_at": "2017-04-28 17:08:33",
"sort_timestamp": 1493370513,
"author": {
"name": "刘强专栏",
"user_id": "2536493",
"level": "normal",
"medal_url": ""
},
"channel": "feed",
"label": "深度",
"label_color": "#4782c4"
},
{
"id": 321710,
"title": "梅西：除了齐祖从不主动换球衣",
"share_title": "梅西：除了齐祖从不主动换球衣",
"description": "梅西表示，职业生涯中只主动交换过一次球衣，那个人是齐达内。",
"comments_total": 1337,
"share": "https://www.dongqiudi.com/article/321710",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/68/6F/180x135/crop/-/pIYBAFkCrTiADnTSAAFRzvBr_fs751.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/article/321710.html?from=tab_104",
"url1": "https://api.dongqiudi.com/article/321710.html?from=tab_104",
"scheme": "dongqiudi:///news/321710",
"is_video": false,
"collection_type": null,
"add_to_tab": "0",
"show_comments": true,
"published_at": "2017-04-28 10:53:32",
"sort_timestamp": 1493348012,
"channel": "article"
}
]
}
]
}

#圈子 https://api.dongqiudi.com/app/tabs/topics.json
{
"id": 66,
"label": "圈子",
"prev": null,
"next": "https://api.dongqiudi.com/app/tabs/topics.json?after=2",
"articles": [
{
"id": "7240364",
"title": "【盖楼发红包】助威华夏队！",
"comments_total": 22,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/TDNAubnvZo2YvFcvguQ5.jpg!litpic",
"published_at": "2017-04-29 10:49:36",
"url": "dongqiudi:///article/7240364",
"url1": "dongqiudi:///article/7240364",
"channel": "topic",
"topic": {
"id": "7240364",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/TDNAubnvZo2YvFcvguQ5.jpg!litpic",
"content": "【盖楼发红包】助威华夏队！",
"group": {
"id": "104",
"title": "河北华夏幸福圈"
},
"author": {
"id": 1694923,
"username": "花少87"
}
}
},
{
"id": "7240166",
"title": "昨天问各位老哥老姐，取名，我觉得柏筱雯。柏晨瑞。你们觉得哪个比较好。出院",
"comments_total": 22,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/qUhstH80J9JL7IaukSg3.jpg!litpic",
"published_at": "2017-04-29 10:38:55",
"url": "dongqiudi:///article/7240166",
"url1": "dongqiudi:///article/7240166",
"channel": "topic",
"topic": {
"id": "7240166",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/qUhstH80J9JL7IaukSg3.jpg!litpic",
"content": "昨天问各位老哥老姐，取名，我觉得柏筱雯。柏晨瑞。你们觉得哪个比较好。出院",
"group": {
"id": "177",
"title": "贵州恒丰智诚圈"
},
"author": {
"id": 3162696,
"username": "一缕阳光向眼眸倾泻a"
}
}
},
{
"id": "7237111",
"title": "为什么为什么为什么？山哥战术体系不是安排的挺好吗😭",
"comments_total": 31,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/eFfgnpXwWRkgbiZdvwkG.jpg!litpic",
"published_at": "2017-04-29 07:43:25",
"url": "dongqiudi:///article/7237111",
"url1": "dongqiudi:///article/7237111",
"channel": "topic",
"topic": {
"id": "7237111",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/eFfgnpXwWRkgbiZdvwkG.jpg!litpic",
"content": "为什么为什么为什么？山哥战术体系不是安排的挺好吗😭",
"group": {
"id": "177",
"title": "贵州恒丰智诚圈"
},
"author": {
"id": 1368084,
"username": "xieningyu"
}
}
},
{
"id": "7229956",
"title": "如果让我弟弟知道我把他这张图发上来了会怎么样？他怎么会有我这么一个姐姐",
"comments_total": 22,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/28/bE2XvqVUIJuYQmEB3LBw.jpg!litpic",
"published_at": "2017-04-28 21:29:42",
"url": "dongqiudi:///article/7229956",
"url1": "dongqiudi:///article/7229956",
"channel": "topic",
"topic": {
"id": "7229956",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/28/bE2XvqVUIJuYQmEB3LBw.jpg!litpic",
"content": "如果让我弟弟知道我把他这张图发上来了会怎么样？他怎么会有我这么一个姐姐",
"group": {
"id": "178",
"title": "天津权健圈"
},
"author": {
"id": 2505364,
"username": "沿铮姐姐"
}
}
},
{
"id": "7235200",
"title": "欧冠半决赛踢摩纳哥，为尤文加油",
"comments_total": 27,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/3gYCPScYw4xRyuGLcbgx.jpg!litpic",
"published_at": "2017-04-29 01:51:16",
"url": "dongqiudi:///article/7235200",
"url1": "dongqiudi:///article/7235200",
"channel": "topic",
"topic": {
"id": "7235200",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/3gYCPScYw4xRyuGLcbgx.jpg!litpic",
"content": "欧冠半决赛踢摩纳哥，为尤文加油",
"group": {
"id": "22",
"title": "尤文图斯圈"
},
"author": {
"id": 1967988,
"username": "固态瞬间"
}
}
},
{
"id": "7232253",
"title": "鸟都已经说要上途安则比了，这个谁和他搭档呢？",
"comments_total": 14,
"thumb": "http://img.dongqiudi.com/uploads/group/yK2jcd46VdfltEj7.png",
"published_at": "2017-04-28 23:04:13",
"url": "dongqiudi:///article/7232253",
"url1": "dongqiudi:///article/7232253",
"channel": "topic",
"topic": {
"id": "7232253",
"thumb": "http://img.dongqiudi.com/uploads/group/yK2jcd46VdfltEj7.png",
"content": "鸟都已经说要上途安则比了，这个谁和他搭档呢？",
"group": {
"id": "14",
"title": "曼联圈"
},
"author": {
"id": 2650868,
"username": "沃克莱文"
}
}
},
{
"id": "7231457",
"title": "今天我女儿出生。贵州首胜。真是个好日子。",
"comments_total": 98,
"thumb": "http://img.dongqiudi.com/uploads/group/ItbhUq3m7jSXR37p.jpg",
"published_at": "2017-04-28 22:25:29",
"url": "dongqiudi:///article/7231457",
"url1": "dongqiudi:///article/7231457",
"channel": "topic",
"topic": {
"id": "7231457",
"thumb": "http://img.dongqiudi.com/uploads/group/ItbhUq3m7jSXR37p.jpg",
"content": "今天我女儿出生。贵州首胜。真是个好日子。",
"group": {
"id": "177",
"title": "贵州恒丰智诚圈"
},
"author": {
"id": 3162696,
"username": "一缕阳光向眼眸倾泻a"
}
}
},
{
"id": "7231264",
"title": "如果下一轮贵州恒丰再把上海上港搞翻？？",
"comments_total": 25,
"thumb": "http://img.dongqiudi.com/uploads/group/7w2Wk8b1Ijqc8F1V.png",
"published_at": "2017-04-28 22:18:07",
"url": "dongqiudi:///article/7231264",
"url1": "dongqiudi:///article/7231264",
"channel": "topic",
"topic": {
"id": "7231264",
"thumb": "http://img.dongqiudi.com/uploads/group/7w2Wk8b1Ijqc8F1V.png",
"content": "如果下一轮贵州恒丰再把上海上港搞翻？？",
"group": {
"id": "6",
"title": "广州恒大圈"
},
"author": {
"id": 3009325,
"username": "杨战"
}
}
},
{
"id": "7230424",
"title": "破处啦   啦啦啦",
"comments_total": 72,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/28/fwJdVzs7i4Bgv90JCMob.png!litpic",
"published_at": "2017-04-28 21:43:42",
"url": "dongqiudi:///article/7230424",
"url1": "dongqiudi:///article/7230424",
"channel": "topic",
"topic": {
"id": "7230424",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/28/fwJdVzs7i4Bgv90JCMob.png!litpic",
"content": "破处啦   啦啦啦",
"group": {
"id": "177",
"title": "贵州恒丰智诚圈"
},
"author": {
"id": 839845,
"username": "客居你家"
}
}
},
{
"id": "7230416",
"title": "果然还是不要上切里，因为智诚队里和切里技术一样和比切里技术还要好的球员很多，我觉得切里就是渣子",
"comments_total": 97,
"thumb": "http://img.dongqiudi.com/uploads/group/ItbhUq3m7jSXR37p.jpg",
"published_at": "2017-04-28 21:43:20",
"url": "dongqiudi:///article/7230416",
"url1": "dongqiudi:///article/7230416",
"channel": "topic",
"topic": {
"id": "7230416",
"thumb": "http://img.dongqiudi.com/uploads/group/ItbhUq3m7jSXR37p.jpg",
"content": "果然还是不要上切里，因为智诚队里和切里技术一样和比切里技术还要好的球员很多，我觉得切里就是渣子",
"group": {
"id": "177",
"title": "贵州恒丰智诚圈"
},
"author": {
"id": 1730392,
"username": "智诚球迷"
}
}
},
{
"id": "7233453",
"title": "足协又出手了",
"comments_total": 14,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/OVGiQQ07Fd5Q2TtAYMTu.jpg!litpic",
"published_at": "2017-04-29 00:09:06",
"url": "dongqiudi:///article/7233453",
"url1": "dongqiudi:///article/7233453",
"channel": "topic",
"topic": {
"id": "7233453",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/OVGiQQ07Fd5Q2TtAYMTu.jpg!litpic",
"content": "足协又出手了",
"group": {
"id": "102",
"title": "武汉卓尔圈"
},
"author": {
"id": 1327124,
"username": "黄煌皇"
}
}
},
{
"id": "7232645",
"title": "对不起，让所有关心我们的球迷们失望了。正如主教练赛后所说的，我们未能掌控比赛。队员们还是保持了一向的",
"comments_total": 161,
"thumb": "http://img.dongqiudi.com/uploads/group/MoImlcRMBiEq0Kij.png",
"published_at": "2017-04-28 23:25:48",
"url": "dongqiudi:///article/7232645",
"url1": "dongqiudi:///article/7232645",
"channel": "topic",
"topic": {
"id": "7232645",
"thumb": "http://img.dongqiudi.com/uploads/group/MoImlcRMBiEq0Kij.png",
"content": "对不起，让所有关心我们的球迷们失望了。正如主教练赛后所说的，我们未能掌控比赛。队员们还是保持了一向的",
"group": {
"id": "82",
"title": "广州富力圈"
},
"author": {
"id": 2535564,
"username": "盛华"
}
}
},
{
"id": "7238247",
"title": "我恒的球迷们，日照有什么好玩的地方吗？我要去旅游给推荐几处。谢谢了",
"comments_total": 10,
"thumb": "http://img.dongqiudi.com/uploads/group/7w2Wk8b1Ijqc8F1V.png",
"published_at": "2017-04-29 08:50:03",
"url": "dongqiudi:///article/7238247",
"url1": "dongqiudi:///article/7238247",
"channel": "topic",
"topic": {
"id": "7238247",
"thumb": "http://img.dongqiudi.com/uploads/group/7w2Wk8b1Ijqc8F1V.png",
"content": "我恒的球迷们，日照有什么好玩的地方吗？我要去旅游给推荐几处。谢谢了",
"group": {
"id": "6",
"title": "广州恒大圈"
},
"author": {
"id": 1673424,
"username": "蝈蝈啊"
}
}
},
{
"id": "7231224",
"title": "对于动漫发展历程的一些思考",
"comments_total": 38,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/28/lgws4eC7NZcopnBdaJld.jpg!litpic",
"published_at": "2017-04-28 22:16:25",
"url": "dongqiudi:///article/7231224",
"url1": "dongqiudi:///article/7231224",
"channel": "topic",
"topic": {
"id": "7231224",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/28/lgws4eC7NZcopnBdaJld.jpg!litpic",
"content": "对于动漫发展历程的一些思考",
"group": {
"id": "166",
"title": "二次元圈"
},
"author": {
"id": 585624,
"username": "7800-Fahrenheit"
}
}
},
{
"id": "7230836",
"title": "分享图片",
"comments_total": 31,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/28/zlkOgWY7stflExPFeFwj.jpg!litpic",
"published_at": "2017-04-28 21:58:26",
"url": "dongqiudi:///article/7230836",
"url1": "dongqiudi:///article/7230836",
"channel": "topic",
"topic": {
"id": "7230836",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/28/zlkOgWY7stflExPFeFwj.jpg!litpic",
"content": "分享图片",
"group": {
"id": "166",
"title": "二次元圈"
},
"author": {
"id": 2305084,
"username": "LyNnJeR"
}
}
},
{
"id": "7240375",
"title": "这是什么情况",
"comments_total": 5,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/MSKPHrQL0MfvpL1rJXte.jpg!litpic",
"published_at": "2017-04-29 10:50:15",
"url": "dongqiudi:///article/7240375",
"url1": "dongqiudi:///article/7240375",
"channel": "topic",
"topic": {
"id": "7240375",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/MSKPHrQL0MfvpL1rJXte.jpg!litpic",
"content": "这是什么情况",
"group": {
"id": "45",
"title": "FM圈"
},
"author": {
"id": 2560657,
"username": "Sameaslame"
}
}
},
{
"id": "7240140",
"title": "都快成明灯了",
"comments_total": 6,
"thumb": "http://img.dongqiudi.com/uploads/group/yR2UAlsR3pztLenY.png",
"published_at": "2017-04-29 10:37:54",
"url": "dongqiudi:///article/7240140",
"url1": "dongqiudi:///article/7240140",
"channel": "topic",
"topic": {
"id": "7240140",
"thumb": "http://img.dongqiudi.com/uploads/group/yR2UAlsR3pztLenY.png",
"content": "都快成明灯了",
"group": {
"id": "225",
"title": "中超竞猜圈"
},
"author": {
"id": 3299748,
"username": "仉督维军谮"
}
}
},
{
"id": "7240131",
"title": "太黑了，还是戒了吧",
"comments_total": 7,
"thumb": "http://img.dongqiudi.com/uploads/group/vctyvq2trHE52gdT.jpg",
"published_at": "2017-04-29 10:37:15",
"url": "dongqiudi:///article/7240131",
"url1": "dongqiudi:///article/7240131",
"channel": "topic",
"topic": {
"id": "7240131",
"thumb": "http://img.dongqiudi.com/uploads/group/vctyvq2trHE52gdT.jpg",
"content": "太黑了，还是戒了吧",
"group": {
"id": "371",
"title": "戒赌圈"
},
"author": {
"id": 3299748,
"username": "仉督维军谮"
}
}
},
{
"id": "7237538",
"title": "缺兵少将，对阵斯旺西阵容猜想",
"comments_total": 7,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/raHo5jzM0FIqWvrmk435.jpg!litpic",
"published_at": "2017-04-29 08:08:51",
"url": "dongqiudi:///article/7237538",
"url1": "dongqiudi:///article/7237538",
"channel": "topic",
"topic": {
"id": "7237538",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/raHo5jzM0FIqWvrmk435.jpg!litpic",
"content": "缺兵少将，对阵斯旺西阵容猜想",
"group": {
"id": "14",
"title": "曼联圈"
},
"author": {
"id": 99795,
"username": "casvinas"
}
}
},
{
"id": "7236519",
"title": "是时候到了吧[感动][感动]",
"comments_total": 10,
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/syl1Uj1OzrWuF9QCKRHp.jpg!litpic",
"published_at": "2017-04-29 06:58:30",
"url": "dongqiudi:///article/7236519",
"url1": "dongqiudi:///article/7236519",
"channel": "topic",
"topic": {
"id": "7236519",
"thumb": "http://img.dongqiudi.com/uploads/attachments/2017/04/29/syl1Uj1OzrWuF9QCKRHp.jpg!litpic",
"content": "是时候到了吧[感动][感动]",
"group": {
"id": "13",
"title": "皇家马德里圈"
},
"author": {
"id": 1886729,
"username": "Zulpikar617"
}
}
}
]
}

#懂球号 https://feed.dongqiudi.com/tab/tab_index

{
"code": 0,
"message": "",
"data": {
"account_list": {
"title": "热门推荐",
"jump_title": "更多",
"jump_scheme": "dongqiudi:///feed/account_tab",
"jump_url": "http://feed.dongqiudi.com/account/account_tabs",
"list": [
{
"qr_code_path": "/fastdfs1/M00/19/C6/pIYBAFi-HmKAKGmqAABxvz8BxNA352.png",
"name": "足球漫画",
"pinyin": "",
"auth_time": null,
"bg_qr_code_path": "/fastdfs1/M00/19/C6/pIYBAFi-HmKAX72KAACwqWx2lLo898.png",
"icon": "http://img1.dongqiudi.com/fastdfs1/M00/19/B9/pIYBAFi-GfGAGDVBAACw6R4p9sk061_320_320.jpg",
"bg_image": "http://img1.dongqiudi.com/fastdfs1/M00/4D/F4/o4YBAFjcfCKAAs5TAABBJiObDhM252_578_1126.jpg",
"comment_total": "4529",
"reward": "1",
"level": "normal",
"intro": "给球迷们提供有趣的足球漫画，爱足球爱分享^_^",
"user_id": "3118100",
"status": "1",
"medal_url": ""
},
{
"qr_code_path": "/fastdfs/M00/11/3E/ooYBAFhtwPCAHqs1AAByV5G9Suw635.png",
"name": "仰卧撑足球",
"pinyin": "",
"auth_time": null,
"bg_qr_code_path": "/fastdfs/M00/11/3E/ooYBAFhtwPCAejiDAAC0XQkD2cw188.png",
"icon": "http://img1.dongqiudi.com/fastdfs1/M00/18/45/pIYBAFi9bmuAIqZNAABz2oMJ9fw299_320_320.jpg",
"bg_image": "http://img1.dongqiudi.com/fastdfs/M00/F0/E1/ooYBAFivniyAHoScAAHGvc4BvDw927_578_1126.jpg",
"comment_total": "37036",
"reward": null,
"level": "normal",
"intro": "《足球俱乐部》合作自媒体，关注微信公众号：仰卧撑",
"user_id": "2956374",
"status": "1",
"medal_url": ""
},
{
"qr_code_path": "/fastdfs/M00/EA/18/ooYBAFitAeOACvyFAABw4d7Wk7A902.png",
"name": "云龙聊球",
"pinyin": "",
"auth_time": null,
"bg_qr_code_path": "/fastdfs/M00/EA/18/ooYBAFitAeSAAI22AAC1joS1mgc721.png",
"icon": "http://img1.dongqiudi.com/fastdfs/M00/E9/C7/oYYBAFis35yAAkoqAACt4R31z2g206_320_320.jpg",
"bg_image": "http://img1.dongqiudi.com/fastdfs/M00/E9/C9/oYYBAFis4EmAAz0KAAEvaeqb43g452_578_1126.jpg",
"comment_total": "3808",
"reward": null,
"level": "normal",
"intro": "畅聊足球世界的精彩！更多精彩微信公众号:云龙聊球",
"user_id": "3065787",
"status": "1",
"medal_url": ""
},
{
"qr_code_path": "/fastdfs/M00/10/95/oYYBAFhmLzyAaa9NAACNQHHU2-M539.png",
"name": "广州富力足球俱乐部",
"pinyin": "",
"auth_time": "2016-08-17 14:29:15",
"bg_qr_code_path": "/fastdfs/M00/10/95/oYYBAFhmLzyAA2EcAADOkjgJc6Y898.png",
"icon": "http://img1.dongqiudi.com/fastdfs/M00/03/2F/oYYBAFe0AN-AbqV9AAKDAmOle9E304_320_320.png",
"bg_image": "http://img1.dongqiudi.com/fastdfs1/M00/67/F4/pIYBAFkBxxiAUWkXAAXWRewmdwM886_578_1126.jpg",
"comment_total": "14678",
"reward": null,
"level": "official",
"intro": "发布比赛信息，球迷活动信息，球队新闻等。",
"user_id": "2554339",
"status": "1",
"medal_url": "http://img1.dongqiudi.com/fastdfs1/M00/63/B3/o4YBAFj5pYKAetOzAAAGhNXa-yY637.png"
}
]
},
"article_list": {
"list": [
{
"id": 322158,
"title": "西布朗比赛日：英超第35轮 西布朗-莱斯特 22:00",
"share_title": "西布朗比赛日：英超第35轮 西布朗-莱斯特 22:00",
"description": null,
"comments_total": 0,
"share": "https://www.dongqiudi.com/article/322158",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/CC/180x135/crop/-/o4YBAFkEAyWAW5h0AADNIsH8yGs902.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322158.html",
"url1": "https://api.dongqiudi.com/v2/feed/322158.html",
"scheme": "dongqiudi:///feed/322158",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "2782941",
"author": {
"name": "西布朗足球俱乐部",
"level": "official",
"medal_url": "http://img1.dongqiudi.com/fastdfs1/M00/63/B3/o4YBAFj5pYKAetOzAAAGhNXa-yY637.png",
"user_id": "2782941"
},
"published_at": "2017-04-29 11:07:07",
"sort_timestamp": 1493435227,
"channel": "feed"
},
{
"id": 322156,
"title": "用足球温暖自闭症儿童！",
"share_title": "用足球温暖自闭症儿童！",
"description": null,
"comments_total": 0,
"share": "https://www.dongqiudi.com/article/322156",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/CB/180x135/crop/-/o4YBAFkEAdSAQ-U5AAF5mvt4XKE164.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322156.html",
"url1": "https://api.dongqiudi.com/v2/feed/322156.html",
"scheme": "dongqiudi:///feed/322156",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "3046507",
"author": {
"name": "球乡懂球",
"level": "normal",
"medal_url": "",
"user_id": "3046507"
},
"published_at": "2017-04-29 11:06:13",
"sort_timestamp": 1493435173,
"channel": "feed"
},
{
"id": 322154,
"title": "“超华杯”乡镇赛四轮后，雁洋镇领跑积分榜！",
"share_title": "“超华杯”乡镇赛四轮后，雁洋镇领跑积分榜！",
"description": null,
"comments_total": 0,
"share": "https://www.dongqiudi.com/article/322154",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/1B/180x135/crop/-/pIYBAFkEAM6AOLG5AAExk022vDQ975.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322154.html",
"url1": "https://api.dongqiudi.com/v2/feed/322154.html",
"scheme": "dongqiudi:///feed/322154",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "3046507",
"author": {
"name": "球乡懂球",
"level": "normal",
"medal_url": "",
"user_id": "3046507"
},
"published_at": "2017-04-29 10:58:09",
"sort_timestamp": 1493434689,
"channel": "feed"
},
{
"id": 322146,
"title": "爱“乒”才会赢！梅江环卫局队捧起冠军杯！",
"share_title": "爱“乒”才会赢！梅江环卫局队捧起冠军杯！",
"description": null,
"comments_total": 0,
"share": "https://www.dongqiudi.com/article/322146",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/C6/180x135/crop/-/o4YBAFkD-miALBzpAAmcEt0LQ70513.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322146.html",
"url1": "https://api.dongqiudi.com/v2/feed/322146.html",
"scheme": "dongqiudi:///feed/322146",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "3046507",
"author": {
"name": "球乡懂球",
"level": "normal",
"medal_url": "",
"user_id": "3046507"
},
"published_at": "2017-04-29 10:42:50",
"sort_timestamp": 1493433770,
"channel": "feed"
},
{
"id": 322140,
"title": "英伦传奇(十一)：伊普斯维奇，升班马奇迹",
"share_title": "英伦传奇(十一)：伊普斯维奇，升班马奇迹",
"description": null,
"comments_total": 10,
"share": "https://www.dongqiudi.com/article/322140",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/C4/180x135/crop/-/o4YBAFkD9maAa7vsAASNIQ2xeE0274.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322140.html",
"url1": "https://api.dongqiudi.com/v2/feed/322140.html",
"scheme": "dongqiudi:///feed/322140",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "2956374",
"author": {
"name": "仰卧撑足球",
"level": "normal",
"medal_url": "",
"user_id": "2956374"
},
"published_at": "2017-04-29 10:14:49",
"sort_timestamp": 1493432089,
"channel": "feed"
},
{
"id": 321834,
"title": "本来是曼彻斯特德比，为何斯托克城却背了黑锅？",
"share_title": "本来是曼彻斯特德比，为何斯托克城却背了黑锅？",
"description": null,
"comments_total": 32,
"share": "https://www.dongqiudi.com/article/321834",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/85/180x135/crop/-/o4YBAFkDYZmAZ51mAAUlst-tSpM313.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/321834.html",
"url1": "https://api.dongqiudi.com/v2/feed/321834.html",
"scheme": "dongqiudi:///feed/321834",
"is_video": true,
"collection_type": null,
"show_comments": true,
"user_id": "2549866",
"author": {
"name": "唯喔fanTV",
"level": "normal",
"medal_url": "",
"user_id": "2549866"
},
"published_at": "2017-04-29 10:11:03",
"sort_timestamp": 1493431863,
"channel": "feed",
"album": {
"total": 3,
"pics": [
"http://img1.dongqiudi.com/fastdfs1/M00/68/D7/180x135/crop/-/pIYBAFkDYiSAEy_LAAT8vtc1KwA935.jpg",
"http://img1.dongqiudi.com/fastdfs1/M00/69/85/180x135/crop/-/o4YBAFkDYZuAYbbIAAUMTm_edbU410.jpg",
"http://img1.dongqiudi.com/fastdfs1/M00/68/D6/180x135/crop/-/pIYBAFkDYemADvPXAATC7w_YmNM308.jpg"
]
},
"extend": [
"album"
]
},
{
"id": 322085,
"title": "沙佩科恩斯的漫漫重建之路",
"share_title": "沙佩科恩斯的漫漫重建之路",
"description": null,
"comments_total": 39,
"share": "https://www.dongqiudi.com/article/322085",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/68/E3/180x135/crop/-/pIYBAFkDcPmAZxzIAABqQaqXMcg372.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322085.html",
"url1": "https://api.dongqiudi.com/v2/feed/322085.html",
"scheme": "dongqiudi:///feed/322085",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "2956374",
"author": {
"name": "仰卧撑足球",
"level": "normal",
"medal_url": "",
"user_id": "2956374"
},
"published_at": "2017-04-29 10:03:31",
"sort_timestamp": 1493431411,
"channel": "feed",
"album": {
"total": 15,
"pics": [
"http://img1.dongqiudi.com/fastdfs1/M00/68/E5/180x135/crop/-/pIYBAFkDdBWAIqj3AAHMQBp48iE038.jpg",
"http://img1.dongqiudi.com/fastdfs1/M00/69/95/180x135/crop/-/o4YBAFkDdE2AMPQGAACrtg344-4410.jpg",
"http://img1.dongqiudi.com/fastdfs1/M00/69/95/180x135/crop/-/o4YBAFkDdJWAVtjBAADxZRT5ETE456.jpg"
]
},
"extend": [
"album"
]
},
{
"id": 320728,
"title": "足球战术基础：阵型的设置和变化",
"share_title": "足球战术基础：阵型的设置和变化",
"description": null,
"comments_total": 10,
"share": "https://www.dongqiudi.com/article/320728",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/BA/180x135/crop/-/o4YBAFkD562AMIrEAAINOgt81_s335.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/320728.html",
"url1": "https://api.dongqiudi.com/v2/feed/320728.html",
"scheme": "dongqiudi:///feed/320728",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "2551632",
"author": {
"name": "足球之路",
"level": "normal",
"medal_url": "",
"user_id": "2551632"
},
"published_at": "2017-04-29 09:40:53",
"sort_timestamp": 1493430053,
"channel": "feed"
},
{
"id": 322135,
"title": "热刺官宣下赛季入住温布利，白鹿巷谢幕演出将战曼联！",
"share_title": "热刺官宣下赛季入住温布利，白鹿巷谢幕演出将战曼联！",
"description": null,
"comments_total": 1,
"share": "https://www.dongqiudi.com/article/322135",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/0E/180x135/crop/-/pIYBAFkD7N6ATMgIAAD5jfWCF18673.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322135.html",
"url1": "https://api.dongqiudi.com/v2/feed/322135.html",
"scheme": "dongqiudi:///feed/322135",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "3118226",
"author": {
"name": "足球不过是个球",
"level": "normal",
"medal_url": "",
"user_id": "3118226"
},
"published_at": "2017-04-29 09:33:11",
"sort_timestamp": 1493429591,
"channel": "feed"
},
{
"id": 322128,
"title": "足球漫画：德赫亚立志加盟皇马的梦其实一直没变",
"share_title": "足球漫画：德赫亚立志加盟皇马的梦其实一直没变",
"description": null,
"comments_total": 275,
"share": "https://www.dongqiudi.com/article/322128",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/04/180x135/crop/-/pIYBAFkD2d2ASkt9AAClIwreHVY848.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322128.html",
"url1": "https://api.dongqiudi.com/v2/feed/322128.html",
"scheme": "dongqiudi:///feed/322128",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "3118100",
"author": {
"name": "足球漫画",
"level": "normal",
"medal_url": "",
"user_id": "3118100"
},
"published_at": "2017-04-29 08:36:13",
"sort_timestamp": 1493426173,
"channel": "feed",
"album": {
"total": 7,
"pics": [
"http://img1.dongqiudi.com/fastdfs1/M00/69/04/180x135/crop/-/pIYBAFkD2oaAP_9aAAClIwreHVY638.jpg",
"http://img1.dongqiudi.com/fastdfs1/M00/69/B3/180x135/crop/-/o4YBAFkD2uyAEQ7tAAGEShNDeAM539.jpg",
"http://img1.dongqiudi.com/fastdfs1/M00/69/B3/180x135/crop/-/o4YBAFkD2saAfc8KAAB6YD5Blp8123.jpg"
]
},
"extend": [
"album"
]
},
{
"id": 322120,
"title": "欧文-哈格里夫斯，随风飘扬的小卷毛，天妒英才的永动机",
"share_title": "欧文-哈格里夫斯，随风飘扬的小卷毛，天妒英才的永动机",
"description": null,
"comments_total": 93,
"share": "https://www.dongqiudi.com/article/322120",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/A9/180x135/crop/-/o4YBAFkDwO-AUPaDAAEgmG3zeZc257.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322120.html",
"url1": "https://api.dongqiudi.com/v2/feed/322120.html",
"scheme": "dongqiudi:///feed/322120",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "3065787",
"author": {
"name": "云龙聊球",
"level": "normal",
"medal_url": "",
"user_id": "3065787"
},
"published_at": "2017-04-29 06:47:59",
"sort_timestamp": 1493419679,
"channel": "feed",
"album": {
"total": 11,
"pics": [
"http://img1.dongqiudi.com/fastdfs1/M00/69/A9/180x135/crop/-/o4YBAFkDwO-AUPaDAAEgmG3zeZc257.jpg",
"http://img1.dongqiudi.com/fastdfs1/M00/69/A9/180x135/crop/-/o4YBAFkDwPeAZtwXAAFO7Q7hLuc534.jpg",
"http://img1.dongqiudi.com/fastdfs1/M00/69/A9/180x135/crop/-/o4YBAFkDwP2AMDscAAGCCLuosy8748.jpg"
]
},
"extend": [
"album"
]
},
{
"id": 322083,
"title": "图雷：热苏斯是球队至关重要的拼图之一",
"share_title": "图雷：热苏斯是球队至关重要的拼图之一",
"description": null,
"comments_total": 31,
"share": "https://www.dongqiudi.com/article/322083",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/98/180x135/crop/-/o4YBAFkDeViAUWU0AAJBWb9jHS8931.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322083.html",
"url1": "https://api.dongqiudi.com/v2/feed/322083.html",
"scheme": "dongqiudi:///feed/322083",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "3260453",
"author": {
"name": "曼城足球俱乐部",
"level": "official",
"medal_url": "http://img1.dongqiudi.com/fastdfs1/M00/63/B3/o4YBAFj5pYKAetOzAAAGhNXa-yY637.png",
"user_id": "3260453"
},
"published_at": "2017-04-29 01:29:27",
"sort_timestamp": 1493400567,
"channel": "feed"
},
{
"id": 322081,
"title": "西布朗赛前发布会：夏窗会有很多动作 但不至于换个活法",
"share_title": "西布朗赛前发布会：夏窗会有很多动作 但不至于换个活法",
"description": null,
"comments_total": 14,
"share": "https://www.dongqiudi.com/article/322081",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/68/E6/180x135/crop/-/pIYBAFkDdXCAQjmmAAPQLKAnT24342.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322081.html",
"url1": "https://api.dongqiudi.com/v2/feed/322081.html",
"scheme": "dongqiudi:///feed/322081",
"is_video": true,
"collection_type": null,
"show_comments": true,
"user_id": "2782941",
"author": {
"name": "西布朗足球俱乐部",
"level": "official",
"medal_url": "http://img1.dongqiudi.com/fastdfs1/M00/63/B3/o4YBAFj5pYKAetOzAAAGhNXa-yY637.png",
"user_id": "2782941"
},
"published_at": "2017-04-29 01:02:16",
"sort_timestamp": 1493398936,
"channel": "feed"
},
{
"id": 321948,
"title": "帕托征战中超，不忘放眼投资美国市场",
"share_title": "帕托征战中超，不忘放眼投资美国市场",
"description": null,
"comments_total": 2,
"share": "https://www.dongqiudi.com/article/321948",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/68/B1/180x135/crop/-/pIYBAFkDKPmAUNn9AAH831bl1DM454.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/321948.html",
"url1": "https://api.dongqiudi.com/v2/feed/321948.html",
"scheme": "dongqiudi:///feed/321948",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "2741358",
"author": {
"name": "西眼看中超",
"level": "normal",
"medal_url": "",
"user_id": "2741358"
},
"published_at": "2017-04-29 01:01:37",
"sort_timestamp": 1493398897,
"channel": "feed"
},
{
"id": 322080,
"title": "科瓦切维奇：感谢安切洛蒂的邀请；我的风格和伊布比较像",
"share_title": "科瓦切维奇：感谢安切洛蒂的邀请；我的风格和伊布比较像",
"description": null,
"comments_total": 3,
"share": "https://www.dongqiudi.com/article/322080",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/68/E5/180x135/crop/-/pIYBAFkDczmAGWCVAAEnkhxWwdg981.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322080.html",
"url1": "https://api.dongqiudi.com/v2/feed/322080.html",
"scheme": "dongqiudi:///feed/322080",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "2537521",
"author": {
"name": "克罗地亚球迷俱乐部",
"level": "normal",
"medal_url": "",
"user_id": "2537521"
},
"published_at": "2017-04-29 00:52:48",
"sort_timestamp": 1493398368,
"channel": "feed"
},
{
"id": 322076,
"title": "意料之外却情理之中的胜利！",
"share_title": "意料之外却情理之中的胜利！",
"description": null,
"comments_total": 2,
"share": "https://www.dongqiudi.com/article/322076",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/91/180x135/crop/-/o4YBAFkDb8CAA8taAACgszL24go617.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322076.html",
"url1": "https://api.dongqiudi.com/v2/feed/322076.html",
"scheme": "dongqiudi:///feed/322076",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "3325559",
"author": {
"name": "隔村说足球",
"level": "normal",
"medal_url": "",
"user_id": "3325559"
},
"published_at": "2017-04-29 00:46:27",
"sort_timestamp": 1493397987,
"channel": "feed"
},
{
"id": 322074,
"title": "拉莫斯与球迷互动：我记得所有帮助过我的人，包括你们",
"share_title": "拉莫斯与球迷互动：我记得所有帮助过我的人，包括你们",
"description": null,
"comments_total": 3,
"share": "https://www.dongqiudi.com/article/322074",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/8F/180x135/crop/-/o4YBAFkDbVmAEHRKAAEJzucxuoo347.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322074.html",
"url1": "https://api.dongqiudi.com/v2/feed/322074.html",
"scheme": "dongqiudi:///feed/322074",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "2741353",
"author": {
"name": "体育有你",
"level": "normal",
"medal_url": "",
"user_id": "2741353"
},
"published_at": "2017-04-29 00:40:14",
"sort_timestamp": 1493397614,
"channel": "feed"
},
{
"id": 322065,
"title": "谈情怀？从“驰骋疆场”到“林李大战 ”",
"share_title": "谈情怀？从“驰骋疆场”到“林李大战 ”",
"description": null,
"comments_total": 1,
"share": "https://www.dongqiudi.com/article/322065",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/89/180x135/crop/-/o4YBAFkDaBeAbOXhAADgH5Oy0Lk953.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322065.html",
"url1": "https://api.dongqiudi.com/v2/feed/322065.html",
"scheme": "dongqiudi:///feed/322065",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "2587430",
"author": {
"name": "V5体育",
"level": "normal",
"medal_url": "",
"user_id": "2587430"
},
"published_at": "2017-04-29 00:07:16",
"sort_timestamp": 1493395636,
"channel": "feed"
},
{
"id": 322057,
"title": "遭遇赛季首败，回归越秀山我们重新出发",
"share_title": "遭遇赛季首败，回归越秀山我们重新出发",
"description": null,
"comments_total": 71,
"share": "https://www.dongqiudi.com/article/322057",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/85/180x135/crop/-/o4YBAFkDYTGARiR8ABC8rJxtjz0954.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322057.html",
"url1": "https://api.dongqiudi.com/v2/feed/322057.html",
"scheme": "dongqiudi:///feed/322057",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "2554339",
"author": {
"name": "广州富力足球俱乐部",
"level": "official",
"medal_url": "http://img1.dongqiudi.com/fastdfs1/M00/63/B3/o4YBAFj5pYKAetOzAAAGhNXa-yY637.png",
"user_id": "2554339"
},
"published_at": "2017-04-28 23:57:02",
"sort_timestamp": 1493395022,
"channel": "feed"
},
{
"id": 322060,
"title": "广州富力赛季首场失利！是玄学的指引，还是不得不败？",
"share_title": "广州富力赛季首场失利！是玄学的指引，还是不得不败？",
"description": null,
"comments_total": 2,
"share": "https://www.dongqiudi.com/article/322060",
"thumb": "http://img1.dongqiudi.com/fastdfs1/M00/69/86/180x135/crop/-/o4YBAFkDYyyABDgkAAKyYvflZmg361.jpg",
"top": false,
"top_color": "",
"url": "https://api.dongqiudi.com/v2/feed/322060.html",
"url1": "https://api.dongqiudi.com/v2/feed/322060.html",
"scheme": "dongqiudi:///feed/322060",
"is_video": false,
"collection_type": null,
"show_comments": true,
"user_id": "2548907",
"author": {
"name": "乐播足球",
"level": "normal",
"medal_url": "",
"user_id": "2548907"
},
"published_at": "2017-04-29 00:01:50",
"sort_timestamp": 1493395310,
"channel": "feed"
}
],
"title": "最新发表"
},
"ret_type": 1,
"next": "http://feed.dongqiudi.com/tab/article_list?after=1493395309&page=2"
}
}

#中超 https://api.dongqiudi.com/app/tabs/iphone/56.json?mark=gif

#专题 https://api.dongqiudi.com/app/tabs/iphone/classifications.json

#深度 https://api.dongqiudi.com/app/tabs/iphone/55.json?mark=gif

#足彩 https://api.dongqiudi.com/app/tabs/iphone/58.json?mark=gif

#闲情 https://api.dongqiudi.com/app/tabs/iphone/37.json?mark=gif

#西甲 https://api.dongqiudi.com/app/tabs/iphone/5.json?mark=gif

#德甲 6

#意甲 4

#五洲 57

##直播 
#重要 https://api.dongqiudi.com/data/tab/important?start=2017-04-2716:00:00&version=551&init=1
#足彩 https://api.dongqiudi.com/data/tab/lottery?start=2017-04-2716:00:00&version=551&init=1
#节目 https://api.dongqiudi.com/data/tab/program?start=2017-04-2716:00:00&init=1

#end 