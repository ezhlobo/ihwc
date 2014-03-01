(function(window) {

	var document = window.document;
	var docElem = document.documentElement;
	var $ = document.querySelectorAll.bind(document);

	var browser = {
		classList: ("classList" in docElem),
		addEventListener: !!docElem.addEventListener,
		attachEvent: !!docElem.attachEvent
	}

	var each = function(obj, cllb) {
		for (var i = 0, l = obj.length; i < l; i++) {
			if (cllb(obj[i], i) == false) break;
		}
	};

	var addEvent = function(el, name, cllb) {
		if (browser.addEventListener) {
			el.addEventListener(name, cllb, false);
		} else if (browser.attachEvent)  {
			el.attachEvent("on" + name, cllb);
		}
	};

	var cssclass_remove = function(el, classname) {
		if (browser.classList) {
			el.classList.remove(classname);
		} else {
			el.className = el.className.replace(classname, "").replace(/^\s+|\s+$/g, "");
		}
	};

	var cssclass_add = function(el, classname) {
		if (browser.classList) {
			el.classList.add(classname);
		} else {
			el.className = el.className + " " + classname;
		}
	};

	var cssclass_has = function(el, classname) {
		return browser.classList ? el.classList.contains(classname) : el.className.indexOf(classname) > -1;
	};

	// Tabs
	(function() {
		var tabs = $(".tab");
		var menulinks = $("#menu a");

		var hideAllTab = function() {
			each(tabs, function(tab) {
				cssclass_remove(tab, "-showed");
			});
		};

		var showTab = function(id) {
			hideAllTab();

			each(menulinks, function(link) {
				if (link.hash == id) {
					cssclass_add(link.parentNode, "-active");
				} else {
					cssclass_remove(link.parentNode, "-active");
				}
			});
			cssclass_add($(id)[0], "-showed");
		};

		var menuClicked = function(e) {
			e.preventDefault();
			showTab(this.hash)
		};

		each(menulinks, function(link) {
			addEvent(link, "click", menuClicked);

			if (cssclass_has(link.parentNode, "-active")) {
				showTab(link.hash);
			}
		});
	})();

})(window);
