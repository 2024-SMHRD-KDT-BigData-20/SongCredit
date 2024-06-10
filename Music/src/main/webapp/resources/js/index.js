

document.addEventListener("DOMContentLoaded", function () {
  initializeHamburgerButton();
  initializeNewsList();
  initializeMusicList();
  initializePasswordFieldToggle();
  initializeMainNewsList();
});

function initializeNewsList() {
  let newslist = document.querySelector(".newslist");

  // 테이블 헤더 행 생성
  let headerRow = document.createElement("tr");
  let relatedtitleNews = document.createElement("th");

  relatedtitleNews.textContent = "관련 뉴스";
  relatedtitleNews.colSpan = 3;

  headerRow.appendChild(relatedtitleNews);
  newslist.appendChild(headerRow);

  for (let i = 1; i <= 10; i++) {
    let newstr = document.createElement("tr");
    let newsidx = document.createElement("td");
    let newstitle = document.createElement("td");
    let newsdate = document.createElement("td");

    newsidx.textContent = i;
    newstitle.textContent = "뉴스 제목 " + i; // 각 뉴스 제목에 숫자를 추가
    newsdate.textContent = "2024-05-" + i.toString().padStart(2, "0"); // 날짜 형식을 조정

    newstr.appendChild(newsidx);
    newstr.appendChild(newstitle);
    newstr.appendChild(newsdate);

    newslist.appendChild(newstr);
  }
}

function initializeMusicList() {
  let musiclist = document.querySelector(".musiclist");

  // 테이블 헤더 행 생성
  let headerRow = document.createElement("tr");
  let relatedtitleMusic = document.createElement("th");

  relatedtitleMusic.textContent = "관련 음악";
  relatedtitleMusic.colSpan = 3;

  headerRow.appendChild(relatedtitleMusic);
  musiclist.appendChild(headerRow);

  for (let i = 1; i <= 10; i++) {
    let musictr = document.createElement("tr");
    let musicidx = document.createElement("td");
    musicidx.style = "rowspan=1";
    let musictitle = document.createElement("td");
    let musicdate = document.createElement("td");

    musicidx.textContent = i;
    musictitle.textContent = "노래";
    musicdate.textContent = "가수";

    musictr.appendChild(musicidx);
    musictr.appendChild(musictitle);
    musictr.appendChild(musicdate);

    musiclist.appendChild(musictr);
  }
}

//햄버거 버튼
function initializeHamburgerButton() {
  let button = document.querySelector(".hamburger-button");
  let overlay = document.querySelector(".overlay");
  let Logoicon = document.querySelector(".logo");
  let i = 0;

  button.addEventListener("click", function (event) {
    event.preventDefault();
    i++;

    if (i % 2 === 0) {
      Logoicon.classList.remove("active");
      button.classList.remove("active");
      overlay.classList.remove("visible");
      return i;
    } else {
      Logoicon.classList.add("active");
      button.classList.add("active");
      overlay.classList.add("visible");
      return i;
    }
  });
}

function initializePasswordFieldToggle() {
  // 비밀번호 숨기기
  let passwordField = document.getElementById("password");
  let togglePassword = document.querySelector(".password-toggle-icon i");
  console.log(passwordField);
  togglePassword.addEventListener("click", function () {
    if (passwordField.type === "password") {
      passwordField.type = "text";
      togglePassword.classList.remove("fa-eye");
      togglePassword.classList.add("fa-eye-slash");
    } else {
      passwordField.type = "password";
      togglePassword.classList.remove("fa-eye-slash");
      togglePassword.classList.add("fa-eye");
    }
  });
}

function initializeMainNewsList() {
  let tbody = document.querySelector(".tbody");

  for (let i = 1; i <= 10; i++) {
    let newsTr = document.createElement("tr");

    newsTr.innerHTML = `
                <td>${i}</td>
                <td>뉴스제목 ${i}</td>
                <td>2024-05-${i.toString().padStart(2, "0")}</td>
            `;
    tbody.appendChild(newsTr);
  }
}

document.addEventListener("DOMContentLoaded", function () {
  const tbody = document.querySelector(".tbody");
  const pagination = document.querySelector(".pagination");
  const totalItems = 100;
  const itemsPerPage = 10;
  const totalPages = Math.ceil(totalItems / itemsPerPage);

  // 데이터 생성 함수
  function generateData(page) {
    tbody.innerHTML = "";
    const start = (page - 1) * itemsPerPage + 1;
    const end = page * itemsPerPage;
    for (let i = start; i <= end; i++) {
      let newsTr = document.createElement("tr");
      newsTr.innerHTML = `
        <td>${i}</td>
        <td>뉴스제목 ${i}</td>
        <td>2024-05-${String(i).padStart(2, "0")}</td>
      `;
      tbody.appendChild(newsTr);
    }
  }

  // 페이징 버튼 생성 함수
  function generatePagination() {
    pagination.innerHTML = "";
    for (let i = 1; i <= totalPages; i++) {
      let pageButton = document.createElement("button");
      pageButton.innerText = i;
      pageButton.addEventListener("click", function () {
        generateData(i);
      });
      pagination.appendChild(pageButton);
    }
  }

  // 초기 데이터 및 페이징 생성
  generateData(1);
  generatePagination();
});


document.addEventListener("DOMContentLoaded", function() {
  const domainListEl = document.querySelector("#domain-list");
  const domainInputEl = document.querySelector("#domain-txt");
  const emailInputEl = document.querySelector(".email .input-box input[type='text']");
  const fullEmailInputEl = document.querySelector("#full-email");

  domainListEl.addEventListener("change", function(event) {
      if (event.target.value !== "text") {
          domainInputEl.value = event.target.value;
          domainInputEl.disabled = true;
      } else {
          domainInputEl.value = "";
          domainInputEl.disabled = false;
      }
      updateFullEmail();
  });

  // 이메일 앞부분이 변경될 때마다 전체 이메일 주소 업데이트
  emailInputEl.addEventListener("input", updateFullEmail);
  // 도메인 직접 입력란이 변경될 때마다 전체 이메일 주소 업데이트
  domainInputEl.addEventListener("input", updateFullEmail);

  function updateFullEmail() {
      const emailPart = emailInputEl.value;
      const domainPart = domainInputEl.value;
      fullEmailInputEl.value = `${emailPart}@${domainPart}`;
  }
});


		function showSignIn() {
			document.querySelector('.signcontainer').style.display = 'block';
			document.querySelector('.joincontainer').style.display = "none";
			document.querySelector(".FindPwcontainer").style.display = 'none';
			document.querySelector(".FindIdcontainer").style.display = 'none';

		}
		function showJoinIn() {
			document.querySelector('.joincontainer').style.display = "block";
			document.querySelector('.signcontainer').style.display = "none";
			document.querySelector(".FindPwcontainer").style.display = 'none';
			document.querySelector(".FindIdcontainer").style.display = 'none';
		}
		function showFindPw() {
			document.querySelector(".FindIdcontainer").style.display = 'none';
			document.querySelector(".FindPwcontainer").style.display = 'block';
		}
		function showFindId() {
			document.querySelector('.signcontainer').style.display = "none";
			document.querySelector('.joincontainer').style.display = "none";
			document.querySelector(".FindIdcontainer").style.display = 'block';
			document.querySelector(".FindPwcontainer").style.display = 'none';
		}