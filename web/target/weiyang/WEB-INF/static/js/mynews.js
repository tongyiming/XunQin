function reply(username)
{
	document.getElementById("write-mess").value='@'+username+':';
}

function test()
{
	var mess = document.getElementById("write-mess");
	var reg = /^@([\u4e00-\u9fa5]|.)+:([\u4e00-\u9fa5]|.)*$/;
	if(!reg.test(mess.value))
	{
		alert("在@后面加上好友昵称再加上:就可以愉快的发消息了");
	}
	else
	{
		var req=null;
		if (window.XMLHttpRequest){
			req = new XMLHttpRequest();
		}else{
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if(req!=null){
			req.open('post','/u/${userid}/addLetter',true);
			req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
			req.onreadystatechange = function () {
				if(req.readyState==4){
					var result = req.responseText;
					if(result == "false"){
						alert("发送失败,请检查用户名是否存在");
					}else{
						alert("发送成功");
					}
				}
			}
			req.send('text='+mess.value);
		}
	}
}
