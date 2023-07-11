var lnBtn = 1;

$(document).ready(function () {
	tab();
	modal();
	popup();
	filebox();
    searchbox();
    searchboxHover();
    
	//User
	$(".user-name").click(function(){
		$(".user-info").toggle();
	});
	
	$(".user-info").mouseleave(function(){
		$(this).hide();
	});
		
	// lnbMove 스크립트
	$(".menubar").click(function(){
		if(lnBtn == 1){	//lnb메뉴가 닫혔있을때
			$(".menubar").css("left","0px").removeClass("fold");
			$(".lnb-wrap").css("width", 0);
			$(".lnb-menu").css("display", "none");
			$(".openpage").css({"width":"calc(100% - 0px)", "margin-left":"0px"});
			$(".sub-container-wrap").css("width", "calc(100% - 0px)");
			$(".footer-wrap").css("width", "calc(100% - 0px)");
			$(".lnb-top-btn").css("display","none");
			$(".mymenu-wrap").css("display","none");
			lnBtn = 0;
		}
		else if (lnBtn == 0){	// 열리고 닫을때
			$(".menubar").css("left","275px").addClass("fold");
			$(".lnb-wrap").css("width", "275px");
			$(".lnb-menu").css("display", "block");
			$(".openpage").css({"width":"calc(100% - 275px)", "margin-left":"275px"});
			$(".sub-container-wrap").css("width", "calc(100% - 275px)");
			$(".footer-wrap").css("width", "calc(100% - 275px)");
			$(".lnb-top-btn").css("display","block");
			
			if($(".lnb-top-btn ul .mymenu.on").length > 0){
				$(".allmenu .lnb-menu").hide();
				$(".mymenu-wrap").show();
			}
			lnBtn =  1;
		}
	});
	
	//:::::::::::::::::::::::::: 탭메뉴 (전체메뉴) 스크립트
	$(".allmenu-btn").click(function(){
		$(".allmenu .lnb-menu").show();
		$(".mymenu-wrap").hide();
		
		$(".lnb-top-btn ul .mymenu").removeClass('on');
		$(".lnb-top-btn ul .mymenu a").removeClass('on');
		
		$(".lnb-top-btn ul .allmenu-btn").addClass('on');
		
		$(".lnb-wrap .allmenu").css("display","block");
		$(".lnb-wrap .allmenu .lnb-dep2").css("display","block");
	});
	
	//::::::::::::::::::::::::::: Tab Menu
	 function tab(e, num) {
	     var num = num || 0;
	     var menu = $(".tab-wrap > ul").children();
	     var con = $(".tab-cont-wrap").children();
	     var select = $(menu).eq(num);
	     var i = num;

	     select.addClass('on');
	     con.eq(num).show();

	     menu.click(function () {
	         if (select !== null) {
	             select.removeClass("on");
	             con.eq(i).hide();
	         }

	         select = $(this);
	         i = $(this).index();

	         select.addClass('on');
	         con.eq(i).show().addClass('on');
	         
	         var tableWrap = con.eq(i).find(".table-wrap");
	         
	         for(var j = 0; j <tableWrap.length; j++){
	        	 var tw = $(tableWrap[j]);
	        	 var tabelId = tw.children().first()[0].id.replace("gbox_", "");
	        	 $("#" + tabelId).jqGrid( 'setGridWidth', tw.width(), true);
	         }
	     });
	 }
});

//::::::::::::::::::::::::::: 검색 상세보기   
function searchbox() {
	$(document).on('click', '.btn-open', function(e) {
     	console.log('.btn-open > click > e', e);
        if($(this).hasClass('on') == false){        	
            $('.btn-open').addClass('on');
    		$(".search-wrap").addClass('on');
            $(".search-wrap").addClass('on-fix');
        }else{
            $('.btn-open').removeClass('on');
            $(".search-wrap").removeClass('on');
            $(".search-wrap").removeClass('on-fix');
        };
	});
}

function searchboxHover() {
	$(document).on('mouseenter', '.search-wrap', function(e) {
     	console.log('.search-wrap > mouseenter > e', e);
     	
     	if($('.srch-btn').find($('.srch-btn ul li a')).hasClass('btn-open') == true){
     		
	     	$(".search-wrap").addClass('on');
	    	$(".search-wrap").mouseleave(function(){
	    		$(".search-wrap").removeClass('on');
	    	});
     	}
     	
	});
}

//::::::::::::::::::::::::::: Sub Tab Menu
 function subtab(){
     $('.sub-tab-wrap > ul > li > a').click(function(){
         var tab_id = $(this).attr('data-tab');
         $('.sub-tab-wrap > ul > li > a').removeClass('on');
         $('.sub-tab-cont-wrap > div').removeClass('on');
         $(this).addClass('on');
         $("."+tab_id).addClass('on');
     })
 }
 
//:::::::::::::::::::::::::: Modal Popup
function modal() {
	$("a[id^=modal]").click(function(){
		var flag = this.id.substring(this.id.indexOf("_") + 1, this.id.length);
		var modalName = this.id.substring(0, this.id.indexOf("_"));
		
		if(flag == "open"){
			popReset(modalName);
			$("#" + modalName).show();
		}
		else{
			$("#" + modalName).hide();
		}
	});
};

//:::::::::::::::::::::::::: Alert Popup
  function popup() {
      /*$('.btn-popup-open').click(function () {
          $('.popup-wrap').addClass("active");
          return false;
      });
      $('.btn-close').click(function () {
          $('.popup-wrap').removeClass("active");
          return false;
      });
      */
  }
  
//:::::::::::::::::::::::::: preview images
function filebox() {
	var fileTarget = $('.file-box .upload-hd');
	
	fileTarget.on('change', function () { // 값이 변경되면 
		if (window.FileReader) { // modern browser 
			var filename = $(this)[0].files[0].name;
		}
		else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
		}
		
		//추출한 파일명 삽입 
		$(this).siblings('.upload-nm').val(filename);
	});
	
	var imgTarget = $('.upload-hd');
	
	imgTarget.on('change', function () {
		var imgBox = $('.preview-img');
		imgBox.children('.upload-display').remove()
		
		if (window.FileReader) {
			//image 파일만
			if (!$(this)[0].files[0].type.match(/image\//)){
				return;
			}
			
			var reader = new FileReader();
			
			reader.onload = function (e) {
				var src = e.target.result;
				imgBox.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb"></div></div>');
			}
			reader.readAsDataURL($(this)[0].files[0]);
		}
		else {
			$(this)[0].select();
			$(this)[0].blur();
			
			var imgSrc = document.selection.createRange().text;
			imgBox.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
			
			var img = $(this).siblings('.upload-display').find('img');
			img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
		}
	});
}