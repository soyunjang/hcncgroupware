var quickSearch = {
	findOtherEquipInfo: function(tEle) {
		console.log('findOtherEquipInfo', tEle, $('#' + tEle.id).data('callbackfun'));
		
		if(tEle.value != "") {
			var callbackFun = $('#' + tEle.id).data('callbackfun');
		
	    	var param = {
	    		ITEM_NO : tEle.value
	    	}
			getAjaxJsonData('findOtherItemInfo', param, callbackFun);
		}		
    }
    , findOtherDeptInfo: function(tEle) {
		console.log('findOtherEquipInfo', tEle, $('#' + tEle.id).data('callbackfun'));
		
		if(tEle.value != "") {
			var callbackFun = $('#' + tEle.id).data('callbackfun');
		
	    	var param = {
	    		DEPT_NO : tEle.value
	    	}
			getAjaxJsonData('findOtherDeptInfo', param, callbackFun);
		}
	}
}