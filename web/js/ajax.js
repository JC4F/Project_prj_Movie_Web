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

    if (element.closest('.RC-pagination a'))
        parameters.page = element.dataset.index;

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
function handleInputSubmit(event, element) {
    if (event.key == 'Enter') {
        event.preventDefault();
        handleAjaxMain(element);
    }
}

//shop-cart==========
// ket hop voi ajax de tranh nhieu request nen moi lam the nay,
// phan delete thi goi ajax
// handle with shop-card
function handleCheckAll(element) {
    // let cardItems = $$('.shopping-card-item')
    let checkItems = _$_$('input[name="item-index"]')

    for (let checkItem of checkItems) {
        checkItem.checked = element.checked;
    }
    handleMoneys()
}
function handleCheckItem(element) {
    let checkAll = _$('#markAll')
    let checkItems = _$_$('input[name="item-index"]')
    handleMoneys()
    for (let checkItem of checkItems) {
        if (!checkItem.checked) {
            checkAll.checked = false;
            return;
        }
    }
    checkAll.checked = true
}
function handleDelete(element) {
    deleteTarget = element.closest('.shopping-card-item')
    deleteParent = deleteTarget.closest('.shopping-card-list')
    deleteParent.removeChild(deleteTarget)
    handleMoneys()
    handleCountItem()
}
function handleMoneys() {
    let moneyPos = _$('.shopping-card-total span')
    let checkItems = _$_$('input[name="item-index"]')
    let stringMoneys = [], result
    for (let checkItem of checkItems) {
        if (checkItem.checked) {
            let parentElement = checkItem.closest('.shopping-card-item')
            if (parentElement.style.display != 'none') {
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
function handleCountItem() {
    let countPos = _$('.SCL-heading span')
    let items = _$_$('.shopping-card-item')
    let num = 0;
    for (let item of items) {
        if (item.style.display != 'none')
            num += 1;
    }
    countPos.innerHTML = `${num} items`
}

//for search input with only js
function handldeSearchCart(element) {
    let items = _$_$('.shopping-card-item');
    let searhValue = element.value.toUpperCase();
    for (let item of items) {
        let name = item.querySelector('.card-film-info a').innerHTML.toUpperCase()
        let director = item.querySelector('.card-film-info p').innerHTML.toUpperCase()
        let dateCreated = item.querySelector('.card__film-created p').innerHTML.toUpperCase()
        let price = item.querySelector('.price-delete-wrapper p').innerHTML.toUpperCase()
        let isMatch = false;
        if (name.indexOf(searhValue) > -1 || director.indexOf(searhValue) > -1 || dateCreated.indexOf(searhValue) > -1 || price.indexOf(searhValue) > -1)
            isMatch = true;
        if (isMatch)
            item.style.display = ""
        else
            item.style.display = "none"
    }
    handleMoneys()
    handleCountItem()
}
function handleAjaxShopCart(element) {
    $.ajax({
        url: "/Movie_Web/shop-cart",
        type: "post", //send it through get method
        data: {
            id: element.dataset.id
        },
        success: function (data) {
//            console.log(JSON.stringify(data));
            let dataRes = data
            if (dataRes == "add") {
                //for btn in movie detaiil
                if (element.closest('.btn_add-to-cart')) {
                    let textEle = element.querySelector('span')
                    textEle.innerHTML = 'CANCEL CART'
                } else
                    element.innerHTML = 'CANCEL CART'
            }
            if (dataRes == "delete") {
                if (element.innerHTML == 'CANCEL CART') {
                    element.innerHTML = 'ADD TO CART'
                } else {
                    //for btn in movie detaiil
                    if (element.closest('.btn_add-to-cart')) {
                        let textEle = element.querySelector('span')
                        textEle.innerHTML = 'ADD TO CART'
                    }
                    //for trah in shop-card
                    else if (element.closest('.trash_delete-cart'))
                        handleDelete(element)
                }
            }
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}


//movie-detail============
function handleAjaxLoadCmt(element) {
    let numOfCmt = document.querySelectorAll('.comment-list .comment-item').length;
    let filmId = element.dataset.id;
    let parameters = {numOfCmt, filmId, action: 'load'}

    $.ajax({
        url: "/Movie_Web/movie-detail",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            // khai bao bien kieu nay ~ JSON.stringify()
            let dataString = JSON.stringify(data)
            let dataLoadPos = document.querySelector('.comment__item-wrapper')
            if (dataString.indexOf('no-more') > -1) {
//                console.log(dataString);
                let newData = dataString.replace("|no-more", "")
                dataLoadPos.innerHTML += JSON.parse(newData)

                let elementPar = element.closest('.comment-list')
                elementPar.removeChild(element)
            } else {
                dataLoadPos.innerHTML += data
            }
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}
function handleAjaxAddCmt(e, element) {
    if (e.key == 'Enter') {
        let inputCmt = element.value;
        let uiId = element.dataset.uiid
        let mId = element.dataset.mid
        let parameters = {inputCmt, uiId, mId, action: 'add'}

//        console.log(parameters)
        $.ajax({
            url: "/Movie_Web/movie-detail",
            type: "post", //send it through get method
            data: parameters,
            success: function (data) {
                let dataLoadPos = document.querySelector('.comment__item-wrapper')
                dataLoadPos.innerHTML = data + dataLoadPos.innerHTML
                element.value = ''
                CountCmtAfterAdd()
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
}
function CountCmtAfterAdd() {
    let countPos = document.querySelector('.MD__main-comment h1 span')
    let preCount = countPos.innerHTML
    countPos.innerHTML = Number(preCount) + 1
}

//admin-add-movie=============
function handleAjaxSearchDirector(element) {
    let action = "search-director"
    let inputSearch = element.value
    let parameters = {action, inputSearch}

    $.ajax({
        url: "/Movie_Web/admin-addmovie",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            var row = document.querySelector("#director-data .customm-tableBody");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function handleAjaxSearchActor(element) {
    let action = "search-actor"
    let inputSearch = element.value
    let parameters = {action, inputSearch}

    $.ajax({
        url: "/Movie_Web/admin-addmovie",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            var row = document.querySelector("#actor-data .customm-tableBody");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function handleAjaxSearchGenre(element) {
    let action = "search-genre"
    let inputSearch = element.value
    let parameters = {action, inputSearch}

    $.ajax({
        url: "/Movie_Web/admin-addmovie",
        type: "post", //send it through get method
        data: parameters,
        success: function (data) {
            var row = document.querySelector("#genre-data .customm-tableBody");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function getData(element) {
    let result = ''
    for (let i = 0; i < element.length; i++) {
        result += element[i].innerHTML
        result += i !== element.length - 1 ? ':' : ''
    }
    return result
}
function sendData(path, parameters, method = 'post') {

    const form = document.createElement('form');
    form.method = method;
    form.action = path;
    document.body.appendChild(form);

    for (const key in parameters) {
        const formField = document.createElement('input');
        formField.type = 'hidden';
        formField.name = key;
        formField.value = parameters[key];

        form.appendChild(formField);
    }
    form.submit();
}
function handleSubmitAddMovie() {
    let btnSubmit = _$('.col-sm-10 > button')

    btnSubmit.onclick = () => {
        let movieName = _$('input[name="name"]').value
        let realseYear = _$('input[name="RealseYear"]').value
        let length = _$('input[name="Length"]').value
        let country = _$('input[name="Country"]').value
        let rating = _$('input[name="Rating"]').value
        let price = _$('input[name="Price"]').value
        let src = _$('input[name="Src"]').value
        let description = _$('input[name="Description"]').value

        let directorContainerdata = _$_$('#director-data .Result-infoWraper p')
        let directorData = getData(directorContainerdata)

        let actorContainedataBox = _$_$('#actor-data .Result-infoWraper')
        let actorData = []
        for (let actorContainerData of actorContainedataBox) {
            actorData.push(getData(actorContainerData.querySelectorAll('p')))
        }

        let genreContainedataBox = _$_$('#genre-data .Result-infoWraper')
        let genreData = []
        for(let genreContainerData of genreContainedataBox){
            genreData.push(getData(genreContainerData.querySelectorAll('p')))
        }
        
        let parameters = {movieName, realseYear, length, country, rating, price, src, 
            description, directorData, genreData: genreData.join("|"), actorData: actorData.join("|"), action:'add-movie'}

//        console.log(parameters) 
        
        sendData('admin-addmovie', parameters)
    }
}