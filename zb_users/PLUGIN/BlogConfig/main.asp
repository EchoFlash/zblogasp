<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'///////////////////////////////////////////////////////////////////////////////
'// 插件制作:    ZSXSOFT
'// 呃我是不是压缩过头了
'///////////////////////////////////////////////////////////////////////////////
%>
<% Option Explicit %><% 'On Error Resume Next %><% Response.Charset="UTF-8" %><!-- #include file="../../c_option.asp" --><!-- #include file="../../../ZB_SYSTEM/function/c_function.asp" --><!-- #include file="../../../ZB_SYSTEM/function/c_system_lib.asp" --><!-- #include file="../../../ZB_SYSTEM/function/c_system_base.asp" --><!-- #include file="../../../ZB_SYSTEM/function/c_system_plugin.asp" --><!-- #include file="../../../ZB_SYSTEM/function/c_system_event.asp" --><!-- #include file="../../plugin/p_config.asp" --><%Dim l:l=FilterSQL(Request.QueryString("name")):Call System_Initialize():Call CheckReference(""):If BlogUser.Level>1 Then Call ShowError(6):End If:If CheckPluginState("BlogConfig")=False Then Call ShowError(48):End If:BlogTitle="配置管理":Dim objRs,a,b,c,d,e,objC:Call SetBlogHint_Custom(" 提示:本插件相当于Windows内的注册表编辑器，使用本插件请谨慎操作。一旦修改失误，很可能导致插件或博客无法打开！")
Select Case Request("act")
	Case "open"
		ac
	Case "rename"
		objConn.Execute "UPDATE [blog_Config] SET [conf_Name]='"&FilterSQL(Request.QueryString("edit"))&"' WHERE [conf_Name]='"&l&"'":l=FilterSQL(Request.QueryString("edit")):ac
	Case "readleft"
		readleft:response.end
	case "del"
		objConn.Execute "DELETE FROM [blog_Config] WHERE [conf_Name]='"&l&"'":Response.Write "删除成功":Response.End
	case "new"
		Set objRs=objConn.Execute ("SELECT * FROM [blog_Config] WHERE [conf_Name]='"&l&"'"):If objRs.Eof Then:objConn.Execute "INSERT INTO [blog_Config] VALUES ('"&l&"','')":ac:Else:ac:End If
	case "e_del"
		Set objC=New TConfig:objC.Load Request.Form("name2"):objC.Remove Request.Form("name1"):objC.Save:l=FilterSQL(Request.Form("name2")):ac
	case "e_edit"
		Set objC=New TConfig:objC.Load Request.Form("name2"):objC.Write Request.Form("name1"),Request.Form("post"):objC.Save:l=FilterSQL(Request.Form("name2")):ac	
End Select
%>
<!--#include file="..\..\..\zb_system\admin\admin_header.asp"--><style type="text/css">table {table-layout: fixed;overflow: hidden}.contextMenu{position:absolute;width:120px;z-index:99999;border:solid 1px #CCC;background:#EEE;padding:0px;margin:0px;display:none;}.contextMenu LI{list-style:none;padding:0px;margin:0px;}.contextMenu A{color:#333;text-decoration:none;display:block;line-height:20px;height:20px;background-position:6px center;background-repeat:no-repeat;outline:none;padding:1px 5px;padding-left:28px;}.contextMenu LI.hover A{color:#FFF;background-color:#3399FF;}.contextMenu LI.disabled A{color:#AAA;cursor:default;}.contextMenu LI.hover.disabled A{background-color:transparent;}.contextMenu LI.separator{border-top:solid 1px #CCC;}.contextMenu LI.edit A{background-image:url(images/page_white_edit.png);}.contextMenu LI.cut A{background-image:url(images/cut.png);}.contextMenu LI.copy A{background-image:url(images/page_white_copy.png);}.contextMenu LI.paste A{background-image:url(images/page_white_paste.png);}.contextMenu LI.delete A{background-image:url(images/page_white_delete.png);}.contextMenu LI.quit A{background-image:url(images/door.png);}</style><script type="text/javascript">/* jQuery Context Menu Plugin Version 1.01 Cory S.N. LaViska A Beautiful Site (http://abeautifulsite.net/) More info: http://abeautifulsite.net/2008/09/jquery-context-menu-plugin/ Terms of Use This plugin is dual-licensed under the GNU General Public License   and the MIT License and is copyright A Beautiful Site, LLC.*/eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1;};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p;}('5(1g)(4(){$.1y($.1v,{F:4(a,b){5(a.t==w)n v;5(a.D==w)a.D=1w;5(a.E==w)a.E=1u;5(a.D==0)a.D=-1;5(a.E==0)a.E=-1;$(3).s(4(){q c=$(3);q d=$(c).1s();$(\'#\'+a.t).p(\'F\');$(3).Q(4(e){q f=e;f.11();$(3).P(4(g){g.11();q h=$(3);$(3).r(\'P\');5(f.1t==2){$(".F").18();q i=$(\'#\'+a.t);5($(c).1x(\'o\'))n v;q j={},k,l;5(I.G){j.N=I.N;j.L=I.L;j.G=I.G;j.M=I.M}C 5(9.B&&9.B.T){j.N=9.B.U;j.L=9.B.V;j.G=9.B.T;j.M=9.B.12}C 5(9.H){j.N=9.H.U;j.L=9.H.V;j.G=9.H.T;j.M=9.H.12}(g.10)?k=g.10:k=g.1z+j.V;(g.15)?l=g.15:l=g.1l+j.U;$(9).r(\'u\');$(i).1b({14:l,Z:k}).1q(a.D);$(i).7(\'A\').1k(4(){$(i).7(\'8.6\').z(\'6\');$(3).X().p(\'6\')}).1n(4(){$(i).7(\'8.6\').z(\'6\')});$(9).S(4(m){1m(m.1p){K 1i:5($(i).7(\'8.6\').J()==0){$(i).7(\'8:17\').p(\'6\')}C{$(i).7(\'8.6\').z(\'6\').1D(\'8:R(.o)\').19(0).p(\'6\');5($(i).7(\'8.6\').J()==0)$(i).7(\'8:17\').p(\'6\')};O;K 1N:5($(i).7(\'8.6\').J()==0){$(i).7(\'8:16\').p(\'6\')}C{$(i).7(\'8.6\').z(\'6\').1P(\'8:R(.o)\').19(0).p(\'6\');5($(i).7(\'8.6\').J()==0)$(i).7(\'8:16\').p(\'6\')};O;K 13:$(i).7(\'8.6 A\').1a(\'u\');O;K 1R:$(9).1a(\'u\');O}});$(\'#\'+a.t).7(\'A\').r(\'u\');$(\'#\'+a.t).7(\'8:R(.o) A\').u(4(){$(9).r(\'u\').r(\'S\');$(".F").18();5(b)b($(3).1F(\'Y\').1I(1),$(h),{x:k-d.Z,y:l-d.14,1J:k,1K:l});n v});1L(4(){$(9).u(4(){$(9).r(\'u\').r(\'S\');$(i).1M(a.E);n v})},0)}})});5($.1d.1E){$(\'#\'+a.t).s(4(){$(3).1b({\'1H\':\'1G\'})})}C 5($.1d.1T){$(\'#\'+a.t).s(4(){$(3).W(\'1Q.1c\',4(){n v})})}C{$(\'#\'+a.t).s(4(){$(3).W(\'Q.1c\',4(){n v})})};$(c).1S($(\'1O.F\')).W(\'1o\',4(){n v})});n $(3)},1j:4(a){5(a==w){$(3).7(\'8\').p(\'o\');n($(3))};$(3).s(4(){5(a!=w){q b=a.1h(\',\');1e(q c=0;c<b.1f;c++){$(3).7(\'A[Y="\'+b[c]+\'"]\').X().p(\'o\')}}});n($(3))},1r:4(a){5(a==w){$(3).7(\'8.o\').z(\'o\');n($(3))};$(3).s(4(){5(a!=w){q b=a.1h(\',\');1e(q c=0;c<b.1f;c++){$(3).7(\'A[Y="\'+b[c]+\'"]\').X().z(\'o\')}}});n($(3))},1A:4(){$(3).s(4(){$(3).p(\'o\')});n($(3))},1C:4(){$(3).s(4(){$(3).z(\'o\')});n($(3))},1B:4(){$(3).s(4(){$(3).r(\'Q\').r(\'P\')});n($(3))}})})(1g);',62,118,'|||this|function|if|hover|find|LI|document||||||||||||||return|disabled|addClass|var|unbind|each|menu|click|false|undefined|||removeClass||documentElement|else|inSpeed|outSpeed|contextMenu|innerHeight|body|self|size|case|pageXOffset|innerWidth|pageYOffset|break|mouseup|mousedown|not|keypress|clientHeight|scrollTop|scrollLeft|bind|parent|href|left|pageX|stopPropagation|clientWidth||top|pageY|first|last|hide|eq|trigger|css|disableTextSelect|browser|for|length|jQuery|split|38|disableContextMenuItems|mouseover|clientY|switch|mouseout|contextmenu|keyCode|fadeIn|enableContextMenuItems|offset|button|75|fn|150|hasClass|extend|clientX|disableContextMenu|destroyContextMenu|enableContextMenu|prevAll|mozilla|attr|none|MozUserSelect|substr|docX|docY|setTimeout|fadeOut|40|UL|nextAll|selectstart|27|add|msie'.split('|'),0,{}));eval(function(p,a,c,k,e,d){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('4 n;n=6;3 o(a,b,c){h.k("Y"+b);$("#f").5("B");$.Q("z.A",c,3(e){$("#f").5(e)});p();n=6}3 M(a,b,c){4 8={"s":"1n"+a,"i":b};10(a){9"O":4 j;j=$("#w q").1i().u("2:11").u("x").r("t");h.k(j);7(j=="1a"){j=0}j=j+1;7(n==H){$("#w").L("<q><2></2><2>请保存后再新建</2><2></2></q>");m 6}$("#w").L("<q><2><x K=\'1b\' t=\'"+(j)+"\'/><x K=\'F\' v=\'y"+(j)+"\'></2><2><19 v=\'R"+(j)+"\' 18=\'P:1d%\'/></2><2><a 1f=\'1e:;\' 1g=\'M(\\"D\\",\\""+j+"\\",$(12).17(\\"#f\\").u(\\"#i\\").5())\'><15 13=\\"../../../1c/1p/1t/1s.1h\\" 1u=\\"编辑\\" 1v=\\"编辑\\" P=\\"16\\" /></a>&g;&g;&g;&g;&g</2>");n=H;l;9"D":9"J":8["G"]=$("#R"+b).r("t");8["1k"]=$("#y"+b).r("t")||$("#y"+b).F();8["1m"]=$("#i").5();8["1o"]=b;h.k(8);$("#f").5("B");$.G("z.A",8,3(e){$("#f").5(e)});l}}3 p(){4 c={"s":"p"};h.k("p");$("#f").5("B");$.Q("z.A",c,3(e){$("#W V").5(e);$("#W V 1l").1j({1q:\'1w\'},3(S,U,1y){Z(S,$(U).14("a").r("v"))})})}3 T(a){4 c={"s":"O"};4 d=E("请输入项名");7(d!=""&&d!=I){c["i"]=d;o(a,d,c)}C{m 6}}3 Z(a,b){4 c={"s":a,"i":b};h.k(b);7(b=="X"){T("X");m 6}10(a){9"Y":o(a,b,c);l;9"1r":4 d=E("请输入新项名");7(d!=""&&d!=I){7(N("确定要把"+b+"改为"+d+"吗？\\n\\n请注意，盲目修改名字可能会导致某个插件或整个博客无法打开！")){c["D"]=d;o(a,b,c)}C{m 6}}C{m 6}l;9"J":7(1x.N("单击“确定”继续。单击“取消”停止。")){o(a,b,c)}l}}',62,97,'||td|function|var|html|false|if|json|case|||||data|content|nbsp|console|name||log|break|return||read|readleft|tr|attr|act|value|children|id|configt|input|txt|main|asp|Loading|else|edit|prompt|text|post|true|null|del|type|append|run2|confirm|new|width|get|ta|action|nb|el|ul|tree|BlogConfig|open|run|switch|first|this|src|find|img||parents|style|textarea|NaN|hidden|ZB_SYSTEM|100|javascript|href|onclick|png|last|contextMenu|name1|li|name2|e_|test|image|menu|rename|page_edit|admin|alt|title|treemenu|window|pos'.split('|'),0,{}))</script><!--#include file="..\..\..\zb_system\admin\admin_top.asp"--><div id="divMain"><div id="ShowBlogHint"><%Call GetBlogHint()%></div><div class="divHeader"><%=BlogTitle%></div><div class="SubMenu"> <a href="main.asp"><span class="m-left m-now">[管理] </span></a> </div><div id="divMain2"> <script type="text/javascript">ActiveLeftMenu("aPlugInMng");</script><div style="height:900px"><div style="float:left;width:10%;" name="tree" id="tree"><ul><%ReadLeft%></ul><script type="text/javascript">$(document).ready(function() {$("#tree ul li").contextMenu({menu:'treemenu'},function(action, el, pos) {run(action,$(el).find("a").attr("id"))});});</script></div><div id="content" style="float:right;width:88%;" >请选择</div></div></div></div><ul id="treemenu" class="contextMenu"><li class="open"> <a href="#open">打开</a> </li><li class="rename"> <a href="#rename">重命名</a> </li><li class="del"> <a href="#del">删除</a> </li></ul><!--#include file="..\..\..\zb_system\admin\admin_footer.asp"-->
<%
		Function ac
			Dim m
			m=l
			If m="BlogConfig" Then m=""
			Response.Write "<span id=""name"">"&m & "</span><a href=""javascript:;"" onclick=""run2('new','"& m&"')"">新建</a>"
			Set objRs=objConn.Execute("SELECT [conf_Name] AS A,[conf_Value] AS B FROM [blog_Config] WHERE [conf_Name]='"&l&"'")		
			Response.Write "<table width=""100%"" style='padding:0px;margin:1px;' cellspacing='0' cellpadding='0' id=""configt""><tr><th width=""25%"">名称</th><th>内容</th><th width=""10%""></th></tr>"
			If Not(objRs.Eof) Then
				a=objRs("B")
				b=split(a,meta_split_string_2)
				If UBound(b)<=0 Then Response.Write "</table>":Response.End
				c=split(b(0),meta_split_string_1)
				d=split(b(1),meta_split_string_1)
				For e=1 To Ubound(c)
					Response.Write "<tr><td><input type='hidden' value='"&e&"'/><span id=""txt"&e&""">"&vbsunescape(c(e))&"</span></td><td onclick=""$('#ta"&e&"').show();$('#show"&e&"').hide()""><span id=""show"&e&""">"&vbsunescape(d(e))&"</span><textarea id=""ta"&e&""" style=""display:none;width:100%"">"&TransferHTML(vbsunescape(d(e)),"[textarea]")&"</textarea></td><td><a href=""javascript:;"" onclick=""run2('edit','"&e&"','"&m&"')""><img src=""../../../ZB_SYSTEM/image/admin/page_edit.png"" alt=""编辑"" title=""编辑"" width=""16"" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick='if( window.confirm(""单击“确定”继续。单击“取消”停止。"")){run2(""del"","""&e&""","""&m&""")};' href=""javascript:;"" onclick=""run2('del','"&e&"','"&m&"')""><img src=""../../../ZB_SYSTEM/image/admin/delete.png"" alt=""删除"" title=""删除"" width=""16"" /></a></td></tr>"
				Next
			End If
			Response.Write "</table>"
			Response.End
	End Function

Function ReadLeft：Set objRs=objConn.Execute("SELECT [conf_Name] FROM [blog_Config]"):Do Until objRs.Eof:Response.Write "<li><a id="""&objRs("conf_Name")&""" href=""javascript:;"" onclick=""run('open','"&objRs("conf_Name")&"')"">" & objRs("conf_Name") & "</a></li>":objRs.MoveNext:Loop:Response.Write "<li><a id=""BlogConfig"" href=""javascript:;"" onClick=""run('open','BlogConfig')"">新建</a></li>":End Function%>