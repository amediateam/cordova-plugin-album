var noop = function(){};
var PhotoAlbum = {
    set: function (text, success, fail) {
    	text = text||""; // Empty is the same as issuing reset.
        cordova.exec(success||noop, fail||noop, "PhotoAlbum", "set", [text]);
    },
    get: function (success, fail) {
        if (success) {
           cordova.exec(success, fail||noop, "PhotoAlbum", "get", []);
         } else {
           return false;
        }
    },
    reset: function (success, fail) {
        cordova.exec(success||noop, fail||noop, "PhotoAlbum", "reset", []);
    }
};
module.exports = PhotoAlbum;
