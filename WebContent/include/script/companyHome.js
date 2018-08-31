function gift(index){
	alert(index);
	if(confirm("한 번 증정을 하고 난 후로는 취소를 할 수 없습니다. 그래도 진행하시겠습니까?")){
		// form submit
		$("#event_id").val(index);
		$("#gift_form").submit();
	}	
}