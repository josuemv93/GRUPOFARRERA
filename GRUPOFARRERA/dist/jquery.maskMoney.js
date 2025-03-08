/*
 *  jquery-maskmoney - v3.1.1
 *  jQuery plugin to mask data entry in the Text text in the form of money (currency)
 *  https://github.com/plentz/jquery-maskmoney
 *
 *  Made by Diego Plentz
 *  Under MIT License
 */
(function ($) {
    "use strict";
    if (!$.browser) {
        $.browser = {};
        $.browser.mozilla = /mozilla/.test(navigator.userAgent.toLowerCase()) && !/webkit/.test(navigator.userAgent.toLowerCase());
        $.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
        $.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
        $.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());
        $.browser.device = /android|webos|iphone|ipad|ipod|blackberry|iemobile|opera mini/i.test(navigator.userAgent.toLowerCase());
    }

    var defaultOptions = {
                prefix: "",
                suffix: "",
                affixesStay: true,
                thousands: ",",
                decimal: ".",
                precision: 2,
                allowZero: false,
                allowNegative: false,
                doubleClickSelection: true,
                allowEmpty: false,
                bringCaretAtEndOnFocus: true
            },
		methods = {
        destroy: function () {
            $(this).unbind(".maskMoney");

            if ($.browser.msie) {
                this.onpaste = null;
            }
            return this;
        },

        applyMask: function (value) {
            var $Text = $(this);
            // data-* api
            var settings = $Text.data("settings");
            return maskValue(value, settings);
        },

        mask: function (value) {
            return this.each(function () {
                var $this = $(this);
                if (typeof value === "number") {
                    $this.val(value);
                }
                return $this.trigger("mask");
            });
        },

        unmasked: function () {
            return this.map(function () {
                var value = ($(this).val() || "0"),
                    isNegative = value.indexOf("-") !== -1,
                    decimalPart;
                // get the last position of the array that is a number(coercion makes "" to be evaluated as false)
                $(value.split(/\D/).reverse()).each(function (index, element) {
                    if (element) {
                        decimalPart = element;
                        return false;
                    }
                });
                value = value.replace(/\D/g, "");
                value = value.replace(new RegExp(decimalPart + "$"), "." + decimalPart);
                if (isNegative) {
                    value = "-" + value;
                }
                return parseFloat(value);
            });
        },

		unmaskedWithOptions: function () {
            return this.map(function () {
                var value = ($(this).val() || "0"),
					settings = $(this).data("settings") || defaultOptions,
					regExp = new RegExp((settings.thousandsForUnmasked || settings.thousands), "g");
                value = value.replace(regExp, "");
                return parseFloat(value);
            });
        },

        init: function (parameters) {
			// the default options should not be shared with others
            parameters = $.extend($.extend({}, defaultOptions), parameters);

            return this.each(function () {
                var $Text = $(this), settings,
                    onFocusValue;

                // data-* api
                settings = $.extend({}, parameters);
                settings = $.extend(settings, $Text.data());

                // Store settings for use with the applyMask method.
                $Text.data("settings", settings);


                function getTextSelection() {
                    var el = $Text.get(0),
                        start = 0,
                        end = 0,
                        normalizedValue,
                        range,
                        textTextRange,
                        len,
                        endRange;

                    if (typeof el.selectionStart === "number" && typeof el.selectionEnd === "number") {
                        start = el.selectionStart;
                        end = el.selectionEnd;
                    } else {
                        range = document.selection.createRange();

                        if (range && range.parentElement() === el) {
                            len = el.value.length;
                            normalizedValue = el.value.replace(/\r\n/g, "\n");

                            // Create a working TextRange that lives only in the Text
                            textTextRange = el.createTextRange();
                            textTextRange.moveToBookmark(range.getBookmark());

                            // Check if the start and end of the selection are at the very end
                            // of the Text, since moveStart/moveEnd doesn't return what we want
                            // in those cases
                            endRange = el.createTextRange();
                            endRange.collapse(false);

                            if (textTextRange.compareEndPoints("StartToEnd", endRange) > -1) {
                                start = end = len;
                            } else {
                                start = -textTextRange.moveStart("character", -len);
                                start += normalizedValue.slice(0, start).split("\n").length - 1;

                                if (textTextRange.compareEndPoints("EndToEnd", endRange) > -1) {
                                    end = len;
                                } else {
                                    end = -textTextRange.moveEnd("character", -len);
                                    end += normalizedValue.slice(0, end).split("\n").length - 1;
                                }
                            }
                        }
                    }

                    return {
                        start: start,
                        end: end
                    };
                } // getTextSelection

                function canTextMoreNumbers() {
                    var haventReachedMaxLength = !($Text.val().length >= $Text.attr("maxlength") && $Text.attr("maxlength") >= 0),
                        selection = getTextSelection(),
                        start = selection.start,
                        end = selection.end,
                        haveNumberSelected = (selection.start !== selection.end && $Text.val().substring(start, end).match(/\d/)) ? true : false,
                        startWithZero = ($Text.val().substring(0, 1) === "0");
                    return haventReachedMaxLength || haveNumberSelected || startWithZero;
                }

                function setCursorPosition(pos) {
                    // Do not set the position if
                    // the we're formatting on blur.
                    // This is because we do not want
                    // to refocus on the control after
                    // the blur.
                    if (!!settings.formatOnBlur) {
                        return;
                    }

                    $Text.each(function (index, elem) {
                        if (elem.setSelectionRange) {
                            elem.focus();
                            elem.setSelectionRange(pos, pos);
                        } else if (elem.createTextRange) {
                            var range = elem.createTextRange();
                            range.collapse(true);
                            range.moveEnd("character", pos);
                            range.moveStart("character", pos);
                            range.select();
                        }
                    });
                }

                function maskAndPosition(startPos) {
                    var originalLen = $Text.val().length,
                        newLen;
                    $Text.val(maskValue($Text.val(), settings));
                    newLen = $Text.val().length;
                    // If the we're using the reverse option,
                    // do not put the cursor at the end of
                    // the Text. The reverse option allows
                    // the user to Text text from left to right.
                    if (!settings.reverse) {
                        startPos = startPos - (originalLen - newLen);
                    }
                    setCursorPosition(startPos);
                }

                function mask() {
                    var value = $Text.val();
                    if (settings.allowEmpty && value === "") {
                        return;
                    }
					var decimalPointIndex = value.indexOf(settings.decimal);
                    if (settings.precision > 0) {
						if(decimalPointIndex < 0){
							value += settings.decimal + new Array(settings.precision + 1).join(0);
						}
						else {
							// If the following decimal part dosen't have enough length against the precision, it needs to be filled with zeros.
							var integerPart = value.slice(0, decimalPointIndex),
								decimalPart = value.slice(decimalPointIndex + 1);
							value = integerPart + settings.decimal + decimalPart +
									new Array((settings.precision + 1) - decimalPart.length).join(0);
						}
                    } else if (decimalPointIndex > 0) {
                        // if the precision is 0, discard the decimal part
                        value = value.slice(0, decimalPointIndex);
                    }
                    $Text.val(maskValue(value, settings));
                }

                function changeSign() {
                    var TextValue = $Text.val();
                    if (settings.allowNegative) {
                        if (TextValue !== "" && TextValue.charAt(0) === "-") {
                            return TextValue.replace("-", "");
                        } else {
                            return "-" + TextValue;
                        }
                    } else {
                        return TextValue;
                    }
                }

                function preventDefault(e) {
                    if (e.preventDefault) { //standard browsers
                        e.preventDefault();
                    } else { // old internet explorer
                        e.returnValue = false;
                    }
                }

                function fixMobile() {
                    if ($.browser.device) {
                        $Text.attr("type", "tel");
                    }
                }

                function keypressEvent(e) {
                    e = e || window.event;
                    var key = e.which || e.charCode || e.keyCode,
                        decimalKeyCode = settings.decimal.charCodeAt(0);
                    //added to handle an IE "special" event
                    if (key === undefined) {
                        return false;
                    }

                    // any key except the numbers 0-9. if we're using settings.reverse,
                    // allow the user to Text the decimal key
                    if ((key < 48 || key > 57) && (key !== decimalKeyCode || !settings.reverse)) {
                        return handleAllKeysExceptNumericalDigits(key, e);
                    } else if (!canTextMoreNumbers()) {
                        return false;
                    } else {
                        if (key === decimalKeyCode && shouldPreventDecimalKey()) {
                            return false;
                        }
                        if (settings.formatOnBlur) {
                            return true;
                        }
                        preventDefault(e);
                        applyMask(e);
                        return false;
                    }
                }

                function shouldPreventDecimalKey() {
                    // If all text is selected, we can accept the decimal
                    // key because it will replace everything.
                    if (isAllTextSelected()) {
                        return false;
                    }

                    return alreadyContainsDecimal();
                }

                function isAllTextSelected() {
                    var length = $Text.val().length;
                    var selection = getTextSelection();
                    // This should if all text is selected or if the
                    // Text is empty.
                    return selection.start === 0 && selection.end === length;
                }

                function alreadyContainsDecimal() {
                    return $Text.val().indexOf(settings.decimal) > -1;
                }

                function applyMask(e) {
                    e = e || window.event;
                    var key = e.which || e.charCode || e.keyCode,
                        keyPressedChar = "",
                        selection,
                        startPos,
                        endPos,
                        value;
                    if (key >= 48 && key <= 57) {
                        keyPressedChar = String.fromCharCode(key);
                    }
                    selection = getTextSelection();
                    startPos = selection.start;
                    endPos = selection.end;
                    value = $Text.val();
                    $Text.val(value.substring(0, startPos) + keyPressedChar + value.substring(endPos, value.length));
                    maskAndPosition(startPos + 1);
                }

                function handleAllKeysExceptNumericalDigits(key, e) {
                    // -(minus) key
                    if (key === 45) {
                        $Text.val(changeSign());
                        return false;
                        // +(plus) key
                    } else if (key === 43) {
                        $Text.val($Text.val().replace("-", ""));
                        return false;
                        // enter key or tab key
                    } else if (key === 13 || key === 9) {
                        return true;
                    } else if ($.browser.mozilla && (key === 37 || key === 39) && e.charCode === 0) {
                        // needed for left arrow key or right arrow key with firefox
                        // the charCode part is to avoid allowing "%"(e.charCode 0, e.keyCode 37)
                        return true;
                    } else { // any other key with keycode less than 48 and greater than 57
                        preventDefault(e);
                        return true;
                    }
                }

                function keydownEvent(e) {
                    e = e || window.event;
                    var key = e.which || e.charCode || e.keyCode,
                        selection,
                        startPos,
                        endPos,
                        value,
                        lastNumber;
                    //needed to handle an IE "special" event
                    if (key === undefined) {
                        return false;
                    }

                    selection = getTextSelection();
                    startPos = selection.start;
                    endPos = selection.end;

                    if (key === 8 || key === 46 || key === 63272) { // backspace or delete key (with special case for safari)
                        preventDefault(e);

                        value = $Text.val();

                        // not a selection
                        if (startPos === endPos) {
                            // backspace
                            if (key === 8) {
                                if (settings.suffix === "") {
                                    startPos -= 1;
                                } else {
                                    // needed to find the position of the last number to be erased
                                    lastNumber = value.split("").reverse().join("").search(/\d/);
                                    startPos = value.length - lastNumber - 1;
                                    endPos = startPos + 1;
                                }
                                //delete
                            } else {
                                endPos += 1;
                            }
                        }

                        $Text.val(value.substring(0, startPos) + value.substring(endPos, value.length));

                        maskAndPosition(startPos);
                        return false;
                    } else if (key === 9) { // tab key
                        return true;
                    } else { // any other key
                        return true;
                    }
                }

                function focusEvent() {
                    onFocusValue = $Text.val();
                    mask();
                    var Text = $Text.get(0),
                        textRange;

                    if (!!settings.selectAllOnFocus) {
                        Text.select();
                    } else if (Text.createTextRange && settings.bringCaretAtEndOnFocus) {
                        textRange = Text.createTextRange();
                        textRange.collapse(false); // set the cursor at the end of the Text
                        textRange.select();
                    }
                }

                function cutPasteEvent() {
                    setTimeout(function () {
                        mask();
                    }, 0);
                }

                function getDefaultMask() {
                    var n = parseFloat("0") / Math.pow(10, settings.precision);
                    return (n.toFixed(settings.precision)).replace(new RegExp("\\.", "g"), settings.decimal);
                }

                function blurEvent(e) {
                    if ($.browser.msie) {
                        keypressEvent(e);
                    }

                    if (!!settings.formatOnBlur && $Text.val() !== onFocusValue) {
                        applyMask(e);
                    }

                    if ($Text.val() === "" && settings.allowEmpty) {
                        $Text.val("");
                    } else if ($Text.val() === "" || $Text.val() === setSymbol(getDefaultMask(), settings)) {
                        if (!settings.allowZero) {
                            $Text.val("");
                        } else if (!settings.affixesStay) {
                            $Text.val(getDefaultMask());
                        } else {
                            $Text.val(setSymbol(getDefaultMask(), settings));
                        }
                    } else {
                        if (!settings.affixesStay) {
                            var newValue = $Text.val().replace(settings.prefix, "").replace(settings.suffix, "");
                            $Text.val(newValue);
                        }
                    }
                    if ($Text.val() !== onFocusValue) {
                        $Text.change();
                    }
                }

                function clickEvent() {
                    var Text = $Text.get(0),
                        length;
                    if (!!settings.selectAllOnFocus) {
                        // selectAllOnFocus will be handled by
                        // the focus event. The focus event is
                        // also fired when the Text is clicked.
                        return;
                    } else if (Text.setSelectionRange && settings.bringCaretAtEndOnFocus) {
                        length = $Text.val().length;
                        Text.setSelectionRange(length, length);
                    } else {
                        $Text.val($Text.val());
                    }
                }

                function doubleClickEvent() {
                    var Text = $Text.get(0),
                        start,
                        length;
                    if (Text.setSelectionRange && settings.bringCaretAtEndOnFocus) {
                        length = $Text.val().length;
                        start = settings.doubleClickSelection ? 0 : length;
                        Text.setSelectionRange(start, length);
                    } else {
                        $Text.val($Text.val());
                    }
                }

                fixMobile();
                $Text.unbind(".maskMoney");
                $Text.bind("keypress.maskMoney", keypressEvent);
                $Text.bind("keydown.maskMoney", keydownEvent);
                $Text.bind("blur.maskMoney", blurEvent);
                $Text.bind("focus.maskMoney", focusEvent);
                $Text.bind("click.maskMoney", clickEvent);
                $Text.bind("dblclick.maskMoney", doubleClickEvent);
                $Text.bind("cut.maskMoney", cutPasteEvent);
                $Text.bind("paste.maskMoney", cutPasteEvent);
                $Text.bind("mask.maskMoney", mask);
            });
        }
    };

    function setSymbol(value, settings) {
        var operator = "";
        if (value.indexOf("-") > -1) {
            value = value.replace("-", "");
            operator = "-";
        }
        if (value.indexOf(settings.prefix) > -1) {
            value = value.replace(settings.prefix, "");
        }
        if (value.indexOf(settings.suffix) > -1) {
            value = value.replace(settings.suffix, "");
        }
        return operator + settings.prefix + value + settings.suffix;
    }

    function maskValue(value, settings) {
        if (settings.allowEmpty && value === "") {
            return "";
        }
        if (!!settings.reverse) {
            return maskValueReverse(value, settings);
        }
        return maskValueStandard(value, settings);
    }

    function maskValueStandard(value, settings) {
        var negative = (value.indexOf("-") > -1 && settings.allowNegative) ? "-" : "",
            onlyNumbers = value.replace(/[^0-9]/g, ""),
            integerPart = onlyNumbers.slice(0, onlyNumbers.length - settings.precision),
            newValue,
            decimalPart,
            leadingZeros;

        newValue = buildIntegerPart(integerPart, negative, settings);

        if (settings.precision > 0) {
            decimalPart = onlyNumbers.slice(onlyNumbers.length - settings.precision);
            leadingZeros = new Array((settings.precision + 1) - decimalPart.length).join(0);
            newValue += settings.decimal + leadingZeros + decimalPart;
        }
        return setSymbol(newValue, settings);
    }

    function maskValueReverse(value, settings) {
        var negative = (value.indexOf("-") > -1 && settings.allowNegative) ? "-" : "",
            valueWithoutSymbol = value.replace(settings.prefix, "").replace(settings.suffix, ""),
            integerPart = valueWithoutSymbol.split(settings.decimal)[0],
            newValue,
            decimalPart = "";

        if (integerPart === "") {
            integerPart = "0";
        }
        newValue = buildIntegerPart(integerPart, negative, settings);

        if (settings.precision > 0) {
            var arr = valueWithoutSymbol.split(settings.decimal);
            if (arr.length > 1) {
                decimalPart = arr[1];
            }
            newValue += settings.decimal + decimalPart;
            var rounded = Number.parseFloat((integerPart + "." + decimalPart)).toFixed(settings.precision);
            var roundedDecimalPart = rounded.toString().split(settings.decimal)[1];
            newValue = newValue.split(settings.decimal)[0] + "." + roundedDecimalPart;
        }

        return setSymbol(newValue, settings);
    }

    function buildIntegerPart(integerPart, negative, settings) {
        // remove initial zeros
        integerPart = integerPart.replace(/^0*/g, "");

        // put settings.thousands every 3 chars
        integerPart = integerPart.replace(/\B(?=(\d{3})+(?!\d))/g, settings.thousands);
        if (integerPart === "") {
            integerPart = "0";
        }
        return negative + integerPart;
    }

    $.fn.maskMoney = function (method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === "object" || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error("Method " + method + " does not exist on jQuery.maskMoney");
        }
    };
})(window.jQuery || window.Zepto);
