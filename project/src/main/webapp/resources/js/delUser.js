function delClick(e) {
	
	alert("삭제하시겠습니까?");
	alert(document.getElementById(e.getAttribute('id')).getAttribute('id'));
	
	let boardIdx = document.getElementById(e.getAttribute('id')).getAttribute('id');
	
	if (!confirm("삭제하시겠습니까?")){ // 아니오
		return;
	}else { // 예
	    $.ajax({
	        url: 'adminbDel'
	        , type: 'post'
	        , dataType: 'text'
	        , data: {
	        	boardIdx: boardIdx
	        },
	        success: function( re ){
	        	location.reload();
	        	console.log(re)
	        }
		});
	}
}