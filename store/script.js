$( document ).ready() {
	var preview = $('.product__prev');
	var current = $('.product__currentimage');
	var prev_source = preview.attr('src');
	var cur_source = current.attr('src');
	current.css('width',current.css('width'));
	preview.hover(
		function(){
			current.attr('src', prev_source);
		},
		function(){
			current.attr('src', cur_source);
		});
};


$('.product__value').keypress(function(event) {
	if (event.charCode < 48 || event.charCode > 57)
    return false;
});
let numvar = + $('.product__value').attr('value');
$('.product__value').keyup(function(){
	numvar = + $('.product__value').val();
	
});
$('.product__more').click(function(){
    if (numvar < 999) 
    numvar += 1;
    $(".product__value").val(numvar);
    
});
$('.product__less').click(function(){
    if (numvar > 1)
    numvar -= 1;
    $(".product__value").val(numvar);
    
});
$('.product__button--store').bind('click',function(e) {
	e.preventDefault();
	if (numvar == 1) 
		$.Zebra_Dialog('В корзину добавленa '+numvar+' позиция!');
	
	else {
		$.Zebra_Dialog('В корзину добавлено '+numvar+' позиций!');
	}
});
