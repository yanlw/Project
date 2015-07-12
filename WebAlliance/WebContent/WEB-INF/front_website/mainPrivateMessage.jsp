<%@page pageEncoding="utf-8" isELIgnored="false"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>车险无忧大联盟 - 详细信息（对私）</title>
		<link href="../style/reset.css" rel="stylesheet" />
		<link href="../style/common.css" rel="stylesheet" />
		<link rel="stylesheet" href="../fonts/iconfont.css">
		<link rel="stylesheet" href="../style/uploadify.css" />
		<link href="../style/style.css" rel="stylesheet" />
		<script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/jquery.cycle.all.min.js"></script>
		<script src="../js/jquery.uploadify-3.1.min.js"></script>
		<script src="../js/script.js"></script>
		<script src="../js/html5shiv.min.js"></script>
		<style type="text/css">
			.cnt_z .wr_z .fo .error_msg {
				color: red;
				margin-left: 10px;
			}
			
			.cnt_z .wr_z .fo .right_msg {
				color: green;
				margin-left: 10px;
			}
			.cnt_z .wr_z .fo .codebt{ display:inline-block; width:120px; height:34px; line-height:34px; text-align:center; color:#fff; background:gray; font-size:14px; margin-left:10px; border-radius:2px;top:2px\9; position:relative; *top:-7px;}
		</style>
<script type="text/javascript">
	var flag;
	function check_memberName() {
		var reg = /^[\u4e00-\u9fa5]{2,}$/;
		var ad_member_name = $("#ad_member_name").val();
		if (ad_member_name == "") {
			$("#name_msg").removeClass();
			$("#name_msg").text("姓名不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(ad_member_name)) {
			$("#name_msg").removeClass();
			$("#name_msg").text("姓名格式错误，请输入2个以上的汉字").addClass("error_msg");
			return false;
		}
		$("#name_msg").removeClass();
		$("#name_msg").text("姓名格式正确").addClass("right_msg");
		return true;
	}

	function check_identity() {
		var reg = /^(^\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
		var ad_member_identity_id = $("#ad_member_identity_id").val();
		if (ad_member_identity_id == "") {
			$("#identity_msg").removeClass();
			$("#identity_msg").text("身份证号码不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(ad_member_identity_id)) {
			$("#identity_msg").removeClass();
			$("#identity_msg").text("身份证号码格式错误").addClass("error_msg");
			return false;
		}
		$("#identity_msg").removeClass();
		$("#identity_msg").text("身份证号码格式正确").addClass("right_msg");
		return true;

	}

	function check_bankcard() {
		var reg = /^[0-9]{19}$/;
		var ad_member_bank_number1 = $("#ad_member_bank_number1").val();
		if (ad_member_bank_number1 == "") {
			$("#bankcard1_msg").removeClass();
			$("#bankcard1_msg").text("银行卡号不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(ad_member_bank_number1)) {
			$("#bankcard1_msg").removeClass();
			$("#bankcard1_msg").text("银行卡号格式错误，请输入19位银行卡号").addClass("error_msg");
			return false;
		}
		$("#bankcard1_msg").text("银行卡号已输入").addClass("right_msg");
		var ad_member_bank_number2 = $("#ad_member_bank_number2").val();
		if (ad_member_bank_number2 == "") {
			$("#bankcard2_msg").removeClass();
			$("#bankcard2_msg").text("请再次输入银行卡号").addClass("error_msg");
			return false;
		}
		if (ad_member_bank_number2 != ad_member_bank_number1) {
			$("#bankcard2_msg").removeClass();
			$("#bankcard2_msg").text("两次银行卡号不相同").addClass("error_msg");
			return false;
		}
		$("#bankcard2_msg").removeClass();
		$("#bankcard2_msg").text("两次银行卡号输入相同").addClass("right_msg");
		return true;
	}

	function check_phone() {
		var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		var phone = $("#ad_member_phone").val();
		if (phone == "") {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("手机号码不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(phone)) {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("手机号码格式错误，请重新输入").addClass("error_msg");
			return false;
		}
		$.post("checkMemberByPhone.do", $("#ad_member_phone").serialize(),function(data){
			      if(data==0){
			    	  $("#phone_msg").removeClass();
						$("#phone_msg").text("手机号已被注册").addClass("error_msg");
						return false;
				      }
			          if(data==1){
				    	  $("#phone_msg").removeClass();
							$("#phone_msg").text("可以注册的手机号").addClass("right_msg");
							return true;
					      }
			});
	}

	//发送短信验证码
	function sendPhoneCode(){
		var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		var phone = $("#ad_member_phone").val();
		if (phone == "") {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("手机号码不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(phone)) {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("手机号码格式错误，请重新输入").addClass("error_msg");
			return false;
		}
		$.post("checkMemberByPhone.do", $("#ad_member_phone").serialize(),function(data){
			      if(data==0){
			    	  $("#phone_msg").removeClass();
						$("#phone_msg").text("手机号已被注册").addClass("error_msg");
						return false;
				      }
			          if(data==1){
				    	  $("#phone_msg").removeClass();
					  }
			});
		$.post("getPhoneCode.do", $("#ad_member_phone").serialize(), function(data) {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("短信验证码已发送").addClass("right_msg");
			var i = 30;
			var timer = setInterval(function(){
				if(i == 0){
					$("#codebt").attr("onclick","sendPhoneCode();").text("获取验证码").removeClass("codebt");
					clearInterval(timer);
					return;
				}
				$("#codebt").removeAttr("onclick").text("获取验证码("+i+")").addClass("codebt");
				i--;
			},1000);
		});
	}
	
	function check_mes() {
		var mes = $("#mes").val();
		if (mes == "") {
			$("#mes_msg").removeClass();
			$("#mes_msg").text("短信验证码不能为空").addClass("error_msg");
			return false;
		}
		$.post("checkPhoneCode.do", $("#mes").serialize(), function(data) {
			if (data == 0) {
				$("#mes_msg").removeClass();
				$("#mes_msg").text("短信验证码没有获取").addClass("error_msg");
				flag = false;
			} else if (data == 1) {
				$("#mes_msg").removeClass();
				$("#mes_msg").text("短信验证码错误").addClass("error_msg");
				flag = false;
			} else {
				$("#mes_msg").removeClass();
				$("#mes_msg").text("短信验证码正确").addClass("right_msg");
				flag = true;
			}
		});
		return flag;
	}
	function set_msg(id, msg) {
		$("#" + id).removeClass();
		$("#" + id).text(msg);
	}

	function check_all() {
		var file = $("#imgFile").val();
		if (file == "" || file == null) {
			alert("请上传照片!");
			return;
		}
		fileType = file.substr(file.indexOf(".") + 1).replace(/[ ]/g, "");
		if (!(fileType == "png" || fileType == "bmp" || fileType == "jpg" || fileType == "gif" || fileType == "jpeg")) {
			alert("文件类型不对!");
			return;
		}
		var a = check_memberName()
		var b = check_identity();
		var c = check_bankcard();
		var e = check_mes();
		if (a && b && c && e) {
			$("#detailRegister").submit();
		} else {
			return;
		}
	}
</script>
		<!--[if lt IE 6]> 
<script src="js/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script> 
<script type="text/javascript"> 
DD_belatedPNG.fix('*'); 
/* 将 .png_bg 改成你应用了透明PNG的CSS选择器*/ 
</script> 
<![endif]-->
	</head>

	<body>
		
	<%@ include file="header.jsp" %>

		<div class="cnt_z">
			<div class="cnt_z_title">
				主体信息登记
			</div>
			<form action="detailRegister.do?type=private" method="post" id="detailRegister"
				enctype="multipart/form-data">
				<div class="wr_z">
					<div class="cnt_z_info">
						人人保大联盟致力于打造真实、合法、有效的品牌推广平台，我们有志与诚信守约、进取担当的第三方合作伙伴携手并进，建立和维护良性互动、健康有序的平台秩序。为了更好的保障你和广大微信用户的利益，请你认真填写以下登记信息。
						<input type="hidden" name="ad_member_type" id="ad_member_type" value="1">
					</div>
					<div class="mod_title mg_bt_10">
						<i class="icon iconfont icont_num">&#xe602;</i>身份证号码
					</div>
					<div class="fo">
						<label>
							身份证姓名：
						</label>
						<input type="text" id="ad_member_name" name="ad_member_name"
							onblur="check_memberName();"
							onfocus="set_msg('name_msg','信息审核成功后身份证姓名不可修改；如果名字包含分隔号“·”，请勿省略。')">
						<span id="name_msg">信息审核成功后身份证姓名不可修改；如果名字包含分隔号“·”，请勿省略。</span>
					</div>
					<div class="fo">
						<label>
							身份证号码：
						</label>
						<input type="text" id="ad_member_identity_id"
							name="ad_member_identity_id" onblur="check_identity();">
						<span id="identity_msg"></span>
					</div>
					<div class="mod_title mg_tp_30">
						<i class="icon iconfont icont_num">&#xe603;</i>身份验证方式
					</div>
					<div class="notice">
						以右图方式双手持身份证，需免冠，五官清晰可见；照片内容真实有效，
						<br>
						不得做任何修改；支持jpg，bmg，gif格式照片，大小不超过2M
						<div class="fileInput">
							<input type="file" name="imgFile" id="imgFile" class="upfile" />
						</div>
					</div>
					<img src="../images/identification.jpg" width="280" height="184"
						id="identification">
					<div class="mod_title mg_bt_10">
						<i class="icon iconfont icont_num">&#xe604;</i>银行卡号码
					</div>
					<div class="fo">
						<label>
							银行卡号：
						</label>
						<input type="text" id="ad_member_bank_number1"
							onblur="check_bankcard();">
						<span id="bankcard1_msg">请输入19位银行卡号</span>
					</div>
					<div class="fo">
						<label>
							确认卡号：
						</label>
						<input type="text" id="ad_member_bank_number2"
							name="ad_member_bank_number" onblur="check_bankcard();">
						<span id="bankcard2_msg"></span>
					</div>
					<div class="mod_title mg_bt_10 mg_tp_30">
						<i class="icon iconfont icont_num">&#xe605;</i>联盟者信息登记
					</div>
					<div class="fo">
						<label>
							手机号码：
						</label>
						<input type="text" id="ad_member_phone" name="ad_member_phone" onblur="check_phone();">
						<a id="codebt" onclick="sendPhoneCode();">获取验证码</a>
						<span id="phone_msg"></span>
					</div>
					<div class="fo">
						<label>
							短信验证码：
						</label>
						<input type="text" id="mes" name="phoneCode"
							value="请输入手机短信收到的6位验证码" onfocus="value=''" onblur="check_mes();">
						<span id="mes_msg"></span>
					</div>
					<button type="button" class="fo_sub" onclick="check_all();">
						资料提交
					</button>
				</div>
			</form>

		</div>

	<%@ include file="footer_partner.jsp" %>
    <%@ include file="footer.jsp" %>

		<script type="text/javascript">
	var img_id_upload = new Array();//初始化数组，存储已经上传的图片名
	var i = 0;//初始化数组下标
	$(function() {
		$('#identification_upload').uploadify( {
			'auto' : true,//关闭自动上传
			'removeTimeout' : 1,//文件队列上传完成1秒后删除
			'swf' : 'uploadify.swf',
			'uploader' : 'uploadify.php',
			'method' : 'post',//方法，服务端可以用$_POST数组获取数据
			'buttonText' : '上传照片',//设置按钮文本
			'multi' : false,//允许同时上传多张图片
			'uploadLimit' : 10,//一次最多只允许上传10张图片
			'fileTypeDesc' : 'Image Files',//只允许上传图像
			'fileTypeExts' : '*.gif; *.jpg; *.bmg',//限制允许上传的图片后缀
			'fileSizeLimit' : '20000KB',//限制上传的图片不得超过200KB 
			'onUploadSuccess' : function(file, data, response) {//每次成功上传后执行的回调函数，从服务端返回数据到前端
				img_id_upload[i] = data;
				/*i++;*/
				setTimeout(function() {
					$('#identification').attr('src', './uploads/' + file.name)
				}, 1500)
			},
			'onQueueComplete' : function(queueData) {//上传队列全部完成后执行的回调函数
				/* if(img_id_upload.length>0)
				 alert('成功上传的文件有：'+encodeURIComponent(img_id_upload));*/
			}
		// Put your options here
				});
	});
</script>

	</body>
</html>
