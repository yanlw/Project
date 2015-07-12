<%@page pageEncoding="utf-8" isELIgnored="false" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>车险无忧大联盟 - 快速获取推广代码</title>
<link href="../style/reset.css" rel="stylesheet" />
<link href="../style/common.css" rel="stylesheet"  />
<link rel="stylesheet" href="../fonts/iconfont.css">
<link href="../style/style.css" rel="stylesheet" />
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/ZeroClipboard.min.js"></script>
<script src="../js/html5shiv.min.js"></script>
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

      <section>
         <div class="box_01 left">
           <div class="bx01_01 memb_01">
             <p><a href="loginOut.do">安全退出</a>会员中心</p>
             <table class="tb_01">
                <tbody>
                   <tr>
                     <td width="110">用户</td>
                     <td width=""><div style="width:172px; height:43px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${member.ad_member_name}</div></td>
                   </tr>
                   <tr>
                   	<td colspan="2"><a href="toModiMember.do">修改资料</a></td>
                   </tr>
                   <tr>
                     <td>可提现金额</td>
                     <td><a href="toApplyCash.do">提现</a>${member.ad_member_total_cash}</td>
                   </tr>
                   <tr>
                     <td>冻结金额</td>
                     <td><div style="height:43px;">${member.ad_member_pause_cash}</div></td>
                   </tr>
                   <tr>
                     <td colspan="2"><a href="findApplyCash.do">提现明细</a></td>
                   </tr>
                </tbody>
             </table>
           </div>
            <div class="memb_02 mg_tp_20">
                <span>会员常用功能</span>
                <ul>
                    <li><a href="toGetSpreadCode.do" title="">快速获取推广代码</a></li>                                   
                    <li><a href="viewIncome.do" title="">快速查看佣金收益</a></li>
                    <li><a href="toApplyCash.do" title="">立即提现</a></li>    
                </ul>
            </div>
            <div class="memb_03 mg_tp_20">
                <span>帐户管理</span>
                <ul>
                   <li><a href="toModiMember.do" title="">个人资料修改</a></li> 
                   <li><a href="toBankNumberManager.do" title="">银行账户管理</a></li>                                   
                </ul>
            </div>
            
            
         </div>
         <div class="account left">
            <div class="ac_title">快速获取推广代码</div>
            <form>
                <table class="ac_tab ac_url">
                   <tbody>
                      <tr>
                         <td style="padding:0px; text-align:center; width:240px;">操作指南</td>
                         <td style="color:#5DA7F5;">
                         	<br/>
                         	①&nbsp;&nbsp;选择广告类型（URL/文字/图片）<br/><br/>
                         	②&nbsp;&nbsp;将URL/文字/图片嵌入您的网页中<br/><br/>
                         	③&nbsp;&nbsp;再将获取到的广告代码做为文字或者图片的链接使用<br/><br/>
                         </td>
                      </tr>
                   </tbody>
                </table>
            </form> 
            
            <div class="ac_title mg_tp_40"><a>获取广告代码</a></div>
            <div class="ac_adv mg_tp_20">
              <ul class="adv_list">
                <li class="curr_z">URL广告代码</li>
                <li>文字广告代码</li>
                <li>图片广告代码</li>
              </ul>
              
              <div class="clear"></div>
              
              <ul class="adv_cnt">
                <li>
                   <div class="step_z_01">
                       <div class="adv_get">获取广告代码</div>
                       <div class="adv_cd_z">
                          <textarea class="adv_code"  id="fe_text01">http://www.hhit.edu.cn?from=${member.ad_member_no}
   						  </textarea>
                       </div>   
                   </div>
                </li>
                
                <li style="display:none">
                   <div class="step_z_01">
                       <div class="adv_get">获取广告代码</div>
                       <div class="adv_cd_z">
                           <textarea class="adv_code"  id="fe_text02">http://www.hhit.edu.cn?from=${member.ad_member_no}
   						  </textarea>
                       </div>   
                   </div>
                </li>
                
                <li style="display:none">
                   <div class="step_z_01">
                       <div class="adv_get">Step1   请选择图片广告</div>
                       <div class="adv_cd_z">
                           <div class="get_size"></div>
                           <div class="get_name">
                                <span>广告名称</span>
                                <select style="width: 200px;" onchange="document.getElementById('advImage').src=this.value">
                                	<c:forEach items="${advs}" var="a">
                                		<option value="../${a.adv_imagepath}">${a.adv_name}</option>
                                	</c:forEach>
                                </select>
                                
                                
 <!--                               
                                <div class="dropdown">
                                    <p>车险无忧送代驾</p>
                                    <ul>
                                       <li><a href="#" rel="1">1.车险无忧送代驾</a></li>
                                       <li><a href="#" rel="2">2.车险无忧送代驾</a></li>
                                       <li><a href="#" rel="3">3.车险无忧送代驾</a></li>
                                       <li><a href="#" rel="4">4.车险无忧送代驾</a></li>
                                       <li><a href="#" rel="5">5.车险无忧送代驾</a></li>
                                    </ul>
                                </div>
 --> 
                          </div>
                       </div>   
                   </div>
                   <div class="clear"></div>
                   <div class="step_z_01 border_tp_z">
                       <div class="adv_get">Step2   获取广告代码</div>
                       <div class="adv_cd_z">
                          <textarea class="adv_code" id="fe_text03">http://www.hhit.edu.cn?from=${member.ad_member_no}
   						  </textarea>
                       </div>   
                   </div>
                </li>
              </ul>
              
            </div>
            <div class="clear"></div>
            <div class="st_prev">
              <div class="ac_title mg_tp_30">效果预览</div>
              <div class="txt_prev"><a>车险无忧</a></div>
            </div>
           <div class="st_prev_pic">
              <div class="ac_title mg_tp_30">效果预览</div>
              <div class="txt_prev"><a><img id="advImage" src="../advImage/1431222091601.jpg" width="250" height="170"></a></div>
            </div>
         </div>
      </section>
      
	<%@ include file="footer_partner.jsp" %>
    <%@ include file="footer.jsp" %>
 
      <script>
	  $(function(){
		  
		  var clip1 = new ZeroClipboard( document.getElementById("d_clip_button01"), {
			moviePath: "js/ZeroClipboard.swf"
		  } );
		  
		  // 复制内容到剪贴板成功后的操作
		  clip1.on( 'complete', function(client, args) {
			alert("复制成功!"/*+ args.text*/);
		  } );
		  
		  var clip2 = new ZeroClipboard( document.getElementById("d_clip_button02"), {
			moviePath: "js/ZeroClipboard.swf"
		  } );
		  
		  // 复制内容到剪贴板成功后的操作
		  clip2.on( 'complete', function(client, args) {
			 alert("复制成功!"/*+ args.text*/);
		  } );
		  
		  var clip3 = new ZeroClipboard( document.getElementById("d_clip_button03"), {
			moviePath: "js/ZeroClipboard.swf"
		  } );
		  
		  // 复制内容到剪贴板成功后的操作
		  clip3.on( 'complete', function(client, args) {
			 alert("复制成功!"/*+ args.text*/);
		  } );
		  
		  
		  $('.adv_list li').click(function(){
			 $(this).addClass('curr_z').siblings().removeClass('curr_z');
			  var index=$(this).index();
			  $('.adv_cnt li').eq(index).show().siblings().hide();
			  if(index==1){
				 $('.st_prev').slideDown() 
			  }else{
				 $('.st_prev').slideUp() 
			  }
			  if(index==2){
				 $('.st_prev_pic').slideDown() 
			  }else{
				 $('.st_prev_pic').slideUp() 
			  }
		  })
		 $('.dropdown').each(function() {
           $(this).find('p').click(function(){
			  var ul = $(this).parent().find('ul');
			  if(ul.css("display")=="none"){
				  ul.slideDown("fast");
			  }else{
				  ul.slideUp("fast");
			  }
			 });  
			 $(this).find('a').click(function(){
			  
			  var txt = $(this).text();
			  $(this).parents('div.dropdown').find('p').html(txt);
			  var value = $(this).attr("rel");
			  $(this).parents('div.dropdown').find('ul').slideUp("fast")
		      return false
		      });
			
         });
		 
		 /*$(".dropdown p").click(function(){
			  var ul = $(".dropdown ul");
			  if(ul.css("display")=="none"){
				  ul.slideDown("fast");
			  }else{
				  ul.slideUp("fast");
			  }
		  });
		  $(".dropdown ul li a").click(function(){
			  var txt = $(this).text();
			  $(".dropdown p").html(txt);
			  var value = $(this).attr("rel");
		  });*/

	  })
      </script>
</body>
</html>
