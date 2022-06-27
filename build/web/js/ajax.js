function handelAjax() {
    let paid = document.querySelector("input[name='isPaid']");
    let select = document.querySelector(".RC-search-header select");
    let input = document.querySelector(".RC-search_wrapper input");
    console.log(select.value);
    console.log(input.value);
    let value = paid.checked;
    $.ajax({
        url: "/Movie_Web/search-movie",
        type: "post", //send it through get method
        data: {
            isPaid: value,
            selectSearch: select.value,
            inputSearch: input.value
        },
        success: function (data) {
            var row = document.querySelector(".right-content");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function handleAjaxPag(element){
    let paid = document.querySelector("input[name='isPaid']");
    let select = document.querySelector(".RC-search-header select");
    let input = document.querySelector(".RC-search_wrapper input");
//    let pags = document.querySelectorAll(".RC-pagination a:not(.active)");
//    console.log(select.value);
//    console.log(input.value);
//    console.log(pags);
    let value = paid.checked;
//    console.log(element.dataset.index);
    $.ajax({
        url: "/Movie_Web/search-movie",
        type: "post", //send it through get method
        data: {
            page: element.dataset.index,
            isPaid: value,
            selectSearch: select.value,
            inputSearch: input.value
        },
        success: function (data) {
            var row = document.querySelector(".right-content");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}