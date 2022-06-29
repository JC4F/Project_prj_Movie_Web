//movie==========
function handleAjaxMain(element) {
//    console.log(element);
    let textTypeOfFilm = "";
    let paid = document.querySelector("input[name='isPaid']");
    let select = document.querySelector(".RC-search-header select");
    let input = document.querySelector(".RC-search_wrapper input");
    let selectSort = document.querySelector("select[name='sort-select']");
    let xTypeOfFilm = document.querySelectorAll("input[name='typeOfFilm']:checked");
    let xTypeOfFilmTmp = Array.from(xTypeOfFilm);

    xTypeOfFilmTmp.forEach((type, index) => {
        textTypeOfFilm += type.value;
        if (index != xTypeOfFilm.length - 1)
            textTypeOfFilm += ",";
    })

    let parameters = {
        typeOfFilm: textTypeOfFilm,
        selectSort: selectSort.value,
        isPaid: paid.checked,
        selectSearch: select.value,
        inputSearch: input.value
    }
    
    if(element.closest('.RC-pagination a')) parameters.page = element.dataset.index;

    $.ajax({
        url: "/Movie_Web/search-movie",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            var row = document.querySelector(".right-content");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function handleInputSubmit(event, element){
    if(event.key == 'Enter'){
        event.preventDefault();
        handleAjaxMain(element);
    }
}

//shop-cart==========
// ket hop voi ajax de tranh nhieu request nen moi lam the nay,
// phan delete thi goi ajax
// handle with shop-card
function handleCheckAll(element){
    // let cardItems = $$('.shopping-card-item')
    let checkItems = _$_$('input[name="item-index"]')

    for(let checkItem of checkItems){
        checkItem.checked = element.checked;
    }
    handleMoneys()
}
function handleCheckItem(element){
    let checkAll = _$('#markAll')
    let checkItems = _$_$('input[name="item-index"]')
    handleMoneys()
    for(let checkItem of checkItems){
        if(!checkItem.checked) {
            checkAll.checked = false;
            return;
        }
    }
    checkAll.checked = true
}
function handleDelete(element){
    deleteTarget = element.closest('.shopping-card-item')
    deleteParent = deleteTarget.closest('.shopping-card-list')
    deleteParent.removeChild(deleteTarget)
    handleMoneys()
    handleCountItem()
}
function handleMoneys(){
    let moneyPos = _$('.shopping-card-total span')
    let checkItems = _$_$('input[name="item-index"]')
    let stringMoneys = [], result
    for(let checkItem of checkItems){
        if(checkItem.checked){
            let parentElement = checkItem.closest('.shopping-card-item')
            if(parentElement.style.display != 'none'){
                let moneyPosTmp = parentElement.querySelector('.price-delete-wrapper p')
                stringMoneys.push(moneyPosTmp.innerHTML)
            }
        }
    }
    result = stringMoneys.reduce((pre, current) => {
        return pre + (Number(current.slice(1)))
    }, 0)
    moneyPos.innerHTML = `$${result}`;
}
function handleCountItem(){
    let countPos = _$('.SCL-heading span')
    let items = _$_$('.shopping-card-item')
    let num=0;
    for(let item of items){
        if(item.style.display != 'none') num += 1;
    }
    countPos.innerHTML = `${num} items`
}

//for search input with only js
function handldeSearchCart(element){
    let items = _$_$('.shopping-card-item');
    let searhValue = element.value.toUpperCase();
    for(let item of items){
        let name = item.querySelector('.card-film-info a').innerHTML.toUpperCase()
        let director = item.querySelector('.card-film-info p').innerHTML.toUpperCase()
        let dateCreated = item.querySelector('.card__film-created p').innerHTML.toUpperCase()
        let price = item.querySelector('.price-delete-wrapper p').innerHTML.toUpperCase()
        let isMatch = false;

        if(name.indexOf(searhValue) > -1 || director.indexOf(searhValue) > -1 || dateCreated.indexOf(searhValue) > -1 || price.indexOf(searhValue) > -1)
            isMatch = true;
        if(isMatch)
            item.style.display = ""
        else
            item.style.display = "none"
    }
    handleMoneys()
    handleCountItem()
}

function handleAjaxShopCart(element){
    $.ajax({
        url: "/Movie_Web/shop-cart",
        type: "post", //send it through get method
        data: {
            id: element.dataset.id
        },
        success: function (data) {
//            console.log(JSON.stringify(data));
            let dataRes = data
            if(dataRes == "add") element.innerHTML = 'CANCEL CART'
            if(dataRes == "delete") {
                if(element.innerHTML == 'CANCEL CART'){
                    element.innerHTML = 'ADD TO CART'
                }
                else {
                    handleDelete(element)
                }
            }
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}
