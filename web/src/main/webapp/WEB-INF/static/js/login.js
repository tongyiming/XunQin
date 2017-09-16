// JavaScript Document

var nameflag = 0;
var passflag = 0;

function checkName()
{
	var username = document.getElementById("username");
	var namespan = document.getElementById("namespan");
	var reg = /^([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-z]{2,3}){1,2})$/;
	if (username.value == "")
	{
		username.style.borderColor = "#F73F52";
		namespan.innerHTML = "邮箱不能为空";
		namespan.style.display = "block";
		return false;
	}

	else if(reg.test(username.value) == false){
		username.style.borderColor = "#F73F52";
		namespan.innerHTML = "邮箱格式错误";
		namespan.style.display = "block";
	}
	else
	{
		username.style.borderColor = "#ccc";
		namespan.style.display = "none";
		return true;
	}
}

function checkPass()
{
	var userpass = document.getElementById("userpass");
	var passspan = document.getElementById("passspan");
	var reg = /^\w{6,16}$/;
	if (userpass.value == "")
	{
		userpass.style.borderColor = "#F73F52";
		passspan.innerHTML = "密码不能为空";	
		passspan.style.display = "block";
		return false;
	}
	else if(!reg.test(userpass.value))
	{
		userpass.style.borderColor = "#F73F52";
		passspan.innerHTML = "密码格式为字母数字下划线，长度6-16位";
		passspan.style.display = "block";
		return false;
	}
	else
	{
		userpass.style.borderColor = "#ccc";
		passspan.style.display = "none";
		return true;
	}
}
/*检测用户账号和密码是否填写正确，如果选择了记住密码，则让浏览器记住用户账号和密码*/
function checkAll()
{
	if (checkName && checkPass)
	{
		var remember = document.getElementById("remember");
		if (remember.checked)
		{
			var username = document.getElementById("username").value;
			var userpass = document.getElementById("userpass").value;
			var storage = window.localStorage;
			if (storage.userlist == undefined) /*第一次记住密码*/
			{
				var userlist = [];
				var user = {username:username, userpass:userpass};
				userlist.push(user);
				var json = JSON.stringify(userlist);
				storage.setItem("userlist",json);
			}
			else
			{
				var json = json.parse(storage.userlist);
				var count = 0;
				for (var i = 0; i < json.length; i++)
				{
					if (json[i].username == username)/*下一次登录*/
					{
						json[i].username = username;
						json[i].userpass = userpass;
						count = json.length;
					}
				}
				if (count == json.length)/*新用户*/
				{
					var user = {username:username, userpass:userpass};
					json.push(user);
				}
				var userlist = JSON.stringify(json);
				storage.setItem("userlist",userlist);
			}
		}
		return true;
	}
	else
		return false;
}
/*点击记住密码*/
function rememberPass()
{
	var remember = document.getElementById("remember");
	var auto = document.getElementById("auto");
	if (!remember.checked)
	{
		auto.checked = false;
	}
}

/*点击自动登录*/
function autoLogin()
{
	var remember = document.getElementById("remember");
	var auto = document.getElementById("auto");
	if (auto.checked)
		remember.checked = true;
}

/*进入后显示用户名密码*/
function setUser()
{
	var storage = window.localStorage;
	if (storage.userlist != undefined)
	{
		var json = JSON.parse(storage.userlist);
		var len = json.length;
		document.getElementById("username").value = json[len-1].username;
		document.getElementById("userpass").value = json[len-1].userpass;
	}
}

function completeName()
{
	var username = document.getElementById("username");
	var namespan = document.getElementById("namespan");
	if (req.readyState == 4) 
	{
		if (req.status == 200) 
		{
			var result = req.responseText;
			if (result == "yes")
			{
				username.style.borderColor = "#ccc";
				namespan.style.display = "none";
				nameflag = 1;
			}
			else
			{
				username.style.borderColor = "#F73F52";
				namespan.innerHTML = "该用户名不存在";
				namespan.style.display = "block";
			}

		}
	}
}

function completePass()
{
	var username = document.getElementById("userpass");
	var namespan = document.getElementById("passspan");
	if (req.readyState == 4) 
	{
		if (req.status == 200) 
		{
			var result = req.responseText;
			if (result == "yes")
			{
				userpass.style.borderColor = "#ccc";
				passspan.style.display = "none";
				passflag = 1;
			}
			else
			{
				userpass.style.borderColor = "#F73F52";
				passspan.innerHTML = "密码错误，请重新输入";
				passspan.style.display = "block";
			}
		}
	}
}