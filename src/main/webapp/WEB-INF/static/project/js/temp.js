const mkCheckedItm = function(arr) { //체크된 아이템들을 아래에 출력
    let list = '<div style="display:flex;flex-direction: column">'
    for(itm of arr){
        list += '<div style="display:flex;flex-direction: row; align-items: center">'
        list += '<div class="left">' //이 div는 왼쪽에 두고, 오른쪽에는 수량 조절기능을 넣음
        list += '<ul>'
        list += '<li style="display:flex;flex-direction:column">'
        list += '<p>'+itm.item_name+'</p>'
        list += '<p>'+itm.item_option_type+'</p>'
        if(itm.item_option!=null) {
            let temp = toArray(itm.item_option);
            list += '<ul>'
            for(opt of temp){
                list += '<li class="opt">' + opt + '</li>'
            }
            list += '</ul>'
        }
        list += '</li>'
        list += '</ul>'
        list += '</div>' //div.left
        list += '<div class="right">'
        list += '<div style="display:inline-block">'
        list += '<button type="button" class="minus" onclick="minus(this)" disabled><i class="fas fa-regular fa-minus"></i></button>'
        list += '<input class="itmNum" type="number" style="width:50px" value="1" onkeyup="numCheck(this)">'
        list += '<button type="button" class="plus" onclick="plus(this)"><i class="fas fa-regular fa-plus"></i></button>'
        list += '</div>' //button close
        list += '<button type="button" onclick="removeBtn(this)" data-item_id='+itm.item_id+'>삭제</button>'
        list += '</div>' //right close
        list += '</div>'
    }
    list += '</div>'

    return list;
}
