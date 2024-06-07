let chart; // 전역 변수로 차트 객체를 선언

// 차트를 초기화하는 함수
function initChart() {
    const ctx = document.getElementById("myChart").getContext("2d");
    chart = new Chart(ctx, {
        type: "line",
        data: {
            labels: ["0", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            datasets: [
                {
                    label: "감정분석",
                    data: [198, 212, 241, 221, 289, 278, 300, 222, 200, 344, 210, 156, 111],
                    fill: false,
                    borderColor: "rgb(75, 192, 192)",
                    tension: 0.1,
                    lineWidth: 1,
                }
            ],
        },
    });
}

// 차트를 업데이트하는 함수
function updateChart(label) {
    $.ajax({
        url: `${cpath}/chartData.do?type=${label}`,
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            chart.data.datasets[0].label = label;
            chart.data.datasets[0].data = data.values;
            chart.update();
        },
        error: function(error) {
            console.error('Error fetching chart data', error);
        }
    });
}

// 페이지가 로드될 때 차트를 초기화
window.onload = function () {
    initChart();
};
