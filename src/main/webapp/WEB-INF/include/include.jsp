<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
	$(document).ready(function(){
		leftMenuCreate();	// 왼쪽 메뉴 생성
		
		$("#logout").click(function(){
			getAjaxJsonData("logout", {}, "logoutCallBack");
		});
	});

	$(document).ajaxSend(function(event, request, settings) {
		request.setRequestHeader('AJAX', 'true'); // ajax 호출을  header에 기록
		// 생성된 ajax 함수가 아닌 일반 ajax사용 할때를 대비하여 코드추가
	});

	function logoutCallBack(data){
		location.href = "/";
	}
	
// 	function doNotReload(){
// 		//ctrl+N , ctrl+R
// 		// function F5
// 		if((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116)){
// 			event.keyCode = 0;
// 			event.cancelBubble = true;
// 			event.returnValue = false;
// 		}
// 	}

	// 새로고침 (ctrl+N, ctrl+R, F5) 불가 코드
// 	document.onkeydown = doNotReload;
	
	// 3단계 메뉴 구성
	function leftMenuCreate(){
		var leftUl = "<ul>";
		var userMenu = <c:out value='${MENU}' escapeXml = "false"/>;
		
		for(var i = 0; i < userMenu.length; i++){
			if(userMenu[i].MENU_GROUP == "GRP01"){
				if(leftUl != "<ul>"){
					if(userMenu[i - 1].MENU_GROUP != "GRP03"){
						leftUl += "</li></ul><ul>";
					} else{
						leftUl += "</li></ul></ul>";
					}
				}
				
				leftUl += '<li class="on"><a href="javascript:void(0);" title="' + userMenu[i].MENU_NAME + '" class="lnb-dep1">' + userMenu[i].MENU_NAME + '</a>';
			} else if(userMenu[i].MENU_GROUP == "GRP02"){
				if(userMenu[i - 1].MENU_GROUP == "GRP01"){
					leftUl += '<ul class="lnb-dep2" style="display: block;">';
				} else if(userMenu[i - 1].MENU_GROUP == "GRP03"){
					leftUl += '</ul></li></ul><ul class="lnb-dep2" style="display: block;">';
				}
				
				if(userMenu[i].PROG_PATH != "" || userMenu[i].PROG_PATH != "undefined"){
					leftUl += '<li><a href="javascript:void(0);" id="' + userMenu[i].PROG_PATH.replace("/", "") + '" title="' + userMenu[i].MENU_NAME + '" class="lnb-dep2-1">' + userMenu[i].MENU_NAME + '</a>';
				} else{
					leftUl += '<li><a href="javascript:void(0);" title="' + userMenu[i].MENU_NAME + '" class="lnb-dep2-1">' + userMenu[i].MENU_NAME + '</a>';
				}
			} else{
				if(userMenu[i - 1].MENU_GROUP == "GRP02"){
					leftUl += '<ul class="lnb-dep3">';   
				}
				
				if(userMenu[i].id != ""){
					leftUl += '<li><a href="javascript:void(0);" id="' + userMenu[i].PROG_PATH.replace("/", "") + '" title="' + userMenu[i].MENU_NAME + '" onclick="initFrame(this);">' + userMenu[i].MENU_NAME + '</a></li>';
				} else{
					leftUl += '<li><a href="javascript:void(0);" title="' + userMenu[i].MENU_NAME + '">' + userMenu[i].MENU_NAME + '</a></li>';
				}
			}
		}
				
		leftUl += "</li></ul>";
		
		$(".lnb-menu").append(leftUl);
	}

	//:::::::::::::::::::::::::: LNB Menu
	(function($){
		var lnbUI = {
				click : function(target, speed, location) {
					var _self = this
						, $target = $(target);
					_self.speed = speed || 300;
					
					$target.each(function(){
						if(findChildren($(this))){
							return;
						}
					});
					
					function findChildren(obj){
						return obj.find('> ul').length > 0;
					}
					
					$target.on('click','a', function(e){
						e.stopPropagation();
						var $this = $(this);
						var menu = this;
						
						// nextAll() : 다음에 위치한 모든 엘리먼트를 배열로 반환
						// siblings() : 모든 형제 요소를 선택
						var $depthTarget = $this.nextAll(), $siblings = $this.parent().siblings();
						var subMenu = $this.eq(1)[0];
// 						$this.parent('li').find('ul li').removeClass('on');
						
						if($depthTarget.css('display') == 'none'){								
							if(!$('.allmenu-btn').hasClass('allmenu-btn on')){
								// 전체메뉴 활성화
								$('.allmenu-btn').addClass('on');	// 전제메뉴 탭 활성화
								$('.allmenu').css('height', '94vh');
								$('.allmenu').css('display', 'block');
								$('.lnb-menu').css('display', 'block');
								$('.lnb-dep2').css('display', 'block');
							}
								
							_self.activeOn($this, location, menu, subMenu);		// _self : 현재 윈도우창(프레임)에 그대로 링크된 웹페이지 열기
							$depthTarget.slideDown(_self.speed);		// slideDown : 요소를 아래쪽으로 나타나게 하는 메서드
						} else if($depthTarget.css('display') == 'block') {
							if(location == undefined){
								$depthTarget.slideUp(_self.speed);
								_self.activeOff($this);
							} else {
								var tabs = $('.tab-contents').children('div').length;
								for(var d = 0; d < tabs; d++){
									_self.activeOn($this, location, menu, subMenu);
									$depthTarget.slideDown(_self.speed);
								}
							}								
							
						} else {
							$depthTarget.slideUp(_self.speed);			// slideUp : 요소를 위쪽으로 사라지게 하는 메서드
							_self.activeOff($this);
						}
					});
				}
				, activeOff : function($target){
					$target.parent().removeClass('on');
					$target.siblings().find(".lnb-dep3").css("display", "none");
					
					var len = $(".popup").length;
					for(var i = 0; i < len; i++){
						$('#' + $(".popup")[i].id + '').hide();
					}
				}
				, activeOn : function($target, location, menu){
					$target.parent().addClass('on');
				}
				
		}
		$(function(){
			lnbUI.click('.lnb-menu li' , 300);
		});
	}(jQuery));
</script>
</html>