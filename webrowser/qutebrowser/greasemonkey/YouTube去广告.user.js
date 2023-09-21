// ==UserScript==
// @name         YouTube去广告 YouTube AD Blocker
// @name:zh-CN   YouTube去广告
// @name:zh-TW   YouTube去廣告
// @name:zh-HK   YouTube去廣告
// @name:zh-MO   YouTube去廣告
// @namespace    http://tampermonkey.net/
// @version      5.2
// @description         这是一个去除YouTube广告的脚本，轻量且高效，它能丝滑的去除界面广告和视频广告，包括6s广告。This is a script that removes ads on YouTube, it's lightweight and efficient, capable of smoothly removing interface and video ads, including 6s ads.
// @description:zh-CN   这是一个去除YouTube广告的脚本，轻量且高效，它能丝滑的去除界面广告和视频广告，包括6s广告。
// @description:zh-TW   這是一個去除YouTube廣告的腳本，輕量且高效，它能絲滑地去除界面廣告和視頻廣告，包括6s廣告。
// @description:zh-HK   這是一個去除YouTube廣告的腳本，輕量且高效，它能絲滑地去除界面廣告和視頻廣告，包括6s廣告。
// @description:zh-MO   這是一個去除YouTube廣告的腳本，輕量且高效，它能絲滑地去除界面廣告和視頻廣告，包括6s廣告。
// @author       iamfugui
// @match        *://*.youtube.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=YouTube.com
// @grant        none
// @license MIT
// ==/UserScript==
(function() {
    `use strict`;

    //界面广告选择器
    const cssSeletorArr = [
        `#masthead-ad`,//首页顶部横幅广告.
        `ytd-rich-item-renderer.style-scope.ytd-rich-grid-row #content:has(.ytd-display-ad-renderer)`,//首页视频排版广告.
        `ytd-rich-section-renderer #dismissible`,//首页中部横幅广告.
        `.video-ads.ytp-ad-module`,//播放器底部广告.
        `tp-yt-paper-dialog:has(yt-mealbar-promo-renderer)`,//播放页会员促销广告.
        `#related #player-ads`,//播放页评论区右侧推广广告.
        `#related ytd-ad-slot-renderer`,//播放页评论区右侧视频排版广告.
        `ytd-ad-slot-renderer`,//搜索页广告.
        `yt-mealbar-promo-renderer`,//播放页会员推荐广告.
    ];
    const dev = true;//开发使用
    let video;//视频dom

    /**
    * 将标准时间格式化
    * @param {Date} time 标准时间
    * @param {String} format 格式
    * @return {String}
    */
    function moment(time, format = `YYYY-MM-DD HH:mm:ss`) {
        // 获取年⽉⽇时分秒
        let y = time.getFullYear()
        let m = (time.getMonth() + 1).toString().padStart(2, `0`)
        let d = time.getDate().toString().padStart(2, `0`)
        let h = time.getHours().toString().padStart(2, `0`)
        let min = time.getMinutes().toString().padStart(2, `0`)
        let s = time.getSeconds().toString().padStart(2, `0`)
        if (format === `YYYY-MM-DD`) {
            return `${y}-${m}-${d}`
        } else {
            return `${y}-${m}-${d} ${h}:${min}:${s}`
        }
    }

    /**
    * 输出信息
    * @param {String} msg 信息
    * @return {undefined}
    */
    function log(msg) {
        if(!dev){
            return false;
        }
        console.log(`${moment(new Date())}  ${msg}`)
    }

    /**
    * 获取当前url的参数,如果要查询特定参数请传参
    * @param {String} 要查询的参数
    * @return {String || Object}
    */
    function getUrlParams(param) {
        // 通过 ? 分割获取后面的参数字符串
        let urlStr = location.href.split(`?`)[1]
        if(!urlStr){
            return ``;
        }
        // 创建空对象存储参数
        let obj = {};
        // 再通过 & 将每一个参数单独分割出来
        let paramsArr = urlStr.split(`&`)
        for(let i = 0,len = paramsArr.length;i < len;i++){
            // 再通过 = 将每一个参数分割为 key:value 的形式
            let arr = paramsArr[i].split(`=`)
            obj[arr[0]] = arr[1];
        }

        if(!param){
            return obj;
        }

        return obj[param]||``;
    }

    /**
    * 生成去除广告的css元素style并附加到HTML节点上
    * @param {String} styles 样式文本
    * @param {String} styleId 元素id
    * @return {undefined}
    */
    function generateRemoveADHTMLElement(styles,styleId) {
        //如果已经设置过,退出.
        if (document.getElementById(styleId)) {
            return false
        }

        //设置移除广告样式.
        let style = document.createElement(`style`);//创建style元素.
        style.id = styleId;
        (document.querySelector(`head`) || document.querySelector(`body`)).appendChild(style);//将节点附加到HTML.
        style.appendChild(document.createTextNode(styles));//附加样式节点到元素节点.
        log(`屏蔽页面广告节点已生成`)

    }

    /**
    * 生成去除广告的css文本
    * @param {Array} cssSeletorArr 待设置css选择器数组
    * @return {String}
    */
    function generateRemoveADCssText(cssSeletorArr){
        cssSeletorArr.forEach((seletor,index)=>{
            cssSeletorArr[index]=`${seletor}{display:none!important}`;//遍历并设置样式.
        });
        return cssSeletorArr.join(` `);//拼接成字符串.
    }

    /**
    * 跳过广告
    * @return {undefined}
    */
    function skipAd(mutationsList, observer) {
        const minTime = 60;
        const maxTime = 120;
        const randomTime = Math.floor(Math.random() * (maxTime - minTime + 1)) + minTime;

        let skipButton = document.querySelector(`.ytp-ad-skip-button`);
        let shortAdMsg = document.querySelector(`.video-ads.ytp-ad-module .ytp-ad-player-overlay`);

        if(!skipButton && !shortAdMsg){
            log(`******广告结束变动******`);
            return false;
        }

        const fn = () => {
            skipButton = document.querySelector(`.ytp-ad-skip-button`);
            shortAdMsg = document.querySelector(`.video-ads.ytp-ad-module .ytp-ad-player-overlay`);

            if(skipButton||shortAdMsg){
                video.muted = true;//关闭广告声音
            }

            //拥有跳过按钮的广告.
            if(skipButton)
            {
                log(`普通视频广告~~~~~~~~~~~~~`);
                log(`总时长:`);
                log(`${video.duration}`)
                log(`当前时间:`);
                log(`${video.currentTime}`)
                skipButton.click();// 跳过广告.
                log(`按钮跳过了该广告~~~~~~~~~~~~~`);
                return false;//终止
            }

            //没有跳过按钮的短广告.
            if(shortAdMsg){
                log(`强制视频广告~~~~~~~~~~~~~`);
                log(`总时长:`);
                log(`${video.duration}`)
                log(`当前时间:`);
                log(`${video.currentTime}`)
                video.currentTime = 1024;
                log(`强制结束了该广告~~~~~~~~~~~~~`);
                return false;//终止
            }
            video.muted = false;//开启视频声音
            log(`######广告此前已关闭######`);
        }
        fn();//标准执行

        let timer = setTimeout(fn, randomTime);//备执行

        setTimeout(()=>{
            skipButton = document.querySelector(`.ytp-ad-skip-button`);
            shortAdMsg = document.querySelector(`.video-ads.ytp-ad-module .ytp-ad-player-overlay`);
            if(skipButton || shortAdMsg){
                log(`******关闭广告失败，继续执行一轮Fn******`);
            }else{
                clearTimeout(timer);
                log(`******关闭广告成功******`);
            }
        }, 0);

    }

    /**
    * 去除播放中的广告
    * @return {undefined}
    */
    function removePlayerAD(){
        let observer;//监听器

        //开始监听
        function startObserve(){
            video = document.querySelector(`video`);//获取视频节点

            //广告节点监听
            const targetNode = document.querySelector(`.video-ads.ytp-ad-module`);

            //这个视频不存在广告
            if(!targetNode){
                log(`这个视频不存在广告`);
                return false;
            }

            //监听视频中的广告并处理
            const config = {childList: true, subtree: true };// 监听目标节点本身与子树下节点的变动
            observer = new MutationObserver(skipAd);// 创建一个观察器实例并设置处理广告的回调函数
            observer.observe(targetNode, config);// 以上述配置开始观察广告节点

            //初始化监听，发现并处理广告
            let skipButton = document.querySelector(`.ytp-ad-skip-button`);
            let shortAdMsg = document.querySelector(`.video-ads.ytp-ad-module .ytp-ad-player-overlay`);
            if(skipButton || shortAdMsg){
                log(`初始化监听，发现并处理广告`);
                skipAd();
            }else{
                log(`初始化监听，没有发现广告`);
            }

        }

        //结束监听
        function closeObserve(){
            observer.disconnect();
            observer = null;
        }

        //轮询任务
        setInterval(function(){
            //视频播放页
            if(getUrlParams(`v`)){
                if(observer){
                    return false;
                }
                startObserve();
            }else{
                //其它界面
                if(!observer){
                    return false;
                }
                closeObserve();
            }
        },16);

        log(`去除视频广告脚本持续运行中`)
    }

    /**
    * main函数
    */
    function main(){
        generateRemoveADHTMLElement(generateRemoveADCssText(cssSeletorArr),`removeAD`);//移除界面中的广告.
        removePlayerAD();//移除播放中的广告.
    }

    if (document.readyState === `loading`) {
        log(`YouTube去广告脚本即将调用:`);
        document.addEventListener(`DOMContentLoaded`, main);// 此时加载尚未完成
    } else {
        log(`YouTube去广告脚本快速调用:`);
        main();// 此时`DOMContentLoaded` 已经被触发
    }

})();