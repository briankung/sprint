var _num = "";

var _probs = new Array();

(function($) {
    $.fn.goTo = function() {
        $('html, body').animate({
            scrollTop: $(this).offset().top + 'px'
        }, 'fast');
        return this; // for chaining...
    }
})(jQuery);

$(function() {
	$('body').prepend("<div id='toc'></div>");
	$('#toc').append("<h1>Project Euler - TOC [Compiled by SFR]<a href='Euler_Book.pdf' class='print-hidden' id='dl'>[Download PDF]</a></h1>");

	$('.problem-number').each(function() {
		var name = $(this).next('.problem-name').text();
		var number = $(this).attr('id').replace("problem-", "");
		$('#toc').append("<a href='#problem-"+number+"' class='toc-item'><span class='toc-iname'>"+name+"</span><span class='toc-inum'>"+number+"</span></a>");
		_probs[number] = $(this);
	});

	$('#toc').click(function() {
		$('.toc-item').toggle();
	});
	$('.toc-item').toggle();

	$('a').attr('target', '_blank');
	$('a[href*=#]').removeAttr('target');

	$('.problem-number').before('<div class="print-spacer"></div>');

	var _num = "";
	$(document).keydown(function(e) {
		//console.log(e.which);
		var engaged = false;
		if(e.which == 27) {
			_num = "";
			engaged = true;
		}
		if(e.which === 8) {
			_num = _num.substring(0, _num.length - 1);
			engaged = true;
		}
		if(e.which >= 48 && e.which <= 57) {
			if((_num.length+1) > 3) { _num = ""; }
			_num += String.fromCharCode(e.which);
			console.log(_num);
			engaged = true;
		}
		if(engaged) {
			if(_probs[_num]) {
				_probs[_num].goTo();
			}else{
				$('#toc').goTo();
			}
		}
	});
	$(document).click(function() {
		_num = "";
	});
});