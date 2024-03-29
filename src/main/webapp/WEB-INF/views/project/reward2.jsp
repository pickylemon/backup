<%--
  Created by IntelliJ IDEA.
  User: lemon
  Date: 2024-02-01
  Time: 오후 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/a26f9e7c74.js" crossorigin="anonymous"></script>
    <style>
        .hidden {
            display : none;
        }
        .pjBox {
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }
        .pjBox .pjForm {
            display: flex;
            flex-direction: column;
        }
        input {
            outline : none;
        }
        div.multiOpt, div.singleOpt {
            display : none;
        }
        li:hover {
            cursor: pointer;
        }
        .input {
            width: 80%;
        }
        .dropdown {
            width: 29%;
            padding: 5px;
        }
    </style>
</head>
<body>
<div class="pjSubTb">
    <button type="button" id="gftBtn">
        선물
    </button>
    <button type="button" id="itmBtn">
        아이템
    </button>
</div>

<div class="pjWrap">
    <div class="pjCont">
        <!-- reward.jsp 요청시, 등록된 아이템이 하나도 없다면 보여주는 화면 -->
<%--        <c:set var="itemList" value="${itemList}"/>--%>
<%--        <c:if test="${empty itemList}"> <!--JS로 처리하고 싶었지만 안된다 -->--%>
            <div class="pjBox str" id="str">
                <div>
                    <div>
                        <div>
                            선물 만들기
                        </div>
                    </div>
                    <div>
                        <button type="button" id="strBtn">아이템을 먼저 만들어주세요</button>
                        <div>
                            <h2>후원 가치를 높이는 선물</h2>
                            <br>
                            <p>아직 등록된 아이템이 없습니다.</p>
                            <br>
                            <p>선물은 후원자에게 프로젝트의 가치를 전달하는 수단입니다. </p>
                            <p>아이템을 등록 후 다양한 금액대로 여러 개의 선물을 만들어주세요. </p>
                            <p>펀딩 성공률이 높아지고, 더 많은 후원 금액을 모금할 수 있어요.</p>
                        </div>
                    </div>
                </div>
            </div>
<%--        </c:if>--%>

        <!-- 선물 만들기 페이지 -->
       <!--역시 JS로 하고 싶었지만 -->
            <div class="pjBox gift" id="gift">
                <div class="pjInfo">
                    <div>
                        <div>
                            <p>내가 만든 선물 count</p>
                            <div></div>
                        </div>
                    </div>
                </div>
                <div class="pjForm">
                    <div>
                        <div>
                            <p>선물 만들기</p>
                            <p>선물은 후원자에게 프로젝트의 가치를 전달하는 수단입니다. </p>
                            <p>다양한 금액대로 여러 개의 선물을 만들어주세요. 펀딩 성공률이 높아지고, 더 많은 후원 금액을 모금할 수 있어요.</p>
                        </div>
                        <section>
                            <div>
                                <p>선물 아이템</p>
                                <p>선물을 구성하는 아이템을 추가해주세요.</p>
                            </div>
                            <div>
                                <div class="dropdown" style="border:0.1px solid black; cursor:pointer">
<%--                                    <input style="border:none;outline:none;margin:0" type="text" inputmode="text" size=22 placeholder="아이템을 선택해주세요(클릭)" disabled>--%>
                                    아이템을 선택해주세요(클릭) <i class="fas fa-regular fa-chevron-down"></i>
                                </div>
                                <div id="itmDropdown">
<%--                                        <ul>--%>
<%--                                            <li>러닝화 (객관식 옵션) </li>--%>
<%--                                            <li>만년필 (주관식 옵션) </li>--%>
<%--                                            <li>감자칩 (옵션 없음) </li>--%>
<%--                                        </ul>--%>
                                </div>
<%--                                <div class="footer">--%>
<%--                                    <p>0개의 아이템 선택</p>--%>
<%--                                </div>--%>
<%--                                    <button type="button">선택완료</button>--%>
                            </div>
                        </section>
                        <section>
                            <div>
                                <p>선물 이름</p>
                                <p>어떤 아이템으로 구성되어있는지 쉽게 알 수 있도록 선물 이름을 붙여주세요</p>
                            </div>
                            <div>
                                <input type="text" inputmode="text" placeholder="방향제+엽서 세트 A" value="">
                                <p>0/50</p>
                            </div>
                        </section>
                        <section>
                            <div>
                                <p>수량제한</p>
                                <p>선착순으로 선물을 제공하는 경우 총 선물 수량을 설정해주세요.</p>
                            </div>
                            <div>
                                <div>
                                    <label for="lim">있음</label>
                                    <input name="limit" id="lim" type="radio" value="수량제한 있음">
                                    <input type="text">개
                                </div>
                                <label for="unlim">없음</label>
                                <input name="limit" id="unlim" type="radio" value="수량제한 없음">
                            </div>
                        </section>
                        <section>
                            <div>
                                <p>1인당 최대 선택 제한</p>
                                <p>후원자 1명이 이 선물을 몇 개까지 선택할 수 있는지 설정해주세요.</p>
                            </div>
                            <div>
                                <div>
                                    <label for="maxLim">있음</label>
                                    <input name="maxLimit" id="maxLim" type="radio" value="1인당 선택 제한 있음">
                                    <input type="text">개
                                </div>
                                    <label for="maxUnlim">없음</label>
                                    <input name="maxLimit" id="maxUnlim" type="radio" value="1인당 선택 제한 없음">
                            </div>
                        </section>
                        <section>
                            <p>예상전달일</p>
                            <div>
                                <p>2024년 4월 2일</p>
                                <hr>
                                <div>
                                    <p>결제 종료일(2024-03-29)로부터</p>
                                    <div>
                                        <input type="text" inputmode="numeric">일 뒤
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- <section></section> 배송여부는 제외함 -->
                        <section>
                            <div>
                                <p>선물금액</p>
                                <p>선물 제작 및 전달에 필요한 모든 비용(포장비, 배송비 등)이 포함된 금액으로 입력해주세요.</p>
                            </div>
                            <div>
                                <input type="text" inputmode="numeric" placeholder="1000원 이상의 금액을 입력하세요."> 원
                            </div>
                        </section>
                        <div class="btnWrap">
                            <button type="button">초기화</button>
                            <button type="button">저장</button>
                        </div>
                    </div>
                </div>
            </div> <!--gift-->





        <!--아이템 만들기 페이지-->
        <div class="pjBox item" id="item">
            <div class="pjInfo">
                <div>
                    <div>내가 만든 아이템 count</div>
                    <div id="itemList">
                    <c:forEach var="itemDto" items="${itemList}">
<%--                        <div style="cursor:pointer" onclick=removeItm(itemArr,this)>--%>
                        <div style="cursor:pointer" onclick=removeItm(itemArr,this) data-item_id='${itemDto.item_id}' data-pj_id='${itemDto.pj_id}'>
<%--                        <input type="hidden" value="${itemDto.item_id}"/>--%>
<%--                        <input type="hidden" value="${itemDto.pj_id}"/>--%>
                        <p style="font-weight: 600">${itemDto.item_name}</p>
                        <p>${itemDto.item_option_type}</p>
                        <c:if test="${not empty itemDto.item_option}">
                            <ul>
                            <c:forEach var="item_option" items="${itemDto.item_option}">
                                <li>${item_option}</li>
                            </c:forEach>
                            </ul>
                        </c:if>
                        </div>
                    </c:forEach>
                    </div>
                </div>
            </div>
            <div class="pjForm">
                <div>
                    <div>
                        <p>아이템 만들기</p>
                        <p>아이템은 선물에 포함되는 구성 품목을 말합니다. 특별한 물건부터 의미있는 경험까지 선물을 구성할 아이템을 만들어 보세요.</p>
                    </div>
                    <section>
                        <p>아이템 이름</p>
                        <div>
                            <input id="itmName" class="input" type="text" placeholder="아이템 이름을 50자 이내로 입력해주세요.">
                        </div>
                        <div></div>

                    </section>
                    <section>
                        <p>옵션 조건</p>
                        <div>
                            <div>
                                <label for="noOpt">없음</label>
                                <input type="radio" name="optType" id="noOpt" value="옵션 없음">
                            </div>
                            <div>
                                <label for="singleOpt">주관식</label>
                                <input type="radio" name="optType" id="singleOpt" value="주관식 옵션">
                            </div>
                            <div>
                                <label for="multiOpt">객관식</label>
                                <input type="radio" name="optType" id="multiOpt" value="객관식 옵션">
                            </div>
                        </div>
                    </section>
                        <!--객관식-->
                    <section>
                        <div class="radio multiOpt">
                            <div>
                                <p>옵션 항목</p>
                                <p>입력완료 후 Enter키를 누르면 옵션 항목이 생성됩니다.</p>
                            </div>
                            <div>
                                <textarea class="input" placeholder="최소 2개 이상의 옵션항목을 입력해주세요.(100자 이내) *예시* 블랙-230mm, 블랙-240mm"></textarea> <!--엔터키를 치면 아래에 버튼이 생성됨-->
                            </div>
                            <div>
                            </div>
                            <section>
                                <div id="multiResult">
                                </div>
                            </section>
                        </div>
                        <div></div>
                        <!--주관식-->
                        <div class="radio singleOpt">
                            <div>
                                <textarea class="input" placeholder="예) 각인할 메세지를 입력하세요."></textarea>
                            </div>
                            <div></div>
                        </div>
                    </section>
                    <div class="btnWrap">
                        <button type="button" class="init">초기화</button>
                        <button type="button" class="save">저장</button> <!-- input과 textarea가 모두 입력되어야 활성화되게 -->
                    </div>
                </div>
            </div>
        </div> <!--Item-->
    </div>
</div>
<script>
    let optArr = []; //window.onload 안에 있으면 함수에서 못 갖다 쓴다.
    let itemArr = [];

    window.onload = function(){
        //아이템 페이지의 요소들
        const itemPage = document.querySelector("#item"); //아이템 페이지 div단락
        const giftPage = document.querySelector("#gift"); //선물 페이지 div단락
        const strPage = document.querySelector("#str"); //선물 만들기 첫 페이지
        const strBtn = document.querySelector("#strBtn"); //아이템 만들기 버튼(아이템 페이지로 이동)
        const gftBtn = document.querySelector("#gftBtn"); //상단 선물페이지 이동 버튼
        const itmBtn = document.querySelector("#itmBtn"); //상단 아이템페이지 이동 버튼
        const itmName = document.querySelector("#itmName"); //아이템 이름 input
        const radioElems = document.querySelectorAll("input[type=radio]"); //라디오버튼
        const initBtn = document.querySelector("button.init");//초기화버튼
        const saveBtn = document.querySelector("button.save");//저장버튼

        //선물 페이지의 요소들
        const dropdown = document.querySelector(".dropdown");



        //window.onload시 #itemList에 있는 item수를 세고
        const cnt = document.querySelectorAll("#itemList div");
        console.dir(cnt);
        mkHidden([itemPage]);//이건 cnt와 상관없이
        if(cnt.length===0){
            mkHidden([giftPage]); //아이템이 하나도 없으면 선물시작페이지(strPage)가 뜨도록 giftPage는 숨김처리
         } else{
            mkHidden([strPage]);
        }
            // else {
        //     mkHidden()
        // }

        <%--console.dir(${itemList.});--%>
        //동작 안함. 이유를 생각하기!!!

        if(strBtn!==null){
            strBtn.addEventListener("click",function(){
                // giftPage.style.display = "none";
                location.href = "#item";
                mkHidden([giftPage, strPage]);
                mkVisible(itemPage);
            })
        }
        // mkHidden([itemPage]);
        // mkVisible(itemPage);



        // if(itemList==null){ //만든 아이템이 하나도 없으면 아이템 만들기 유도 페이지를 로드
        //    mkHidden([giftPage, itemPage]);
        //     strBtn.addEventListener("click",function(){
        //         // giftPage.style.display = "none";
        //         location.href = "#item";
        //         mkHidden([giftPage, strPage]);
        //         mkVisible(itemPage);
        //     })
        // } else { //만든 아이템이 있다면 바로 선물 페이지로 이동
        //     mkVisible(giftPage);
        //     mkHidden([itemPage,strPage]);
        // }

        gftBtn.addEventListener("click",function(){
            const cnt = document.querySelectorAll("#itemList div");
            console.dir(cnt); //
            //alert(cnt.length);
            <%--// 원래는 ${itemList.size()}로 비교하려했는데 실시간 반영이 안되더라.
            비동기라서 화면 전환이 되는ㄱㅔ 아니다보니--%>
            if(cnt.length===0){ //등록된 아이템이 없으면 선물 페이지를 보여주지 않는다.
                mkHidden([itemPage, giftPage])
                location.href = "#str"
                mkVisible(strPage);
            } else {
                mkHidden([itemPage, strPage])
                location.href = "#gift"
                mkVisible(giftPage);
            }
            // const pjBox = document.querySelector(".pjBox");
            // console.dir(pjBox);
            // //location.href = "#gift";
            // location.href = "#"+pjBox.id;
            // alert(pjBox.id);
            // // strPage.style.display = "none";
            // // giftPage.style.display = "block";
            // mkHidden([itemPage]);
            // //mkVisible(giftPage);
            // mkVisible(pjBox);
        })
        itmBtn.addEventListener("click",function(){
            const cnt = document.querySelectorAll("#itemList div");
            console.dir(cnt); //
            location.href = "#item";
            if(cnt.length===0){ //등록된 아이템의 수에 따라 숨길 페이지가 다르다.
                mkHidden([strPage])
            } else {
                mkHidden([giftPage])
            }
            mkVisible(itemPage);
        })

        itmName.addEventListener("input",function(){
            lengthCheck(this,50,'아이템 이름');
        })
        itmName.addEventListener("keyup",makeBlur);

        // initBtn.addEventListener("click",function(){ //초기화 버튼
        //     itmName.value = "";
        //     itmName.parentElement.nextElementSibling.innerHTML = '<p>0/50</p>'
        //     const checked = document.querySelector("input[type=radio]:checked")
        //     checked.checked = false; //라디오버튼 체크 해제
        //
        //     const checkedDiv = document.querySelector("."+checked.id);
        //     checkedDiv.style.display = "none"; //해당 라디오버튼의 div 안보이게
        //
        //     const checkedTxt = checkedDiv.querySelector("textarea");
        //     checkedTxt.value = ""; //해당 textarea의 값 비우기
        //     // console.dir(txt);
        //
        //     optArr.length = 0; //배열도 초기화
        //     showList(mkOptList(optArr));
        // })

        initBtn.addEventListener("click",init);

        // saveBtn.addEventListener("click", function(){
        //     if(!validCheck()) {
        //         alert('필수 입력 항목을 전부 입력해주세요');
        //         return;
        //     }
        //     //유효성 검사 통과하면 ajax로 보내기
        // })

        saveBtn.addEventListener("click", function(){
        // $(".save").click(function(){
            if(!validCheck()) {
                alert('필수 입력 항목을 전부 입력해주세요');
                return;
            }
            const item_option_type = $('input[type=radio]:checked');
            let item_option;
            if(item_option_type.val() !== '옵션 없음') {
                item_option = optArr.toString()
            }
            // } else if (item_option_type.val() === '주관식') {
            //     item_option = $('.'+item_option_type.id+" textarea").val();
            // }
            // console.dir('---save---')
            // console.dir(item_option_type.val());
            // console.dir(item_option);
            // console.dir(itmName.value);
            $.ajax({
                type:'POST',
                url:'/project/item',
                headers: {"content-type":"application/json"},
                data: JSON.stringify({'item_name':itmName.value, 'item_option_type':item_option_type.val(), 'item_option':item_option}),
                success: function(result){
                    alert('아이템이 성공적으로 등록되었습니다.');
                    init(); //기존 입력창을 초기화한다.
                    // itemArr.push(result);
                    itemArr = result; //Java List타입 객체를 JS 배열에 넣을 수 있는건가?! 이게 되네.
                    console.dir(itemArr);
                    // const itemList = $('#itemList'); //여기에 오타있나? 제이쿼리로 가져오면 왜 못읽지.
                    const itemList = document.querySelector('#itemList');
                    console.dir(itemList)
                    const list = mkItmList(itemArr);
                    console.dir(list);
                    showList(list,itemList);
                    console.dir(result);
                },
                error: function(result){alert('아이템 등록에 실패했습니다.')}
            });
        });

        //모든 라디오input에 이벤트 걸기
        // 라디오 input 선택이 바뀌면
        //1. 모든 라디오 input들과 매칭되는 모든 div의 display여부와 이전 input들이 초기화된다. (일괄 적용)
        //2. checekd된 라디오 input(딱 하나)에 대하여 매칭되는 div를 display block하고, 해당 textarea에 글자수 체크 이벤트 걸기
        for(elem of radioElems){
            elem.addEventListener("change", function(){ //라디오 선택이 달라지면 해당되는 이전 입력들이 초기화 된다.
                const inputs = document.querySelectorAll(".radio"); //매칭된 div 요소들을 가져와서
                //const inputs = document.querySelectorAll("."+elem.id); // 이렇게 하면 안됨.
                inputs.forEach(input => { //div요소 각각에 대해
                    //input.style.display = 'block';
                    const textarea = input.querySelector("textarea"); //자식 textarea를 가져와서
                    // if(textarea !== null){ // textarea요소가 있으면(즉, 옵션없음이 아니면)
                    textarea.value = "";
                    textarea.parentElement.nextElementSibling.innerHTML = '' //초기화 작업
                    //
                    // textarea.addEventListener("input", function() {
                    //     lengthCheck(this, 100, "옵션");
                    // })
                    optArr.length = 0; //배열도 초기화
                    const multiResult = document.querySelector("#multiResult");
                    showList(mkOptList(optArr),multiResult);
                    input.style.display = "none";
                }); //라디오 input과 매칭되는 textarea를 모두 값을 지우고 보이지 않게 한다.
                // 라디오를 여러번 누를 경우를 대비해서.
                // alert("."+this.id);

                const input = document.querySelector("."+this.id); //선택된 요소에 대해서 적용
                if(input!==null) {//'옵션없음'에 해당하지 않으면 (즉, 매칭되는 div요소가 존재)
                    input.style.display = "block";
                    const textarea = input.querySelector("textarea");
                    textarea.addEventListener("input", function () {
                        lengthCheck(this, 100, "옵션");
                        // optArr.push(textarea.value.trim());
                        // alert(optArr);
                        // console.dir(optArr);
                    })
                }
            })
           //여기 공통 코드 묶어서 정리하기
           //  if(elem.id==="singleOpt"){ //
           //      const txt = document.querySelector("."+elem.id);
           //      const textarea = txt.querySelector("textarea");
           //      optArr.push(textarea.value.trim());
           //      console.log(optArr);
           //  }
            if(elem.id==="multiOpt"){
                const txt = document.querySelector("."+elem.id);
                const textarea = txt.querySelector("textarea");
                textarea.addEventListener("keyup", function(){
                        // optArr.push(textarea.value);
                        // mkOptList(optArr);
                        // const resultList = document.querySelector("#multiResult>div");
                        // showList(mkOptList(optArr),resultList);
                        // alert(this);
                        enterEvent(this, optArr);
                })
            }
        }//아이템 페이지에 거는 이벤트들

        //선물 페이지에 거는 이벤트들
        dropdown.addEventListener("click",function(){
            const pj_id = document.querySelector('#itemList').querySelector('div').getAttribute('data-pj_id');
            const itmDropdown = document.querySelector('#itmDropdown');
            const div = itmDropdown.querySelector('div');

            //선택버튼이 눌렸으면 체크상태가 유지된 채로 dropdown이 적용되고
            if(div!==null){ //div는 만들어진 상태인데,
                if(itmDropdown.classList.contains('optChecked')){ //선택완료 버튼이 눌린 상태이고,
                    if(div.style.display==='none'){
                        const checkedElems = document.querySelectorAll('input[type=checkbox]:checked');
                        console.dir(checkedElems);

                        $.ajax({
                            type:'GET',
                            url:'/project/item/'+pj_id,
                            headers: {"content-type":"application/json"},
                            success: function(result){
                                // alert('성공');
                                //console.dir(result) 가져온 리스트를 확인한다.
                                const arr = result;
                                // const list = mkItmDrop(result) //List인 result를 바로 넣으면 작동 안함.
                                // Java의 List는 어떻게 JS의 배열로 받아지는걸까............?
                                const list = mkItmDrop(arr);
                                console.dir(list);
                                showList(list, itmDropdown); //드롭다운으로 선택한 아이템 보여주기
                                const checkboxes = document.querySelectorAll('input[type=checkbox]');
                                console.dir(checkboxes);
                                for(checkbox of checkboxes){ //원래 체크 되어 있던 요소들을 다시 체크 해주기
                                    for(elem of checkedElems){
                                        if(checkbox.getAttribute('data-item_id')===elem.getAttribute('data-item_id')){
                                            checkbox.checked = true;
                                        }
                                    }
                                }
                                // div.classList.add('optChecked');
                                document.querySelector('.footer').innerHTML = '<p>'+checkedElems.length+'개의 아이템 선택</p>'
                                //이걸 안붙이면 반영이 안되더라......
                            },
                            error: function(result){alert('실패')}
                        })
                    } else {
                        div.style.display = 'none';
                    }


                } else { // div는 있고 선택완료버튼은 누른적 없으면
                    div.remove();
                }
            } else{ //div자체가 없으면-
            $.ajax({
                type:'GET',
                url:'/project/item/'+pj_id,
                headers: {"content-type":"application/json"},
                success: function(result){
                    // alert('성공');
                    //console.dir(result) 가져온 리스트를 확인한다.
                    const arr = result;
                    // const list = mkItmDrop(result) //List인 result를 바로 넣으면 작동 안함.
                    // Java의 List는 어떻게 JS의 배열로 받아지는걸까............?
                    const list = mkItmDrop(arr);
                    console.dir(list);
                    showList(list, itmDropdown); //드롭다운으로 선택한 아이템 보여주기

                },
                error: function(result){alert('실패')}
            })
            }
        })



    }// window.onload

    const tglHidden = function(elements){
        elements.forEach(element => {
                element.classList.toggle("hidden");
        })
    }
    const mkHidden = function(elements){
        elements.forEach(element => {
            if(element!=null)
                element.style.display = "none";
        })
    }
    const mkVisible = function(element){
        if(element!=null)
            element.style.display = "flex";
    }

    const lengthCheck = function(elem, maxLength, string){
        elem.maxLength = maxLength;
        // elem.trim().maxLength = maxLength;
        const len = elem.parentElement.nextElementSibling
        // const len = elem.nextElementSibling;
        // alert(len);
        elem.style.border = "1.5px solid red";
        len.style.color = "red"
        len.style.fontSize = 'small';
        // alert(elem.value)
        if(elem.value.trim().length===0){
            elem.focus();
            len.innerHTML = '<p>'+string+'을 입력해주세요.<p>'
            len.style.color = "red"
        } else if(elem.value.trim().length > maxLength){
            elem.focus();
            len.innerHTML = '<p>'+string+'은 '+maxLength+'자 이내여야 합니다.<p>'

        } else {
            elem.style.border = "1.7px solid black";
            len.innerHTML = '<p>'+ elem.value.trim().length + '/'+maxLength+'</p>';
            len.style.color = "black";
        }
    }
    const makeBlur = function(){
        if(window.event.keyCode==13){
            // window.event.preventDefault();
            this.blur();
            this.style.border = "1px solid black";
        }
    }

    const enterEvent = function(elem,optArr){
        if(window.event.keyCode===13){
            //window.event.returnValue=false; //?
            // window.event.preventDefault();
            if(elem.value.trim()==="") {
                alert('옵션을 입력해주세요.')
                elem.value = "";
                return;
            }
            optArr.push(elem.value.trim());
            const list = mkOptList(optArr);
            const multiResult = document.querySelector("#multiResult");
            showList(list,multiResult);

            elem.value = "";
            elem.parentElement.nextElementSibling.innerHTML = '<p>0/100</p>'


        }
    }

    //엔터키를 누르면, optArr에 아이템을 추가하고 아이템 리스트를 보여주는 함수를 호출
    const mkOptList = function(optArr){
        let list = '<ul>'
        for(opt of optArr){
            list += '<li onclick=remove(optArr,this)>'+opt+'</li>'
        }
        list += '</ul>'
        return list;
    }
    const mkItmList = function(itmArr){
        let list = ''
        for(itm of itmArr){
            list += '<div style="cursor:pointer" onclick=removeItm(itemArr,this) data-item_id='+itm.item_id+' data-pj_id='+itm.pj_id+'>'
            //list += '<input type="hidden" value='+itm.item_id+'>' //item_id를 hidden으로 가져온다.
            //list += '<input type="hidden" value='+itm.pj_id+'>' //hidden으로 넣지 말고 data- attribute에 넣을까..? 굳이 input태그를 하나 더 쓰는게 맞을까?
            list += '<p style="font-weight: 600" >'
            list += itm.item_name + '</p>'
            list += '<p>'+ itm.item_option_type + '</p>'
            list += '<ul>'
            if(itm.item_option!=null){ //옵션없음이 아닌 경우(객관식, 주관식 옵션)
                const opts = toArray(itm.item_option);
                for(opt of opts){
                    list += '<li>'+opt+'</li>'
                }
            }
            list += '</ul>'
            list += '</div>'
        }
        return list;
    }

    const mkItmDrop = function(arr){
        let list = '<div>'
            list += '<ul>'
        for(itm of arr){
            list += '<li>'
            list += '<input type="checkbox" onchange="changeFoot()" data-item_id='+itm.item_id+'>'
            list += '<span>' + itm.item_name +' ('+itm.item_option_type+') </span>'
            list += '<em>0개의 선물에 포함됨</em>'
            list += '</li>'
        }
        list += '</ul>'
        list += '<div class="footer"><p>0개의 아이템 선택</p></div>'
        list += '<button type="button" onclick="optionCheck(this)">선택완료</button>'
        list += '</div>'
        return list;
    }

    const changeFoot = function(){ //체크박스의 체크 상태에 따라 footer에 찍히는 문자열을 바꾸는 메서드.
        const footer = document.querySelector('.footer');
        const checked = document.querySelectorAll('input[type=checkbox]:checked')
        const length = checked.length;
        footer.innerHTML = '<p>'+ length + '개의 아이템 선택</p>'
    }

    const optionCheck = function(elem){
        const checkedElems = document.querySelectorAll('input[type=checkbox].checked');
        const itmDropdown = document.querySelector('#itmDropdown');
        for(elem of checkedElems){
            elem.classList.add('checkedElem');
        }
        const div = elem.parentElement;
        // div.classList.add('optChecked');

        //div.parentElement.classList.add('optChecked');
        itmDropdown.classList.add('optChecked');
        // 아이템 선택 드롭다운이 접힌다.
        div.style.display = 'none';


        //아래쪽에 선택한 아이템의 상세가 뜬다 + 수량 선택 버튼이 생김

          ////아이템 목록 중 체크한 아이템 목록이 해당 선물에 속한 아이템이 됨.
        //선택완료 버튼을 누르면 드롭다운에도 checked가 계속 반영됨.


    }


    const toArray = function(string){
        let arr=[];//아이템 옵션을 담을 배열
        if(!string.includes(',')) {
            arr.push(string); //주관식의 경우에는 단순히 문자열을 넣기만
        } else{
            arr = string.split(','); //객관식인 경우는 쉼표로 나누어서 넣기
        }
        return arr;
    }

    const showList = function(list,elem){
        elem.innerHTML = list
        // console.dir(optArr);
    }
    const removeItm = function(itemArr,elem){
        if(!confirm("이 아이템을 삭제하시겠습니까? 삭제하면 해당 아이템이 포함된 *개의 선물에서도 삭제됩니다.")) return;
        //ajax로 컨트롤러를 통해 db에서 아이템 삭제해야 후 리스트를 다시 불러와서 보여줘야함.
        // const item_id = elem.querySelector("input[type=hidden]").value;
        const item_id = elem.getAttribute('data-item_id');
        alert(item_id);
        // alert(item_id);
        $.ajax({
            type:'DELETE',
            url:'/project/item?item_id='+item_id,
            headers: {"content-type":"application/json"},
            // data: JSON.stringify({'item_id':item_id}),
            success: function(result){
                alert('아이템이 성공적으로 삭제되었습니다.');
                elem.remove(); //아이템 목록에서 삭제
                console.log("removeItm");
                console.dir(result);
                itemArr = result; //Java List타입 객체를 JS 배열에 넣을 수 있는건가?! 이게 되네.
                console.dir(itemArr);
                // const itemList = $('#itemList'); //여기에 오타있나? 제이쿼리로 가져오면 왜 못읽지.
                const itemList = document.querySelector('#itemList');
                const list = mkItmList(itemArr);
                showList(list,itemList);
            },
            error: function(result){alert('아이템 삭제에 실패했습니다.')}
        });
    }



    const remove = function(arr,elem){ //옵션이 담기거나, 아이템이 담긴 배열
        if(!confirm('옵션을 삭제하시겠습니까?')) return;
        //배열에서 삭제
        const index = arr.indexOf(elem.innerHTML);
        alert("index="+index);
        arr.splice(index,1);
        //요소 삭제
        elem.remove();
    }

    const validCheck = function(){
        // 이게 최선일까??
        const checked = document.querySelector('input[type=radio]:checked');
        let textarea;
        const length = itmName.value.trim().length;
        console.log(length);
        // if(!(0<length&&length<51)) {
        //     alert('아이템 이름의 글자수를 50자 이내로 맞춰주세요.')
        // }
        if(checked === null) return false; // 라디오 옵션을 아무것도 체크하지 않으면 false
        console.log(checked);
        if(checked.value!=='옵션 없음'){
            textarea = document.querySelector("."+checked.id).querySelector('textarea');
            console.log(textarea);
            // alert(textarea); elem테스트용
        }
        if(length===0) return false; // 아이템 이름을 입력 안하면 false
        if(checked.value==='객관식 옵션' && optArr.length<2) return false; //아이템 이름을 입력해도 객관식 조건을 다 입력하지 않으면 false
        // if(checked.value==='주관식' && textarea.value.trim().length === 0) return false; //아이템 이름을 입력해도 주관식 조건을 다 입력하지 않으면 false
        if(checked.value==='주관식 옵션'){
            optArr.push(textarea.value.trim());
            console.log(optArr);
            if(optArr.length !== 1) return false; //주관식일 경우, 저장 버튼을 누를 때 배열에 넣는다.
        } //아이템 이름을 입력해도 주관식 조건을 다 입력하지 않으면 false


        return true;
    }

    const init = function(){
        itmName.value = "";
        itmName.parentElement.nextElementSibling.innerHTML = '<p>0/50</p>'
        const checked = document.querySelector("input[type=radio]:checked")
        checked.checked = false; //라디오버튼 체크 해제

        const checkedDiv = document.querySelector("."+checked.id);
        if(checkedDiv !== null){
            checkedDiv.style.display = "none"; //해당 라디오버튼의 div 안보이게
            const checkedTxt = checkedDiv.querySelector("textarea");
            checkedTxt.value = ""; //해당 textarea의 값 비우기
            // console.dir(txt);

        }
        optArr.length = 0; //배열도 초기화
        const multiResult = document.querySelector("#multiResult");
        showList(mkOptList(optArr),multiResult);
    }


</script>
</body>
</html>



