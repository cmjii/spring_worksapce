console.log("boardComment.js in");
console.log("bno>> : "+bnoVal);
//value값이 없을 때는 innertext로 가져오기

document.getElementById("cmtAddBtn").addEventListener('click',()=>{
    const cmtText =document.getElementById("cmtText").value;
    const cmtWriter = document.getElementById("cmtWriter").innerText; 
    if(cmtText==""||cmtText == null){
        alert("댓글을 입력해주세요")
        document.getElementById('cmtText').focus();
        return false;
    }else{
        let cmtData = {
            bno: bnoVal,
            writer: cmtWriter,
            content : cmtText
        };
        console.log(cmtData);
    }
})