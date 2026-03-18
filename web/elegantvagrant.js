// ==UserScript==
// @name         Elegant Vagrant Theme
// @match        *://*/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    const style = document.createElement('style');
    style.textContent = `
        body,
        html {
            background: black;
            color: white;
        }
        a, p, b, strong, h1, h2, h3, h4, h5, h6 {
            color: #FFFFFF;
        }
        a[href]:visited {
            color: #7c5cff;
        }
        a[href]:active {
            color: #ffffff;
            text-decoration: none;
        }
        a[href]:hover {
            color: #7c5cff;
            text-decoration: none;
        }
        a[href] {
            color: #02f789;
            text-decoration: none;
        }
    `;
    document.head.appendChild(style);
})();
