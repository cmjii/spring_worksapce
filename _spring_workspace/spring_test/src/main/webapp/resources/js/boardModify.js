document.addEventListener('click',(e)=>{
    console.log(e.target);
    if(e.target.classList.contains('file-x')){
        let uuidVal = e.target.dataset.uuid;
        console.log(uuidVal);
        let li = e.target.closest("li");
        removeFile(uuidVal).then(result=>{
            if(result === "1"){
                alert("삭제성공");
                li.remove();
            }
        })
    }
})
 
 
 async function removeFile(uuidVal){
    try {
        const url = "/board/"+uuidVal;
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

