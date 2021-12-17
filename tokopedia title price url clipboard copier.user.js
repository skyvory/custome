// ==UserScript==
// @name         Tokopedia Clipboard Copier
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Tokopedia product detail clipboard copier using ctrl+q
// @author       Springvice
// @match        https://www.tokopedia.com/*
// @icon         https://www.google.com/s2/favicons?domain=tampermonkey.net
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
        
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
    
    // Retrieve URL
    var currenturl = window.location.href;
    var currenturlPath = currenturl.match(/\/([^\/]+)\/?$/)[1];

    document.addEventListener("keydown", function (event) {
        if (event.ctrlKey && event.key == "q") {

            // Retrieve item name
            let itemName = "";
            itemName = document.querySelector('#pdp_comp-product_content').children[0].children[0].textContent;

            // Retrieve item price
            let itemPrice;
            itemPrice = document.querySelector('.price').textContent;
            // Remove currency from price string
            itemPrice = itemPrice.replace(/^Rp+/i, '');
            // Remove dot from price string
            itemPrice = itemPrice.split('.').join("");
            
            copyTextToClipboard(itemName + "\t" + itemPrice + "\t" + currenturl + "\n");
            event.preventDefault();
        }
    });
})();