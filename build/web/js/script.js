// all
const _$ = document.querySelector.bind(document);
const _$_$ = document.querySelectorAll.bind(document);

function preventDefaultSubmit() {
    //prevent default form
    var formlist = document.querySelectorAll('form');
    for (var form of formlist) {
        form.onsubmit = (e) => {
            e.preventDefault();
        }
    }
}

function handleAll() {

    //btn shoping card + btn avatar
    let shopingCardBtn = _$('#page-heading .shoping-card-title')
    let avatarBtn = _$('#page-heading .avatar-wrapper img')

    if (shopingCardBtn && avatarBtn) {
        shopingCardBtn.onclick = function () {
            this.parentElement.classList.toggle('onclick');
        }
        avatarBtn.onclick = function () {
            this.parentElement.classList.toggle('onclick');
        }

        document.onclick = (e) => {
            if (!e.target.closest('.shopping-card-wrapper')) {
                if (shopingCardBtn.parentElement.classList.contains('onclick')) {
                    shopingCardBtn.parentElement.classList.remove('onclick');
                }
            }
            if (!e.target.closest('.avatar-wrapper')) {
                if (avatarBtn.parentElement.classList.contains('onclick')) {
                    avatarBtn.parentElement.classList.remove('onclick');
                }
            }
        }
    }

}

// index.html 
function handleIndex() {
    // ==============slider-btn-click==============
    let sliderContainer = _$(".slider-containers");
    let sliderItem = _$(".slider-container");
    let sliderImg = _$_$(".slider-container .slider1");
    let size = sliderImg.length;
    let oneSlider = sliderItem.clientWidth / size;
    let dotBtns = _$_$(".dot-item");
    let counter = 1;

    for (let dotBtn of dotBtns) {
        // console.log(dotBtn.dataset.index)
        dotBtn.addEventListener("click", () => {
            counter = dotBtn.dataset.index;
            for (let dotBtnTemp of dotBtns) {
                dotBtnTemp.classList.remove("active");
            }
            dotBtn.classList.add("active");

            sliderItem.style.transition = "transform 0.4s ease-in-out";
            sliderItem.style.transform = `translateX(${-((2 * counter) * oneSlider)}px)`;
        })
    }

    //==================slider-touch-move=========
    let body = document.documentElement;
    let isPress = false;
    let startP, currentP;

    // an cai clone cuoi khi xuat hien
    sliderItem.style.transform = `translateX(${-(2 * oneSlider)}px)`;

    function getTranslateX() {
        var style = window.getComputedStyle(sliderItem);
        var matrix = new WebKitCSSMatrix(style.transform);
        return matrix.m41;
    }

    sliderContainer.addEventListener("mouseenter", () => {
        sliderContainer.style.cursor = "pointer";
    })

    sliderItem.addEventListener("mousedown", (e) => {
        isPress = true;
        startP = e.screenX - getTranslateX();
        sliderItem.style.transition = "none";
    })

    sliderItem.addEventListener("mouseup", (e) => {
        e.preventDefault();
        isPress = false;
        handleMouseUp(e);
        // changeDotBtnWhenMouseUp();
    })
    body.addEventListener("mouseup", (e) => {
        e.preventDefault();
        isPress = false;
        handleMouseUp(e);
        // changeDotBtnWhenMouseUp();
    })

    sliderItem.addEventListener("mousemove", (e) => {
        e.preventDefault();
        if (!isPress)
            return;
        currentP = e.screenX - startP;

        sliderItem.style.transform = `translateX(${currentP}px)`;
        handleMousemove(e);
    })

    body.addEventListener("mousemove", (e) => {
        e.preventDefault();
        if (!isPress)
            return;
        currentP = e.screenX - startP;

        sliderItem.style.transform = `translateX(${currentP}px)`;
        handleMousemove(e);
    })

    function handleMousemove(e) {
        if (getTranslateX() >= 0) {
            sliderItem.style.transform = `translateX(${-(size - 4) * oneSlider}px)`;
            startP = e.screenX - getTranslateX();
        }
        if (-getTranslateX() >= (sliderItem.clientWidth - 2 * oneSlider)) {
            sliderItem.style.transform = `translateX(${-(2) * oneSlider}px)`;
            startP = e.screenX - getTranslateX();
        }
    }

    function setDotActive(index) {
        for (let i = 0; i < dotBtns.length; i++) {
            dotBtns[i].classList.remove('active');
        }
        dotBtns[index - 1].classList.add('active');
    }

    function changeDotBtnWhenMouseUp() {
        // handel change dot btn
        if (getTranslateX() == (-2 * oneSlider) || getTranslateX() == (-3 * oneSlider) || getTranslateX() == (-8 * oneSlider) || getTranslateX() == (-9 * oneSlider)) {
            setDotActive(1);
        }
        if (getTranslateX() == (-4 * oneSlider) || getTranslateX() == (-5 * oneSlider)) {
            setDotActive(2);
        }
        if (getTranslateX() == (-6 * oneSlider) || getTranslateX() == (-7 * oneSlider) || getTranslateX() == (-1 * oneSlider) || getTranslateX() == (-0 * oneSlider)) {
            setDotActive(3);
        }
    }
    function handleMouseUp(e) {
        let halfOfWidth = oneSlider / 2;
        let i = 1;
        while (true) {
            if (-getTranslateX() > halfOfWidth * i) {
                i++;
                continue;
            }
            break;
        }
        sliderItem.style.transition = "transform 0.4s ease-in-out";

        // handlde transform
        if (i % 2 === 0) {
            // counter=i/2;
            sliderItem.style.transform = `translateX(${-(i) * halfOfWidth}px)`;
        } else {
            // counter=(i-1)/2;
            sliderItem.style.transform = `translateX(${-(i - 1) * halfOfWidth}px)`;
        }
    }

    // ================setInterval cho slide ================
    let startPSlide = -2 * oneSlider;
    sliderItem.addEventListener("transitionend", (e) => {
        changeDotBtnWhenMouseUp();
        startPSlide = getTranslateX();
        if (startPSlide == -(size - 2) * oneSlider) {
            startPSlide = -2 * oneSlider;
            sliderItem.style.transition = "none";
            sliderItem.style.transform = `translateX(${startPSlide}px)`;
        }
    })
    setInterval(() => {
        if (!isPress) {
            startPSlide -= oneSlider;
            sliderItem.style.transition = "transform 0.4s ease-in-out";
            sliderItem.style.transform = `translateX(${startPSlide}px)`;
        }
    }, 3000);

    // =======watch movies==============
    let btnControllers = _$_$('#page-content .btn-controller .btn');
    function filterMovies(selector) {
        let movieControlleds = _$_$('.btn-controller + .row .col-lg-3');  //nodelist

        for (let movieControlled of movieControlleds) {
            if (movieControlled.classList.contains(selector)) {
                movieControlled.style.display = 'block';
            } else
                movieControlled.style.display = 'none';
        }
    }
    ;
    filterMovies('top_rate');
    function btnRemoveClassActive() {
        for (let btnController of btnControllers) {
            if (btnController.classList.contains('active')) {
                btnController.classList.remove('active');
                break;
            }
        }
    }

    for (let btnController of btnControllers) {
        btnController.addEventListener("click", () => {
            btnRemoveClassActive();
            btnController.classList.add('active');
            let choice = btnController.dataset.choice;
            filterMovies(choice);
        })
    }


    // ========testmonials =================================
    let T_show = _$('.T-review-show');
    let T_container = _$('.T-review-container');
    let T_reviewers = _$_$('.T-reviewer');
    let T_size = T_reviewers.length;
    let T_oneReviewer = T_container.clientWidth / T_size;
    let T_sliderSpace = 0;

    let T_pressed = false;
    let T_interval = true;
    let T_startP, T_currentP;
    let T_body = document.documentElement;
    let T_dotItems = _$_$('.T-dot-item');
    var T_id;

    function T_getTranslateX() {
        var style = window.getComputedStyle(T_container);
        var matrix = new WebKitCSSMatrix(style.transform);
        return matrix.m41;
    }

    function T_moveSlide() {
        T_interval = true;
        T_sliderSpace += T_oneReviewer;
        T_container.style.transition = "transform 0.4s ease-in-out";
        T_container.style.transform = `translateX(${-(T_sliderSpace)}px)`;
    }
    // truot slide
    T_id = setInterval(T_moveSlide, 3000);

    function T_setDot(index) {
        for (let T_dotItem of T_dotItems) {
            if (T_dotItem.classList.contains("active")) {
                T_dotItem.classList.remove("active");
            }
        }
        T_dotItems[index - 1].classList.add("active");
    }
    // config dot + clear interval
    T_container.addEventListener('transitionend', (e) => {
        let space = -T_getTranslateX();
        T_sliderSpace = -T_getTranslateX();
        if (space === 0 || space === T_oneReviewer * (1)) {
            T_setDot(1);
        }
        if (space === T_oneReviewer * (2) || space === T_oneReviewer * (3)) {
            T_setDot(2);
        }
        if (space >= T_oneReviewer * (4)) {
            T_setDot(3);
            clearInterval(T_id)
            T_interval = false;
            return;
        }
        if (!T_interval) {
            T_interval = true;
            T_id = setInterval(T_moveSlide, 3000)
        }
    })

    // handle mouse touch
    T_container.addEventListener('mousedown', (e) => {
        e.preventDefault();
        T_pressed = true;
        T_startP = e.screenX - T_getTranslateX();
        T_container.style.transition = "none";
        if (T_interval) {
            clearInterval(T_id)
            T_interval = false;
        }
    })

    T_container.addEventListener('mousemove', T_handleMousemove);
    T_body.addEventListener("mousemove", T_handleMousemove);

    function T_handleMousemove(e) {
        e.preventDefault();
        if (!T_pressed)
            return;
        T_currentP = e.screenX - T_startP;
        T_container.style.transform = `translateX(${T_currentP}px)`;

        let y = T_getTranslateX();
        if (y >= 0) {
            T_container.style.transform = `translateX(${(300 * y) / (300 + y)}px)`;
            T_startP = e.screenX - y;
        }
        if (-y >= (T_container.clientWidth - T_show.clientWidth)) {
            let k = -y - (T_container.clientWidth - T_show.clientWidth);
            T_container.style.transform = `translateX(-${(T_container.clientWidth - T_show.clientWidth + (300 * k) / (k + 300))}px)`;
            T_startP = e.screenX - y;
        }
    }

    T_container.addEventListener("mouseup", T_handleMouseUp);
    T_body.addEventListener("mouseup", T_handleMouseUp);

    function T_handleMouseUp(e) {
        e.preventDefault();
        T_pressed = false;
        let halfOfWidth = T_oneReviewer / 2;
        let i = 1;
        while (true) {
            if (-T_getTranslateX() > halfOfWidth * i) {
                i++;
                continue;
            }
            break;
        }
        T_container.style.transition = "transform 0.4s ease-in-out";

        // handlde transform
        if (i % 2 === 0) {
            // counter=i/2;
            if (i >= 8)
                i = 8;
            T_container.style.transform = `translateX(${-(i) * halfOfWidth}px)`;
        } else {
            // counter=(i-1)/2;
            T_container.style.transform = `translateX(${-(i - 1) * halfOfWidth}px)`;
        }
        // console.log(i)
        if (!T_interval && T_sliderSpace < T_oneReviewer * (4)) {
            T_interval = true;
            T_id = setInterval(T_moveSlide, 3000)
        }
    }
    // handle when click dot btn
    for (let T_dotItem of T_dotItems) {
        T_dotItem.addEventListener('click', function () {
            T_setDot(T_dotItem.dataset.index);
            if (T_interval) {
                T_interval = false;
                clearInterval(T_id);
            }
            T_container.style.transform = `translateX(-${(T_dotItem.dataset.index - 1) * 2 * T_oneReviewer}px)`;
        })
    }
    
    //messs================
    let messIcon = _$('.page-controll-mess')
    let pageMess = _$('#page-mess')
    let controllClose = _$('.control-mess')

    controllClose.onclick = function () {
        pageMess.classList.toggle('display-mess')
    }

    messIcon.onclick = function () {
        pageMess.classList.toggle('display-mess')
    }
}

// login page
function handleLogin() {
    let formInputs = _$_$('input:not([type="checkbox"])');
    let showBtn = _$('.captcha-wrapper span');
    let closeLoginFailBtn = _$('.login-fail span');

    for (var formInput of formInputs) {
        formInput.onblur = function (e) {
            if (e.target.value) {
                this.parentElement.classList.add('has-text');
            } else
                this.parentElement.classList.remove('has-text');
        }
    }

    showBtn.onclick = function () {
        this.parentElement.parentElement.classList.toggle('none');
    }

    closeLoginFailBtn.onclick = function () {
        this.parentElement.classList.remove('show');
    }
}

// sign up page
function handleSignUp() {
    let formInputs = _$_$('input:not([type="checkbox"])');
    let agreeBtn = _$('input[type="checkbox"]');
    let submitBtn = _$('.form-submit');
    let agreeErrors = _$('.agree-error');
    let userInput = _$('input[name="username"]');
    let passInput = _$('input[name="password"]');
    let repassInput = _$('input[name="password_confirmation"]');
    let nextSpan1 = _$('.input_un');
    let nextSpan2 = _$('.input_pw');
    let nextSpan3 = _$('.re_password');

    for (var formInput of formInputs) {
        formInput.onblur = function (e) {
            if (e.target.value) {
                this.parentElement.classList.add('has-text');
            } else
                this.parentElement.classList.remove('has-text');
        }
    }

    userInput.oninput = function () {
        nextSpan1.innerHTML = '';
    }
    passInput.oninput = function () {
        nextSpan2.innerHTML = '';
    }
    repassInput.oninput = function () {
        nextSpan3.innerHTML = '';
    }

    submitBtn.onclick = (e) => {
        e.preventDefault();
        if (agreeBtn.checked) {
            const parameters = {
                username: userInput.value,
                password: passInput.value,
                password_confirmation: repassInput.value
            }
            sendData('signup', parameters)
            return;
        }
        agreeErrors.innerHTML = 'Agree Terms of Service to create a new account'
        agreeErrors.animate([
            {transform: 'translateX(-4px)'},
            {transform: 'translateX(4px)'}
        ], {
            duration: 200,
            iterations: 2,
        })
    }
}

// forgot pw page
function handleForgotPw() {
    let formInputs = _$_$('input:not([type="checkbox"])');
    let userInput = _$('input[name="username"]');
    let nextSpan1 = _$('.input_un');
    let agreeBtn = _$('input[type="checkbox"]');
    let submitBtn = _$('.form-submit');

    for (var formInput of formInputs) {
        formInput.onblur = function (e) {
            if (e.target.value) {
                this.parentElement.classList.add('has-text');
            } else
                this.parentElement.classList.remove('has-text');
        }
    }

    let agreeErrors = _$('.agree-error');
    let codeInput = _$('input[name="code"]');
    let passInput = _$('input[name="password"]');
    let repassInput = _$('input[name="password_confirmation"]');
    let nextSpan2 = _$('.input_pw');
    let nextSpan3 = _$('.re_password');

    if(codeInput)
        codeInput.oninput = function () {
            nextSpan1.innerHTML = '';
        }
    if(passInput)
        passInput.oninput = function () {
            nextSpan2.innerHTML = '';
        }
    if(repassInput)
        repassInput.oninput = function () {
            nextSpan3.innerHTML = '';
        }

    submitBtn.onclick = (e) => {
        e.preventDefault();
        if (agreeBtn.checked) {
            let parameters = {}
            if (userInput) {
                parameters = {
                    action: 'find-acc',
                    username: userInput.value
                }
            } else{
                parameters = {
                    action: 'get-forgot-pw',
                    username: codeInput.dataset.un,
                    code: codeInput.value,
                    password: passInput.value,
                    password_confirmation: repassInput.value
                }
            }
            sendData('forgot-pw', parameters)
            return;
        }
        agreeErrors.innerHTML = 'Agree Terms of Service to create a new account'
        agreeErrors.animate([
            {transform: 'translateX(-4px)'},
            {transform: 'translateX(4px)'}
        ], {
            duration: 200,
            iterations: 2,
        })
    }
}

// handle my-info
function handleMyInfo() {
    let inputFile = _$('input[type="file"]');
    let imgShow = _$('.PMI-wrapper img');

    inputFile.onchange = (e) => {
        const [file] = inputFile.files
        if (file) {
            imgShow.src = URL.createObjectURL(file)
        }
    }
}

// handle change password
function handleChangePassword() {
    let wrapper = _$('.error__mess-wrapper');
    let errorMess = _$('.error__mess-wrapper span');

    window.onload = (event) => {
        if (errorMess.innerHTML === '') {
            wrapper.style.display = 'none';
        }
    };
}

//handle movie-detail
function handleMovieDetail() {
    let readMoreBtn = _$('.IC-left .read-more');

    readMoreBtn.onclick = () => {
        let parentRM = readMoreBtn.closest('.IC-left');
        parentRM.classList.add('show');
    }
}

// handle-mv=======
function handleScroll(element, parentSelector) {
    let parentElement = element.closest(parentSelector);
    parentElement.classList.toggle('show')
    var content = element.nextElementSibling;
    if (content.style.maxHeight) {
        content.style.maxHeight = null;
    } else {
        content.style.maxHeight = content.scrollHeight + "px";
    }
}

function handleAdmin() {
    let btnMovieManagement = _$('.movie-side button')
    let btnAccountManagement = _$('.account-side button')
    let radioChoices = _$_$('input[type="radio"]')

    //handle sidebarScroll
    btnMovieManagement.onclick = () => {
        handleScroll(btnMovieManagement, '.movie-side')
    }
    btnAccountManagement.onclick = () => {
        handleScroll(btnAccountManagement, '.account-side')
    }

    //handle director, actor
    for (let radioChoice of radioChoices) {
        radioChoice.onclick = function (e) {
            let parentElement = this.closest('.form-group')
            parentElement.classList = `form-group row ${e.target.dataset.type}`
        }
    }

}

function handleFind(element, type) {
    let id = element.querySelector('th').innerHTML
    let fullName = element.querySelectorAll('td')[0].innerHTML
    let resultShow = element.closest('.form-group').querySelector('.result-wrapper')

    if (type !== 'genre') {
        let birth = element.querySelectorAll('td')[1].innerHTML
        let country = element.querySelectorAll('td')[2].innerHTML

        procesData(resultShow, type, id, fullName, birth, country)
    } else
        procesData(resultShow, type, id, fullName)
}

function handleAdd(element, type) {
    let addParent = element.closest('.Add-Nwrapper')
    let fullName = addParent.querySelectorAll('input')[0].value
    let resultShow = element.closest('.form-group').querySelector('.result-wrapper')

    if (type !== 'genre') {
        let birth = addParent.querySelectorAll('input')[1].value
        let country = addParent.querySelectorAll('input')[2].value

        procesData(resultShow, type, 'None', fullName, birth, country)
    } else
        procesData(resultShow, type, 'None', fullName)
}

function procesData(Pos, type, id, fullName, birth, country) {
    if (checkDuplicate(Pos, type, id, fullName, birth, country))
        return;
    let dataTmp = ``
    if (type !== 'genre') {
        dataTmp = `<p>${id}</p>
        <p>${fullName}</p>
        <p>${birth}</p>
        <p>${country}</p>`
    } else
        dataTmp = `<p>${id}</p>
            <p>${fullName}</p>`
    let data = `<div
            class="alert alert-warning alert-dismissible fade show custom-label-ip mt-3 result-item"
            role="alert">
            <div class="Result-infoWraper">
                ${dataTmp}
            </div>
            <button type="button" class="close custom-close" data-dismiss="alert"
                aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>`
    if (type == 'director')
        Pos.innerHTML = data
    else if (type == 'actor')
        Pos.innerHTML += data
    else if (type == 'genre')
        Pos.innerHTML += data
}

function checkDuplicate(Pos, type, id, fullName, birth, country) {
    let resultList = Pos.querySelectorAll('.result-item')
    let arr = Array.from(resultList).map((cur, index) => {
        let infoList = cur.querySelectorAll('.Result-infoWraper p')
        let infoResult = ''
        for (let infoItem of infoList) {
            infoResult += infoItem.innerHTML + '-'
        }
        return infoResult
    })

    if (type !== 'genre') {
        if (arr.includes(id + '-' + fullName + '-' + birth + '-' + country + '-'))
            return true;
    } else {
        if (arr.includes(id + '-' + fullName + '-'))
            return true;
    }

    return false;
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
function handleSubmitAddMovie(type) {
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
        for (let genreContainerData of genreContainedataBox) {
            genreData.push(getData(genreContainerData.querySelectorAll('p')))
        }

        let parameters = {movieName, realseYear, length, country, rating, price, src,
            description, directorData, genreData: genreData.join("|"), actorData: actorData.join("|"), action: 'add-movie'}

        if (type == 'add')
            sendData('admin-addmovie', parameters)
        else if (type == 'update') {
            parameters.movieId = _$('input[name="name"]').dataset.id
//            console.log(parameters);
            sendData('admin-handleUDmovie', parameters)
        }
    }
}

//movie-admin update-delete===
function handleGetDataUpdate(element) {
    let id = element.dataset.id
    window.location.href = "admin-handleUDmovie?action=update&id=" + id;
}

function handleGetDataDelete(element) {
    let id = element.dataset.id
    if (confirm("are U sure to delete this film?")) {
        window.location.href = "admin-handleUDmovie?action=delete&id=" + id;
    }
}