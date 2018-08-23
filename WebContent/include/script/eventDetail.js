$(document).ready(function() {
	
	
	
	
});

function recommend(index){
	if(confirm("한 번 추천을 하고 난 후로는 취소를 할 수 없습니다. 그래도 진행하시겠습니까?")){
		alert("야호");
		// form submit
		$("#input_heart").val(index);
		$("#event_form").submit();
	}
}