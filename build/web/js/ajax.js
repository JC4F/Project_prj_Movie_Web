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

function handleInputSubmit(element){
    console.log(element);
}