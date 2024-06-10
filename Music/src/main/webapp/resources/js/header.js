function loadHeader(cpath) {
    const headerHTML = `
    <div class="header">
        <a href="" class="hamburger-button"> <span></span> <span></span> <span></span>
            <span></span>
        </a>
        <div class="overlay">
            <nav class="menu">
                <ul>
                    <li><a href="${cpath}/mainList.do">홈</a></li>
                    <li><a href="${cpath}/chartList.do">차트</a></li>
                    <li><a href="${cpath}/news.do">뉴스</a></li>
                </ul>
            </nav>
        </div>
        <div class="logo">
            <a href="${cpath}/mainList.do">Logo</a></div>
        <div class="search">
            <img src="${cpath}/resources/img/search.png"> <input type="text"
                placeholder="Search...">
        </div>
        <div class="mypage-icon">
            <a href="#"> <img src="${cpath}/resources/img/my.png" alt="">
            </a>
        </div>
        <div class="mypage">
            <c:choose>
                <c:when test="\${empty loginMember}">
                    <ul>
                        <li><a href="javascript:void(0);" onclick="showSignIn()">로그인</a></li>
                        <li><a href="javascript:void(1);" onclick="showJoinIn()">회원가입</a></li>
                    </ul>
                </c:when>

                <c:otherwise>
                    <ul>
                        <li>\${loginMember.user_nick}님 환영합니다</li>
                        <li><a href="${cpath}/Logout.do">로그아웃</a></li>
                        <li><a href="${cpath}/sign.jsp">회원정보</a></li>
                        <li><a href="${cpath}/LikeList.do">찜목록</a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </div>`;
    document.write(headerHTML);
}