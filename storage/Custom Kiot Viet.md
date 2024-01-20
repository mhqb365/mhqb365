# Cài đặt KiotViet

B1. Cài extension Tampermonkey tại link: https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo

B2. Tại trang Bán hàng của KiotViet, tạo tập lệnh mới và dán đoạn code sau vào rồi lưu lại

```
// ==UserScript==
// @name         Custom4KiotViet
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Custom format for drlaptopvn at KiotViet
// @author       mhqb365@gmail.com
// @match        https://drlaptopvn.kiotviet.vn/sale/
// @icon         https://www.google.com/s2/favicons?sz=64&domain=kiotviet.vn
// @grant        none
// ==/UserScript==

function format() {
    let elm4Remove = document.querySelector("body > div:nth-child(2) > div > div.page-content.expand-delivery.row-revert > div.col-left.cart-warranty > div.cart-container.cart-container-scroll > warranty-cart-products-component > div > div > div > div.warranty-product-info > div.row.row-padding-12 > div.col-xl-4.col-md-6.form-labels-140 > div:nth-child(3)")
    if (elm4Remove) elm4Remove.remove()
    let elm4Change = document.querySelector("body > div:nth-child(2) > div > div.page-content.expand-delivery.row-revert > div.col-left.cart-warranty > div.cart-container.cart-container-scroll > warranty-cart-products-component > div > div > div > div.warranty-product-info > div.row.row-padding-12 > div.col-xl-4.col-md-6.form-labels-140 > div:nth-child(2) > label")
    if (elm4Change) elm4Change.innerText = 'Model máy'
}

(function() {
    'use strict';
    // Your code here...
    setInterval(format, 1e3)
})();
```

B3. Refresh trang Bán hàng và sử dụng
