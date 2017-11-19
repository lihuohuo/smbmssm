<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
</head>
<script type="text/javascript">
    jQuery.noConflict();
    jQuery(function ($) {
        var proname;
        $("#cha").click(function () {
            proname = $("proname").val();
            load(0);

        });
        load(0);
        function load(index) {
            $.ajax({
                url: "${pageContext.request.contextPath}/list",
                type: "post",
                data: {"pageIndex": index, "proname": proname},
                success: function (data) {
                    $("#list-content").html('');
                    $.each(data.list, function (i, dom) {
                        $("#list-content").append('<tr><th><input type="checkbox" id="qqq" value="' + dom.providerid + '"/>' + dom.providercode + '</th><th>' + dom.providername + '</th><th>' + dom.provideruser + '</th><th>' + dom.providerphone + '</th><th>' + dom.providerFax + '</th><th>' + dom.datas + '</th></tr>');
                    });
                    $('#pagination').pagination(data.totalRecords, {
                        current_page: index, //当前页索引
                        items_per_page: data.pageSize, //每页记录数
                        num_display_entries: 10, //显示页码块数量
                        callback: load,
                        load_first_page: true,
                        prev_text: 'Previous',
                        next_text: 'Next'
                    });
                }
            });
        }
    });
    function xiucha() {
        var a = $("#qqq:checked").length;
        if (a > 1) {
            alert("必须选择一项！！")
        } else if (a < 1) {
            alert("请选一项")
        } else {
            location.href = "/xiuBycha?id=" + $("#qqq:checked").val();
        }
    }
            function del() {
                var ck=$("#qqq:checked");
                var str="";
                for (var i=0;i<ck.length;i++){
                    if(ck.eq(i).prop("checked")){
                        str+=ck.eq(i).val()+",";
                    }
                }
                alert(str);
            $.ajax({
                url:"/del",
                type:"post",
                data:{"str":str},
                success:function (data) {
                    if(data!=1){
                        alert("删除失败！")
                    }else {
                        alert("删除成功！")
                    }
                }
            });
            }

</script>


<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎你！</p>
        <a href="login.html">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="billList.html">账单管理</a></li>
                <li id="active"><a href="providerList.html">供应商管理</a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/userList.jsp">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.html">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面</span>
        </div>
        <div class="search">
            <span>供应商名称：</span>
            <input type="text" id="proname" />
            <input id="cha" type="button" value="查询"/>
            <a onclick="del()">删除供应商</a>
            <a href="providerAdd.jsp">添加供应商</a>

            <a onclick="xiucha()">修改供应商</a>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">供应商编码</th>
                <th width="20%">供应商名称</th>
                <th width="10%">联系人</th>
                <th width="10%">联系电话</th>
                <th width="10%">传真</th>
                <th width="10%">创建时间</th>
            </tr>
            <tbody id="list-content"></tbody>
          <%--  <tr>
                <td>PRO-CODE—001</td>
                <td>测试供应商001</td>
                <td>韩露</td>
                <td>15918230478</td>
                <td>15918230478</td>
                <td>2015-11-12</td>
                <td>
                    <a href="providerView.jsp"><img src="img/read.png" alt="查看" title="查看"/></a>
                    <a href="providerUpdate.jsp"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                    <a href="#" class="removeProvider"><img src="img/schu.png" alt="删除" title="删除"/></a>
                </td>
            </tr>
            <tr>
                <td>PRO-CODE—001</td>
                <td>测试供应商001</td>
                <td>韩露</td>
                <td>15918230478</td>
                <td>15918230478</td>
                <td>2015-11-12</td>
                <td>
                    <a href="providerView.jsp"><img src="img/read.png" alt="查看" title="查看"/></a>
                    <a href="providerUpdate.jsp"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                    <a href="#" class="removeProvider"><img src="img/schu.png" alt="删除" title="删除"/></a>
                </td>
            </tr>--%>
        </table>
        <div class="pagination" id="pagination" style="margin:4px 0 0 0"></div>

    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该供应商吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>


<footer class="footer">
    版权归北大青鸟
</footer>

<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>

</body>
</html>