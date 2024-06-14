
function openLoginWindow(cpath) {
    let newWindow = window.open('', '_blank', 'width=600,height=400');
    let content = `
        <html>
        <head>
            <title>Login</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer">
            <link rel="stylesheet" href="` + cpath + `/resources/css/style.css">
        </head>
        <body>
            <div class="signcontainer">
                <div class="text-box">
                    <div>Sign In</div>
                </div>
                <form id="loginForm" method="post">
                    <div class="Text-Field">
                        <label for="user_id">아이디</label>
                        <div class="input-box">
                            <input type="text" placeholder="아이디를 입력해주세요" class="id" name="user_id">
                        </div>
                    </div>
                    <div class="Text-Field">
                        <label for="user_pw">비밀번호</label>
                        <div class="input-box password">
                            <input type="password" placeholder="비밀번호를 입력해주세요" class="password" name="user_pw">
                            <span class="password-toggle-icon"><i class="fas fa-eye"></i></span>
                        </div>
                    </div>
                    <div class="find">
                        <a href="javascript:void(0);" onclick="showFindId()">Forgot Password?</a>
                    </div>
                    <div class="link">
                        <a href="javascript:void(1);" onclick="showJoinIn()">go to the Sign Up</a>
                    </div>
                    <div class="button">
                        <input type="submit" value="Sign In">
                    </div>
                </form>
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script>
                document.getElementById('loginForm').onsubmit = function(event) {
                    event.preventDefault(); // 폼의 기본 제출 동작을 막음
                    var form = this;
                    var formData = new FormData(form);
                    $.ajax({
                        url: '` + cpath + `/Login.do',
                        type: 'post',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function(response) {
                            alert('로그인 성공');
                            window.opener.location.reload(); // 부모 창 새로고침
                            window.close(); // 현재 창 닫기
                        },
                        error: function() {
                            alert('로그인 실패');
                        }
                    });
                };
            </script>
        </body>
        </html>
    `;
    newWindow.document.write(content);
    newWindow.document.close();
}