document.addEventListener('click',(e)=>{
    console.log(e.target);
    if(e.target.classList.contains('file-x')){
        let uuidVal = e.target.dataset.uuid;
        console.log(uuidVal);
       // let li = e.target.closest("li");
        removeFile(uuidVal).then(result=>{
            if(result === "1"){
                alert("삭제성공");
                e.target.closest('li').remove(); //li삭제
                location.reload();
                //li.remove();
            }else{
                alert("파일 삭제 실패");
            }
        })
    }
})
 //classList => 자바스크립트에서 제공하는 객체 (클래스 안에 내용들을 훑어본다는 뜻 (자바 리스트 객체로 생각 X))
 //click 하는 객체를 e로 받아줌 get어쩌고ID안쓰면 전체적으로 선택되는 거 
 //위에 함수는 하나만이 아닌 클릭 되는 것 마다 e로 받아주는 것
 async function removeFile(uuidVal){
    try {
        const url = "/board/"+uuidVal;
        const config ={
            method:"delete"
        }
        const resp = await fetch(url,config);
        const result = await resp.text(); //resp값을 text로 가져옴
        return result;
    } catch (error) {
        console.log(error);
    }
 }

