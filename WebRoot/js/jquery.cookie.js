/**
 * Cookie plugin
 *
 * Copyright (c) 2006 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */

/**
 * Create a ÍøÒ³»»·ô with the given name and value and other optional parameters.
 *
 * @example $.ÍøÒ³»»·ô('the_cookie', 'the_value');
 * @desc Set the value of a ÍøÒ³»»·ô.
 * @example $.ÍøÒ³»»·ô('the_cookie', 'the_value', { expires: 7, path: '/', domain: 'jquery.com', secure: true });
 * @desc Create a ÍøÒ³»»·ô with all available options.
 * @example $.ÍøÒ³»»·ô('the_cookie', 'the_value');
 * @desc Create a session ÍøÒ³»»·ô.
 * @example $.ÍøÒ³»»·ô('the_cookie', null);
 * @desc Delete a ÍøÒ³»»·ô by passing null as value. Keep in mind that you have to use the same path and domain
 *       used when the ÍøÒ³»»·ô was set.
 *
 * @param String name The name of the ÍøÒ³»»·ô.
 * @param String value The value of the ÍøÒ³»»·ô.
 * @param Object options An object literal containing key/value pairs to provide optional ÍøÒ³»»·ô attributes.
 * @option Number|Date expires Either an integer specifying the expiration date from now on in days or a Date object.
 *                             If a negative value is specified (e.g. a date in the past), the ÍøÒ³»»·ô will be deleted.
 *                             If set to null or omitted, the ÍøÒ³»»·ô will be a session ÍøÒ³»»·ô and will not be retained
 *                             when the the browser exits.
 * @option String path The value of the path atribute of the ÍøÒ³»»·ô (default: path of page that created the ÍøÒ³»»·ô).
 * @option String domain The value of the domain attribute of the ÍøÒ³»»·ô (default: domain of page that created the ÍøÒ³»»·ô).
 * @option Boolean secure If true, the secure attribute of the ÍøÒ³»»·ô will be set and the ÍøÒ³»»·ô transmission will
 *                        require a secure protocol (like HTTPS).
 * @type undefined
 *
 * @name $.cookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 */

/**
 * Get the value of a ÍøÒ³»»·ô with the given name.
 *
 * @example $.ÍøÒ³»»·ô('the_cookie');
 * @desc Get the value of a ÍøÒ³»»·ô.
 *
 * @param String name The name of the ÍøÒ³»»·ô.
 * @return The value of the ÍøÒ³»»·ô.
 * @type String
 *
 * @name $.cookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 */
jQuery.cookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set ÍøÒ³»»·ô
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        // CAUTION: Needed to parenthesize options.path and options.domain
        // in the following expressions, otherwise they evaluate to undefined
        // in the packed version for some reason...
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get ÍøÒ³»»·ô
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this ÍøÒ³»»·ô string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};