// ==UserScript==
// @name         eyny no highlight
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        http://*.eyny.com/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    let regurl = /w\S+eyny.com/g;
    let hostey = window.location.hostname;
    let isEyny = hostey.match(regurl);
    let len = isEyny.length;
    let regexForHighlight = /&highlight=\S+/g;

    let highlightMatchLength = window.location.href.match(regexForHighlight).length;
    if(highlightMatchLength > 0) {
        //if(window.confirm("remove highlight?")) {
            if(len > 0 || window.location.hostname == "www.eyny.com") {
                let ur = window.location.href;
                let replacement = ur.replace(regexForHighlight, "");
                setTimeout(function() {
                window.location.href = replacement;
                }, 3000);
            }
        //}
    }
})();