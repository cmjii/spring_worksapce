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
        postCommentToServer(cmtData).then(result=>{
            console.log(result);
            if(result === "1"){
                alert("댓글이 등록되었습니다.");
                getCommentList(bnoVal);
            }
        })
    }
})

//비동기 통신 구문
// const url == 목적지 경로
// post : 데이터를 보낼 때 (생성,삽입)
// get : 데이터를 받을 때 (조회) => 생략 가능
// put : 수정 (보내지 않은 값을 null처리)
// petch : 수정 (보내지 않은 값을 유지) -> 잘 사용되지 않음
// delete
// header는 무조건 객체로 보내야 됨(객체 끝에는 , 찍지 않음)
// resp(변수명임 알아서 설정) == destpage 라고 생각 
async function postCommentToServer(cmtData){
    try {
        const url = "/comment/post";
        const config={
            method:"post",
            headers:{
                "content-type":"application/json; charset=utf-8"
            },
            body:JSON.stringify(cmtData)
        };
        const resp = await fetch(url,config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function spreadCommentListFromServer(bno){
    try {
        const resp = await fetch("/comment/"+bno);
        const result = resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}
// 댓글 뿌리는 함수
function getCommentList(bno){
    spreadCommentListFromServer(bno).then(result=>{
        console.log(result);
        const div = document.getElementById("accordionExample");
        if(result.length > 0){
            div.innerHTML = "";
            for(let i =0; i<result.length; i++){
                let add = `<div class="accordion-item">`;
                add+=`<h2 class="accordion-header">`;
                add+=`<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${i}" aria-expanded="true" aria-controls="collapse${i}">`;
                add+=`no.${result[i].cno} ${result[i].writer} ${result[i].reg_date} </button></h2>`;
                add+=`<div id="collapse${i}" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">`;
                add+=`<div class="accordion-body">`;
                add+=`<button type="button" data-cno="${result[i].cno}" class="btn btn-outline-secondary btn-sm cmtModBtn">수정</button>`;
                add+=`<button type="button" data-cno="${result[i].cno}" class="btn btn-outline-danger btn-sm cmtDelBtn">삭제</button>`;
                add+=`<input type="text" value="${result[i].content}" class="form-control cmtText">`;
                add+=`</div></div></div>`;
                div.innerHTML += add;
            }
        }else{
            div.innerHTML = `<div class="accordion-body">댓글이 없습니다.</div>`;
        }
    })
}

//삭제
async function removeCommentListFromServer(cnoVal){
    try {
        const url = "/comment/"+cnoVal;
        const config ={
            method:"delete"
        }
        const resp = await fetch(url,config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

//수정
async function updateCommentToServer(cmtData){
    try {
        const url = "/comment/modify";
        const config = {
            method: "put",
            headers: {
                'content-type':'application/json; charset=utf-8'
            },
            body: JSON.stringify(cmtData)
        }
        const resp = await fetch(url,config);
        const result = resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

//closest : .나를 기준으로 가장 가까운 걸 찾아주세요.
document.addEventListener('click',(e)=>{
    console.log(e.target);
    if(e.target.classList.contains('cmtDelBtn')){
        //필요한 cno변수값을 얻기
        let cnoVal = e.target.dataset.cno;
        console.log(cnoVal);
        removeCommentListFromServer(cnoVal).then(result=>{
            if(result === "1"){
                alert("댓글 삭제 성공");
                getCommentList(bnoVal);
            }
        })
    }
    if(e.target.classList.contains('cmtModBtn')){
        let cnoVal = e.target.dataset.cno;
        let div = e.target.closest('div');
        let cmtText = div.querySelector(".cmtText").value;
        let cmtData = {
            cno:cnoVal,
            content:cmtText
        };
        console.log(cmtData);
        updateCommentToServer(cmtData).then(result=>{
            if(result=== "1"){
                alert("댓글 수정 성공");
                spreadCommentListFromServer(bnoVal);
            }
        })
    }
})


    