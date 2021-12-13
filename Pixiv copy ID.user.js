// ==UserScript==
// @name         Pixiv copy ID
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  copy pixiv picture id with shortcut key
// @author       Rika
// @match        https://www.pixiv.net/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    var currenturl = window.location.href;

    function copyTextToClipboard(text) {
        var textArea = document.createElement("textarea");
        textArea.style.position = 'fixed';
        textArea.style.top = 0;
        textArea.style.left = 0;
        textArea.style.width = '2em';
        textArea.style.height = '2em';
        textArea.style.padding = 0;
        textArea.style.border = 'none';
        textArea.style.outline = 'none';
        textArea.style.boxShadow = 'none';
        textArea.style.background = 'transparent';
        textArea.value = text;
        document.body.appendChild(textArea);
        textArea.focus();
        textArea.select();

        try {
            var successful = document.execCommand('copy');
        } catch (err) {
            console.log('Oops, unable to copy');
        }
        document.body.removeChild(textArea);
    }


    document.addEventListener("keydown", function(event) {
        if(event.ctrlKey && event.keyCode == 86) {
            //copyTextToClipboard(currenturl.substr(currenturl.lastIndexOf('/') + 1));
            copyTextToClipboard("2\n" + currenturl.match(/\/([^\/]+)\/?$/)[1] + "\n");
            event.preventDefault();
        }
    });


})();