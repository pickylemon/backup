<%--
  Created by IntelliJ IDEA.
  User: lemon
  Date: 2024-02-01
  Time: 오후 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<div class="pjWrap">
    <div class="pjCont">
        <!-- 카테고리 -->
        <div class="pjBox goal">
            <dl class="pjInfo">
                <dt class="pjInfoTit">목표 금액
                    <span class="icon">
                        <i class="fas fa-solid fa-asterisk"></i>
                    </span>
                </dt>
                <dd class="pjInfoDscpt">프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.
                </dd>
                <div class="pjNotice">
                    <i class="fas fa-solid fa-circle-info"></i>
                    <p class="pjNoticeTit">
                        목표 금액 설정 시 꼭 알아두세요!</p>
                    <p class="pjNoticeCont">종료일까지 목표금액을 달성하지 못하면 후원자 결제가 진행되지 않습니다.</p>
                    <p class="pjNoticeCont">후원 취소 및 결제 누락을 대비해 10% 이상 초과 달성을 목표로 해주세요.</p>
                    <p class="pjNoticeCont">제작비, 선물 배송비, 인건비, 예비 비용 등을 함께 고려해주세요.</p>
                </div>
            </dl>
            <div class="pjForm">
                <div class="goalTit">
                    <p>목표금액</p>
                </div>
                <div class="goalBx">
                    <div class="inputBx">
                        <input class="goalMoney" type="text" placeholder="50만원 이상 100억원 미만을 입력하세요." value="${fundingForm.fund_goal_money}">
                        <span>원</span>
                    </div>
                    <p class="notice"></p>
                </div>
                <div class="goalCalc">
                    <div class="result">
                        <span>목표 달성시 예상 수령 금액</span>
                        <div><p class="receiveMoney"></p>원</div>
                    </div>
                    <div class="fee">
                        <span>총 수수료(총 결제 성공 금액의 10% + VAT)</span>
                        <div><p class="feeCalc"></p>원</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 카테고리 -->
        <div class="pjBox plan">
            <dl class="pjInfo">
                <dt class="pjInfoTit">펀딩 일정
                    <span class="icon">
                        <i class="fas fa-solid fa-asterisk"></i>
                    </span>
                </dt>
                <dd class="pjInfoDscpt">설정한 일시가 되면 펀딩이 자동 시작됩니다. 펀딩 시작 전까지 날짜를 변경할 수 있고, 즉시 펀딩을 시작할 수도 있습니다.
                </dd>
            </dl>
            <div class="pjForm none"> <!-- 가상요소 선택자 before, after가 많이 적용되는 구간 -->
                <div class="listBx">
                    <ol>
                        <li>
                            <div class="start">
                                <div class="startD">
                                    <p class="tit" >펀딩 기간</p>
                                    <%--                                    <button type="button"><i class="far fa-regular fa-calendar"></i><span>2024/2/22</span></button>--%>
                                    <button class="datepicker" type="button" data-str_dtm="${fundingForm.fund_str_dtm}" data-end_dtm="${fundingForm.fund_end_dtm}">
                                        <i class="far fa-regular fa-calendar"></i>

                                        <input type="text" id="dateInput" class="hidden" name="dateRange" readonly="true" value="">
                                    </button>
                                </div>
                                <div class="startH">
                                    <p class="tit">시작시간</p>
                                    <button class="selectStr" type="button"><span>${empty fundingForm.fund_str_tm? '시작 시간을 선택해주세요' : fundingForm.fund_str_tm}</span><i class="fas fa-solid fa-chevron-down"></i></button>
                                    <select id="timeSelect" class="hidden" name="startTime" value="">
                                        <i class="fas fa-solid fa-chevron-down"></i>
                                        <%--                                        fontawsome 이거 왜 적용이 안되지--%>

                                        <c:forEach begin="1" end="19" step="1" var="i">
                                            <fmt:parseNumber var="hour" value="${((i+1)/2)+8}" integerOnly="true" />
                                            <%--jstl은 나눗셈 연산지 dobule로 연산한다. 정수형으로 바꾸기 위해 fmt태그 활용--%>
                                            <c:if test="${hour<10}">
                                                <c:set var="hour" value="0${hour}"/>
                                            </c:if>
                                            <c:set var="min" value="${i%2==0?'30':'00'}"/>
                                            <option value="${hour}:${min}">${hour}:${min}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="days">
                                <%--                                <p class="tit">펀딩기간</p>--%>
                                <div class="notice">
                                    <p>펀딩기간은 최대 60일까지 선택 가능합니다.</p>
                                    <p>선택하신 종료일 다음날 0시에 펀딩이 종료됩니다.</p>
                                </div>
                                <div>
                                    <p class="ntc">펀딩 기간 : <span class="range">${fundingForm.fund_period}</span>일</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <p class="tit">후원자 결제 종료</p>
                                <div class="notice">
                                    <p>프로젝트가 성공하면 펀딩 종료 다음 날 후원금이 결제됩니다.
                                        <br>결제가 이루어지지 않은 경우 24시간 후, 다시 한번 결제가 시도됩니다.</p>
                                </div>
                                <div class="payEnd">
                                    <p class="ntc">예상 결제 종료일 : <span class="end">${fundingForm.pj_pay_dtm_string}</span></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <p class="tit">정산예정일</p>
                                <div class="notice">
                                    <p>모금액은 후원자 결제 종료 다음 날부터 영업일 기준(주말 및 공휴일 제외)
                                        <br>7일째 되는 날 입금됩니다.</p>
                                </div>
                                <div class="payIn">
                                    <p class="ntc">정산예정일 : <span class="payIn">${fundingForm.calc_due_dtm_string}</span></p> <!-- N영업일을 구하는 쿼리? JS에서 보여주기? 어쨌든 이 정보도 저장을 해야.. -->
                                </div>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/project/js/funding.js"></script>

