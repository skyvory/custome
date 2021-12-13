// ==UserScript==
// @name         redirect e-h to ex
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://e-hentai.org/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    String.prototype.replaceAt=function(index, replacement) {
        return this.substr(0, index) + replacement+ this.substr(index + replacement.length);
    };
    if(window.location.hostname == "e-hentai.org") {
      let ur = window.location.href;
        window.location.href = ur.replaceAt(9, "x");
    }
    // Your code here...
})();