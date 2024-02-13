<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/static/project/css/header.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Noto+Sans+KR:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>
<div class="topContents">
    <div class="header">
        <div>
            <a href="javascript:void(0)"></a><i class="fas fa-solid fa-arrow-left"></i>
        </div>
        <div class="btnWrap">
            <button type="button" class="preview"><i class="fas fa-solid fa-eye"></i> &nbsp;&nbsp;미리 보기</button>
            <button type="button" class="save">저장</button>
        </div>
    </div>
    <div class="topContentsWrapper">
        <span>프로젝트 기획</span>
    </div>
    <div class="fixedContentWrapper">
        <div class="planWrap">
            <ul>
                <li><a class="active" href="javascript:void(0)">기본 정보</a></li>
                <li><a href="javascript:void(0)">펀딩 계획</a></li>
                <li><a href="javascript:void(0)">선물 구성</a></li>
                <li><a href="javascript:void(0)">프로젝트 계획</a></li>
                <li><a href="javascript:void(0)">창작자 정보</a></li>
            </ul>
        </div>
        <div>
            <div class="subTab">
                <div class="leftTab">
                    <button class="active" type="button">
                        <div><i class="fas fa-solid fa-gift"></i><span>선물</span></div>
                    </button>
                    <button type="button">
                        <div><i class="fas fa-solid fa-list"></i><span>아이템</span></div>
                    </button>
                </div>
                <div class="rightBtn">
                    <div>
                        <a href="javascript:void(0)">
                            <i class="fas fa-solid fa-circle-info"></i>
                            <span>선물&middot;아이템&middot;옵션&middot;가이드</span>
                        </a>
                    </div>
                    <div>
                        <a href="javascript:void(0)">
                            <i class="far fa-regular fa-lightbulb"></i>
                            <span>선물 아이디어</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>