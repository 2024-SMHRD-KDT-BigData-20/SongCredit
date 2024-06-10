$(document).ready(function() {
    console.log("Document ready");
    fetchAllData();

    $('#prevBtn').click(function() {
        slide(-1);
    });

    $('#nextBtn').click(function() {
        slide(1);
    });
});

let currentSlide = 0;
const itemsPerPage = 6;

function fetchAllData() {
    console.log("Fetching all data");
    $.when(a(cpath + "/chart", "json", "get"),
           a(cpath + "/topnewsList", "json", "get")).done(
           function(chartData, newsData) {
               console.log("Data fetched successfully");
               callback(chartData[0], newsData[0]);
           }).fail(function() {
        alert("데이터를 가져오는데 실패했습니다.");
        console.error("Failed to fetch data");
    });
}

function a(url, dataType, type) {
    console.log("AJAX request to: " + url);
    return $.ajax({
        url: url,
        type: type,
        dataType: dataType
    });
}

function callback(chartData, newsData) {
    console.log("Callback function");
    updateChartList(chartData);
    updatenewsList(newsData);
}

function updateChartList(chartData) {
    const container = $('#gridContainer');
    let bList = '';

    $.each(chartData, function(index, item) {
        bList += "<div class='cList'>";
        bList += "<a href='" + cpath + "/chartDetail.do?chart_indx=" + item.chart_indx + "'>";
        bList += "<img src='" + cpath + "/resources/img/img" + item.music_idx + ".jpg' alt='" + item.music_name + "'>";
        bList += "<h4>" + item.music_name + "</h4>";
        bList += "<h5>" + item.music_singer + "</h5>";
        bList += "<p>판매량: " + item.chart_sl + "</p>";
        bList += "<p>현재가: " + item.chart_now + "</p>";
        bList += "</a>";
        bList += "</div>";
    });
    container.html(bList);
    updateSlider();
}

function updatenewsList(newsData) {
    let topnewslist = $('#newsbody');
    let newsTable = '';
    const newssData = newsData.slice(0, 10);
    $.each(newssData, function(index, news) {
        newsTable += "<tr>";
        newsTable += "<td>" + news.news_title + "</td>";
        newsTable += "<td>" + news.pressed_at + "</td>";
        newsTable += "</tr>";
    });
    topnewslist.html(newsTable);
}

function slide(direction) {
    const totalItems = $('#gridContainer .cList').length;
    const totalPages = Math.ceil(totalItems / itemsPerPage);
    currentSlide += direction;

    if (currentSlide < 0) {
        currentSlide = totalPages - 1;
    } else if (currentSlide >= totalPages) {
        currentSlide = 0;
    }

    updateSlider();
}

function updateSlider() {
    const items = $('#gridContainer .cList');
    const start = currentSlide * itemsPerPage;
    const end = start + itemsPerPage;

    items.hide().slice(start, end).show();
}