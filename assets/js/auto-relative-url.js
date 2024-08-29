var baseUrl = "{{ site.baseurl | default: '' }}";
window.onload = function() {
    var imgs = document.getElementsByTagName("img");
    for (var i = 0; i < imgs.length; i++) {
        var src = imgs[i].getAttribute("src");
        if (src.startsWith("../")) {
            imgs[i].setAttribute("src", baseUrl + src.substring(2));
        }
    }
};