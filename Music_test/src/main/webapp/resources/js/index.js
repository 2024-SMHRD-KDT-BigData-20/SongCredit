document.addEventListener("DOMContentLoaded", function () {
  initializeHamburgerButton();
  initializeMusicList();
  initializePasswordFieldToggle();
  initializeMainNewsList();
});


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
function passwordToggle() {
    // 모든 password-toggle-icon 요소들을 선택합니다.
    let passwordToggleIcons = document.querySelectorAll(".password-toggle-icon");

    passwordToggleIcons.forEach(icon => {
        // 각 아이콘에 클릭 이벤트 리스너를 추가합니다.
        icon.addEventListener("click", function() {
            // 아이콘의 클래스를 변경합니다.
            if (icon.classList.contains("fa-eye")) {
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }

            // 아이콘의 부모 요소에서 input 요소를 찾습니다.
            let passwordField = icon.previousElementSibling;
            if (passwordField.type === "password") {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        });
    });
}

// 페이지 로드 시 passwordToggle 함수를 호출합니다.
window.addEventListener("DOMContentLoaded", (event) => {
    passwordToggle();
});

document.addEventListener("DOMContentLoaded", function() {
  const idInput = document.getElementById("id");
  const errorMessage = document.getElementById("id-error");

  idInput.addEventListener("input", function() {
      // 정규식을 사용하여 유효한 문자(영문자와 숫자)를 검사합니다.
      const validPattern = /^[a-zA-Z0-9]*$/;
      const isValid = validPattern.test(idInput.value);

      if (!isValid) {
          // 유효하지 않은 문자가 입력되면 오류 메시지를 표시합니다.
          errorMessage.style.display = "block";

          // 유효하지 않은 문자를 제거합니다.
          idInput.value = idInput.value.replace(/[^a-zA-Z0-9]/g, '');
      } else {
          // 유효한 입력일 경우 오류 메시지를 숨깁니다.
          errorMessage.style.display = "none";
      }
  });
});

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
});

document.addEventListener("DOMContentLoaded", function () {
  const domainListEl = document.querySelector("#domain-list");
  const domainInputEl = document.querySelector("#domain-txt");
  const emailInputEl = document.querySelector(
    ".email .input-box input[type='text']"
  );
  const fullEmailInputEl = document.querySelector("#full-email");

  domainListEl.addEventListener("change", function (event) {
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
function commonAjax(url, data, type, state, callback) {
  $.ajax({
    url: url,
    data: data,
    type: type,
  })
    .done(function (response) {
      callback(response);
    })
    .error(function (error) {
      console.log();
    });
}

function removemember() {
	let removebutton = document.querySelector(".memberremove");
    let removeModal = document.querySelector(".removeModal");
    let modalBackground = document.querySelector(".modal-background");
    	removebutton.addEventListener("click", function () {
    		removeModal.style.display = "flex";
    		modalBackground.style.display = "block";
    	});
    	
    	let closeButton = removeModal.querySelector("span");
    	closeButton.addEventListener("click", function () {
    		removeModal.style.display = "none";
    		modalBackground.style.display = "none";
    	});
    	modalBackground.addEventListener("click", function () {
    		removeModal.style.display = "none";
    		modalBackground.style.display = "none";
    	});
    }

window.onload = removemember;
