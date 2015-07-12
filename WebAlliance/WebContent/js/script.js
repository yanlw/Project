$(function(){
	$('#slideshow').cycle({
        fx:     'fade',
        speed:  'slow',
        timeout: 5000,
        pager:  '#slider_nav',
        pagerAnchorBuilder: function(idx, slide) {
        return '#slider_nav li:eq(' + (idx) + ') a';
        }
    });
	$('.bx03_02 ul li').each(function(i,v) {
		var str='<span class="num">'+(i+1)+'</span>'+$(this).html();
		$(this).html(str)
		if(i<3){
		  $(this).find('span').addClass('org')	
			
		}
        
    });
	$('.bx03_03 ul li').each(function(i,v) {
		var str='<span class="num">'+(i+1)+'</span>'+$(this).html();
		$(this).html(str)
		if(i<3){
		  $(this).find('span').addClass('org')	
			
		}
		
        
});
	
	$('.reg .accept i').click(function(){
	   if(parseInt($(this).attr('ind'))){
		   $(this).addClass('rd_act'); 
		   $(this).attr('ind',0)
		}else{
		   $(this).removeClass('rd_act');
		   $(this).attr('ind',1)
			
	    }	
	})
	
	
	
	
	
	
	
	
	









	
})