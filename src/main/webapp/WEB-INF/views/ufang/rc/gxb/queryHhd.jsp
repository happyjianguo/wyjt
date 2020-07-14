<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="java.util.Map" %>
<html>
<head>
	<title>米房报告</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/jquery/jquery.lazyload.js" type="text/javascript"></script>
	<script src="${ctxStatic}/artdialog/js/dialog-plus.js"></script>
    <link href="${ctxStatic}/artdialog/css/dialog.css" rel="stylesheet" />
<style type="text/css">
P{
	background: #2FB6EF;
	height: 40px; 
	color: #FFF;
	font-size:16px;
	font-weight: bold;
	line-height: 40px;
	padding-left: 20px;
	border-radius:5px;
	margin-top: 15px; 
}
</style>
</head>
<body>
		<h2>米房借贷用户分析</h2><br>
		<P>基本信息</P><br> 
		<table class="table table-striped table-bordered table-condensed">
		<tbody>
				<tr>
					<td style="text-align:center;width: 25%;">
						姓名：
					</td>
					<td style="text-align:center;width: 25%;">
						${result.data.baseInfo.realname}
					</td>
					<td style="text-align:center;width: 25%;">
						 
					</td>
					<td style="text-align:center;width: 25%;">
						 
					</td>
				</tr>
				<tr>
					<td style="text-align:center;width: 25%;">
						手机号码：
					</td>
					<td style="text-align:center;width: 25%;">
						${result.data.baseInfo.phone}
					</td>
					<td style="text-align:center;width: 25%;">
						是否本人账号：
					</td>
					<td style="text-align:center;width: 25%;">
						<c:choose>
							<c:when test="${result.data.baseInfo.status==1}">
								<span style="color:red">是</span>
							</c:when>
							<c:otherwise>
								否
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					 <td style="text-align:center;width: 25%;">
						身份证号：
					</td>
					<td style="text-align:center;width: 25%;">
						${result.data.baseInfo.idCard}
					</td>
					<td style="text-align:center;width: 25%;">
						平台信用等级描述：
					</td>
					<td style="text-align:center;width: 25%;">
						${result.data.baseInfo.creditScore}
					</td>
				</tr>
				 <tr>
					 <td style="text-align:center;width: 25%;">
						是否绑定微信：
					</td>
					<td style="text-align:center;width: 25%;">
						<c:choose>
							<c:when test="${result.data.baseInfo.wechatBindStatus}">
								<span style="color:red">是</span>
							</c:when>
							<c:otherwise>
								否
							</c:otherwise>
						</c:choose>
					</td>
					<td style="text-align:center;width: 25%;">
						注册时间：
					</td>
					<td style="text-align:center;width: 25%;">
						${result.data.baseInfo.regTime}
					</td>
				</tr>-
		</tbody>
	</table>
	
 <P>用户借贷信息</P><br>
	<table class="table table-striped table-bordered table-condensed">
		<tbody>
			<tr>
				<td style="text-align:center;width: 25%;">
					借入次数：
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdLoadInfo.borrowCount}
				</td>
				<td style="text-align:center;width: 25%;">
					借入金额：
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdLoadInfo.borrowAmount}
				</td>
			</tr>
			<tr>
				<td style="text-align:center;width: 25%;">
					当天借入当天还的百分比：
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdLoadInfo.borrowReturnSameDayPercent}
				</td>
				<td style="text-align:center;width: 25%;">
				</td>
				<td style="text-align:center;width: 25%;">
				</td>
			</tr>
			<tr>
				<td style="text-align:center;width: 25%;">
					借出次数：
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdLoadInfo.lendCount}
				</td>
				<td style="text-align:center;width: 25%;">
					借出金额：
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdLoadInfo.lendAmount}
				</td>
			</tr>
			<tr>
				<td style="text-align:center;width: 25%;">
					当天借出当天还的百分比：
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdLoadInfo.lendReturnSameDayPercent}
				</td>
				<td style="text-align:center;width: 25%;">
				</td>
				<td style="text-align:center;width: 25%;">
				</td>
			</tr>
			
			<tr>
				<td style="text-align:center;width: 25%;">
					逾期总次数：
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdOverdueInfo.overdueTotalCount}
				</td>
				<td style="text-align:center;width: 25%;">
					逾期总金额
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdOverdueInfo.overdueTotalAmt}
				</td>
			</tr>
			<tr>
				<td style="text-align:center;width: 25%;">
					当前逾期次数：
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdOverdueInfo.overdueCurrentCount}
				</td>
				<td style="text-align:center;width: 25%;">
					当前逾期金额
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdOverdueInfo.overdueCurrentAmt}
				</td>
			</tr>
			<tr>
				<td style="text-align:center;width: 25%;">
					大于一周的逾期次数：
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdOverdueInfo.overdueSevenDayCount}
				</td>
				<td style="text-align:center;width: 25%;">
					大于一周的逾期金额:
				</td>
				<td style="text-align:center;width: 25%;">
					${result.data.hhdOverdueInfo.overdueSevenDayAmt}
				</td>
			</tr>
		</tbody>
	</table>
<c:if test="${result.data.iouList !=NULL && result.data.iouList!=''}">
	<P>用户借条信息</P><br>
		<table class="table table-striped table-bordered table-condensed">
			<tbody>
				<tr>
					<td style="text-align:center;">
						借条类型
					</td>
					<td style="text-align:center;">
						还款方式
					</td>
					<td style="text-align:center;">
						借条状态
					</td>
					<td style="text-align:center;">
						借款金额
					</td>
					<td style="text-align:center;">
						待还金额
					</td>
					<td style="text-align:center;">
						逾期天数
					</td>
					<td style="text-align:center;">
						借款目的
					</td>
					<td style="text-align:center;">
						还款时间
					</td>
					<td style="text-align:center;">
						借款时间
					</td>
				</tr>
					<c:forEach items="${result.data.iouList}" var="item" >
						<tr>
							<td style="text-align:center;">
								${item.iouType==0?"借入":"出借"}
							</td>
							<td style="text-align:center;">
								${item.repayType==0?"全额":"分期"}
							</td>
							<td style="text-align:center;">
								${item.iouStatus==0?"未知":item.iouStatus==1?"待出借":item.iouStatus==2?"未到期":item.iouStatus==3?"已归还":item.iouStatus==4?"到期未还":item.iouStatus==5?"已拒绝":item.iouStatus==6?"已冻结":item.iouStatus==7?"还款中":item.iouStatus==8?"有争议":"其他(失效，违规或失败等其他原因)"}
							</td>
							<td style="text-align:center;">
								${item.baseAmt}
							</td>
							<td style="text-align:center;">
								${item.toRepaidAmt}
							</td>
							<td style="text-align:center;">
								${item.overDueDays<0?"未逾期":item.overDueDays}
							</td>
							<td style="text-align:center;">
								${item.purpose}
							</td>
							<td style="text-align:center;">
								${item.repayTime}
							</td>
							<td style="text-align:center;">
								${item.borrowerTime}
							</td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
</c:if>		
	
<c:if test="${result.data.contactList !=NULL && result.data.contactList!=''}">
	<P>用户联系人信息</P><br>
		<c:set var="count" value="0"/><!--人数 -->
		<c:forEach items="${result.data.contactList}" var="item" >
			<c:set var="count" value="${count+1}"/> 
		</c:forEach>
		<table class="table table-striped table-bordered table-condensed">
			<tbody>
				<tr>
					<td style="text-align:center;width:50%;">
						联系人姓名
					</td>
					<td style="text-align:center;width: 50%;">
						 联系人手机号
					</td>
				</tr>
				<c:forEach items="${result.data.contactList}" var="item" >
					<c:set var="count" value="${count+1}"/> 
					<tr>
						<td style="text-align:center;width:50%;">
							${item.phone }
						</td>
						<td style="text-align:center;width: 50%;">
							${item.nameF }
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td style="text-align:center;width: 25%;">
						联系人个数
					</td>
					<td style="text-align:center;width: 25%;">
						 ${count}
					</td>
					<td style="text-align:center;width: 25%;">
					</td>
					<td style="text-align:center;width: 25%;">
					</td>
				</tr>
			</tbody>
		</table>
</c:if>	  	
</body>
</html>