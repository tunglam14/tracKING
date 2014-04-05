/*
 * File name: client.js
 * Author: Dang Tung Lam <lamdt@familug.org>
 * 04 Apr, 2014
*/

function __lloogg__() {
    
    var u = __tracking_client_id__;
    var l = document.location;
    var r = (typeof(document.referrer) == 'undefined') ? '' : document.referrer;
    var height = window.screen.availHeight
    var width = window.screen.availWidth
    var res = width + 'x' + height

    var e = function (s) {
        try {
            return encodeURIComponent(s);
        } catch(e) {
            var e = escape(s);
            e = e.replace(/@/g,"%40");
            e = e.replace(/\//g,"%2f");
            e = e.replace(/\+/g,"%2b");
            return e;
        }
    };
    var args='';
    var img=new Image(1,1);
    args += '?u='+e(u);
    args += '&l='+e(l);
    args += '&r='+e(r);
    args += '&res='+e(res);
    
    img.src='http://localhost:3000/seed'+args;
    img.onload = function() { return; };
}
__lloogg__(); 