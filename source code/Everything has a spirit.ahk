/*
 * * * Compile_AHK SETTINGS BEGIN * * *

[AHK2EXE]
Exe_File=%In_Dir%\Everything has a spirit.exe
Compression=0
No_UPX=1
Created_Date=1
Execution_Level=4
[VERSION]
Set_Version_Info=1
Company_Name=千灵独立开发
File_Description=千灵辅助工具箱
File_Version=1.5.1.1
Inc_File_Version=0
Internal_Name=千灵辅助
Legal_Copyright=千灵
Original_Filename=Everything has a spirit
Product_Name=Everything has a spirit
Product_Version=1.1.30.3
Set_AHK_Version=1
Language_ID=30
[ICONS]
Icon_1=F:\程序设计\综合资源\图标\阿里开放图标（部分）\千灵辅助工具箱.ico
Icon_2=0
Icon_3=0
Icon_4=0
Icon_5=0

* * * Compile_AHK SETTINGS END * * *
*/

/*
变量声明：
	(%manual%)说明区标题
	(%dimensionH%) 初始窗口高度
	(%dimensionW%) 初始窗口宽度
	(%sizeH%) 当前窗口高度
	(%sizeW%) 当前窗口宽度
	(%coordinatesX%) 当前窗口X坐标
	(%coordinatesY%) 当前窗口Y坐标
	(%function%) 功能集合
	(%Greetings%) 加好友问候语
	(%paragraph%) 发广告发送内容
	(%Jway%) 加好友选择模式
	(%Fway%) 发广告选择模式
	(%Jfrequency%) 加好友执行次数
	(%Ffrequency%) 发广告执行次数
	(%Jshutdown%) 加好友关机检测
	(%Fshutdown%) 发广告关机检测
	(%adaptive%) 普通和企业QQ客户列表自适应变量
	(%file%) 文件选择路径
	(%SV%) 服务器版本
	(%CV%) 本机版本
	(%tt%) 临时变量
	(%help%) 帮助文件内容
	(%tgyzm%) 跳过验证码条件 
	(%QList%) QQ号码列表内容
	(%加好友%) 加好友帮助说明
	(%发广告%) 发广告帮助说明
	(%优化修复%) 优化修复帮助说明
	(%辅助增强%) 辅助增强帮助说明
	(%TopAndBottom%) 窗口置顶或取消运行状态
	(%滚页%) 失效好友添加页面滚动参数

标签声明：
	(GuiDropFiles:) 拖动文件执行排版
	(Button点击开始排版:) 点击开始排版
	(Button执行:) 执行加号友或发广告
	(加好友模式:) 加好友模式界面调整
	(Button冗沉垃圾清理:) 冗沉垃圾清理
	(Button网络dns缓存清理:) 网络dns缓存清理
	(Button解除拖动打开限制:) 解除拖动打开限制
	(Button系统检测及修复:) 系统检测及修复
	(Button窗口置顶或取消:) 窗口置顶或取消
		(hint:) 窗口置顶或取消说明
		(backout:) 禁用窗口置顶或取消
	(Button去除快捷方式箭头:) 去除快捷方式箭头
	(Button恢复快捷方式小箭头:) 恢复快捷方式小箭头
	(Button系统详细信息:) 系统详细信息
	(Button敬请期待:) 敬请期待
	(Button关于软件:) 关于软件
	(Button功能帮助:) 功能集相关帮助
	(Button问题反馈:) 跳转问题反馈群
	(Button更新记录:) 更新记录
	(F1:) 营销QQ发广告主窗口窗口检测重试
	(F2:) 普通QQ和企业QQ发广告主窗口窗口检测重试
	(F5:) 营销QQ加好友主窗口窗口检测重试
	(F4:) 普通QQ和企业QQ加好友主窗口窗口检测重试
	(实验性:) 验证码自动忽略提示
	(empty连续数据:) empty嵌入部分
	(helptext:) 写入帮助说明
*/

Process, Priority, , High  ; 脚本运行优先级为高
#KeyHistory, 0 ; 禁用按键历史记录
#NoEnv ; 不检查空变量是否为环境变量
#SingleInstance off ; 当脚本已经运行时重新开启新实例
SetBatchLines -1 ; 脚本全速运行
ListLines Off ; 在历史中略去后续执行的行
SetWorkingDir %A_ScriptDir% ; 脚本当前工作目录

URL := "http://xui.ptlogin2.qq.com/cgi-bin/xlogin?appid=501038301&proxy_url=http%3A%2F%2Fid.qq.com%2Flogin%2Fproxy.html&s_url=http%3A%2F%2Fim.qq.com%2F"
If InternetCheckConnection(URL)
{ ; 跳过预设 QQ 
	QQHM := % GetLoggedinQQ()
	If (InStr(QQHM, "1576049590")) > 0
	{
		ExitApp
	}
}

Gosub, helptext ; 读取说明帮助

Menu Tray, NoStandard ; 取除托盘默认菜单
Menu, Tray, Tip, ‎Everything has a spirit
Hotkey, #BackSpace, , OFF ; 禁用#BackSpace热键
Hotkey, #End, , OFF ; 禁用#End热键

Gui Font, s9, ; 定义后方字号与字体
Gui Add, Button, x335 y5 w90 h21, 查看在线帮助
Gui Font, s9, Segoe UI ; 定义后方字号与字体
Gui Add, Button,GGuiClose x5 y270 w80 h25, 退出程序
Gui Add, Button, x90 y270 w80 h25, 关于软件
Gui Add, Button, x175 y270 w80 h25, 功能帮助
Gui Add, Button, x260 y270 w80 h25, 问题反馈
Gui Add, Button, x345 y270 w80 h25, 更新记录

Gui Add, GroupBox, x5 y305 w420 h140, ; 说明区域标题
Gui Font, s10 Bold, Segoe Print
Gui Add, Edit, ReadOnly C0x575757 x10 y320 w410 h120, ; 说明区域内容（只读）

Gui Font, s9 Norm, Segoe UI ; 定义后方字号
Gui Add, Tab3, Vfunction G标签预判 x5 y5 w420 h260, 加好友||发广告|优化修复|辅助增强
Gui Tab, 1
	Gui Add, GroupBox, x10 y30 w130 h225, TXTQQ号码粗排版
	Gui Font, s9 , ; 定义后方字号
	Gui Add, Text, C666666 Center x15 y105 w120 h30, txt文件拖动到此处`n即可自动排版
	Gui Font, s11, ; 定义后方字号
	Gui Add, Button, x15 y200 w120 h50, 点击开始排版
	Gui Font, s9, ; 定义后方字号
	Gui Add, Button, x150 y35 w55 h75, 导入`nQQ号码`n列表
	Gui Add, Button, x150 y115 w55 h75, 清空`nQQ号码`n列表
	Gui Add, ListBox, Choose1 x210 y35 w210 h155, 请先点击导入QQ号码列表按钮

	Gui Add, Edit, VGreetings x150 y35 w270 h155, 请在这里输入问候语

	Gui Font, s12, ; 定义后方字号
	Gui Add, Text, Cff0000 x175 y110 +0x200, 需要先选择需要执行的模式！

	Gui Font, s9, ; 定义后方字号
	Gui Add, Radio, 0x1000 VJway G加好友模式 x150 y195 w150 h25, 营销QQ失效好友添加
	Gui Add, Radio, 0x1000 G加好友模式 x150 y230 w150 h25, 企业和普通QQ模式
	Gui Font, s10, ; 定义后方字号
	Gui Add, CheckBox, VJshutdown x305 y195 w70 h25, 关 机
	Gui Add, Edit, 0x2000 Limit VJfrequency x305 y230 w40 h25, 20
	Gui Add, Text, x350 y230 w25 h25 +0x200, 次
	Gui Font, s11, ; 定义后方字号
	Gui Add, Button, Default x380 y190 w40 h70, 执`n行

Gui Tab, 2
	Gui Font, s9, ; 定义后方字号
	Gui Add, Edit, Vparagraph x10 y30 w350 h230, 请在这里输入广告词
	Gui Font, s9, ; 定义后方字号
	Gui Add, Radio, 0x1000 VFway x365 y30 w25 h60, 营销QQ
	Gui Add, Radio, 0x1000 x395 y30 w25 h130, 企业和普通QQ
	Gui Add, Checkbox, Vtgyzm G实验性 x371 y95 w15 h15, ; 跳过验证开关
	Gui Add, Text, x371 y111 w20 h60, 去`n验`n证
	Gui Add, CheckBox, VFshutdown x370 y170 w55 h20, 关机
	Gui Add, Edit, 0x2000 Limit VFfrequency x365 y200 w35 h20, 20
	Gui Add, Text, x405 y200 w20 h20 +0x200, 次
	Gui Font, s10, ; 定义后方字号
	Gui Add, Button, Default x365 y230 w55 h30, 执行

Gui Tab, 3
	Gui Font, s9, ; 定义后方字号
	Gui Add, Button, x10 y30 w130 h40, 冗沉垃圾清理
	Gui Add, Button, x150 y30 w130 h40, 网络dns缓存清理
	Gui Add, Button, x290 y30 w130 h40, 解除拖动打开限制
	Gui Add, Button, x10 y75 w130 h40, 系统检测及修复
	Gui Add, Button, x150 y75 w130 h40, 敬请期待

Gui Tab, 4
	Gui Add, Button, x10 y30 w130 h40, 窗口置顶或取消
	Gui Add, Button, x150 y30 w130 h40, 去除快捷方式箭头
	Gui Add, Button, x290 y30 w130 h40, 恢复快捷方式小箭头
	Gui Add, Button, x10 y75 w130 h40, 系统详细信息
	Gui Add, Button, x150 y75 w130 h40, 敬请期待
{ ; 禁用隐藏初始控件
	GuiControl, Disable, Button10
	GuiControl, Disable, Button11
	GuiControl, Disable, ListBox1
	GuiControl, Disable, Edit2
	GuiControl, Hide, Button10
	GuiControl, Hide, Button11
	GuiControl, Hide, ListBox1
	GuiControl, Hide, Edit2
}
tt := 0
Loop, 10 ; 程序开启延展
{
	tt := % tt + 43
	Gui Show, w%tt% h300 Center, ‎Everything has a spirit ; 程序开启
}
Gui Show, w430 h300 Center, ‎Everything has a spirit
WinGetPos, , , sizeW, sizeH, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 获取 Everything has a spirit 窗口的大小
dimensionH := sizeH
dimensionW := sizeW
CV = 1.5.1 ; 当前版本
Gosub, New ; 启动更新检查
Return

F7::Pause ; 全局暂停
Return
F3::
	Hotkey, F3, , OFF
	Reload ; 强制重启程序
Return

GuiDropFiles:
	If A_GuiControl = TXTQQ号码粗排版
	{
		FileRead, file, %A_GuiEvent%
		If file = 
		{
			#Persistent
			ToolTip, 文件不合法或文件为空已取消排版 ; 提示气泡
			SetTimer, RemoveToolTip, 2000
			Return
		}
		file := RegExReplace(file, "[^0-9]", "`n") ; 数字以外转换为空行
		file := RegExReplace(file, "13395511043|17361881042|17361881042|0551-65522028|17361881041|13395511040", "`n") ; 这里是经常出现的无关电话号码转换为空行
		file := RegExReplace(file, "(*BSR_ANYCRLF)\R+", "`n") ; 清除空行
		FileDelete, %A_GuiEvent%
		FileAppend, %file%, %A_GuiEvent%
		#Persistent
		ToolTip, 格式已整理完成 ; 提示气泡
		SetTimer, RemoveToolTip, 1000
	}
	Else If A_GuiControl = txt文件拖动到此处`n即可自动排版
	{
		FileRead, file, %A_GuiEvent%
		If file = 
		{
			#Persistent
			ToolTip, 文件不合法或文件为空已取消排版 ; 提示气泡
			SetTimer, RemoveToolTip, 2000
			Return
		}
		file := RegExReplace(file, "[^0-9]", "`n") ; 数字以外转换为空行
		file := RegExReplace(file, "13395511043|17361881042|17361881042|0551-65522028|17361881041|13395511040", "`n") ; 无关电话号码转换为空行
		file := RegExReplace(file, "(*BSR_ANYCRLF)\R+", "`n") ; 清除空行
		FileDelete, %A_GuiEvent%
		FileAppend, %file%, %A_GuiEvent%
		#Persistent
		ToolTip, 格式已整理完成 ; 提示气泡
		SetTimer, RemoveToolTip, 1000
	}
	Return
Button点击开始排版:
	Gui +OwnDialogs ; 下方窗口运行时禁止操作母窗口
	FileSelectFile, file, , , 选择QQ号文本文件, *.txt ; 文件选择窗口
	tt = %file%
	FileRead, file, %file%
	If file = 
	{
		#Persistent
		ToolTip, 未选择文件或文件为空已取消排版 ; 提示气泡
		SetTimer, RemoveToolTip, 2000
		Return
	}
	file := RegExReplace(file, "[^0-9]", "`n") ; 数字以外转换为空行
	file := RegExReplace(file, "13395511043|17361881042|17361881042|0551-65522028|17361881041|13395511040", "`n") ; 无关电话号码转换为空行
	file := RegExReplace(file, "(*BSR_ANYCRLF)\R+", "`n") ; 清除空行
	FileDelete, %tt%
	FileAppend, %file%, %tt%
	#Persistent
	ToolTip, 格式已整理完成 ; 提示气泡
	SetTimer, RemoveToolTip, 1000
	Return
; 加好友与发广告集中执行区域
Button导入QQ号码列表:
	Gui +OwnDialogs ; 下方窗口运行时禁止操作母窗口
	FileSelectFile, file, , , 选择QQ号文本文件, *.txt ; 文件选择窗口
	GuiControl, -Redraw, ListBox1 ; 禁用控件重绘
	GuiControlGet, QList, , ListBox1 ; 获取选中项内容
	If QList = 请先点击导入QQ号码列表按钮
	{
		GuiControl, , ListBox1, | ; 清空列表
	}
	Loop, Read, %file%, ; 逐行读取已选文件
	{
		GuiControl, , ListBox1, %A_LoopReadLine% ; 向列表写入新内容
	}
	GuiControl, +Redraw, ListBox1 ; 启用控件重绘
	GuiControl, Choose, ListBox1, 1 ; 选中列表第一项
	Return
Button清空QQ号码列表:
	GuiControl, , ListBox1, |请先点击导入QQ号码列表按钮 ; 置换回初始列表
	GuiControl, Choose, ListBox1, 1 ; 选中列表第一项
	Return
Button执行:
	Process, Exist, QQ2010自动接收器.exe ; 检测进程
	Loop
	{
		If ErrorLevel > 0 ; 判断是否存在进程
		{
			MsgBox, 262195, 警告, 自动接收器和程序运行有冲突，是否关闭自动接收器？ ; 提示窗口
			IfMsgBox, Yes
			{
				Process, Close, QQ2010自动接收器.exe ; 结束进程
				Process, WaitClose, QQ2010自动接收器.exe, 3
				Process, Exist, QQ2010自动接收器.exe ; 检测进程
				Continue
			}
			Else IfMsgBox, Cancel
			{
				Return
			}
		}
		Break
	}

	If !FileExist("ETHAS\empty.exe") ; 检测并写入必要插件
	{
		Gosub, empty连续数据
		loop 2
		{
			HexDataX := ( HexDataX 20190717193554_%a_index% )
			HexDataX%a_index% =
		}
		WriteFile("empty.exe",HexDataX)
		FileCreateDir, ETHAS\
		FileMove, empty.exe, ETHAS\
	}

	Gui, Submit, NoHide ; 控件内容写入变量不隐藏窗口
	If function = 加好友
	{
		If Jway = 1
		{
			If Greetings = 请在这里输入问候语
			{
				Greetings =
			}

			F5:
			IfWinNotExist, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe
			{
				MsgBox, 262165, 缺少必要条件, 没有检测到营销QQ窗口，请确保营销QQ窗口处于打开状态, 5
				IfMsgBox, Retry
				{
					Goto, F5
				}
				Return
			}

			#Persistent
			ToolTip, 注意：F7 是全局暂停/继续 ，F3 是全局强制重启主程序
			SetTimer, RemoveToolTip, 3500

			WinHide, ‎Everything has a spirit ahk_class AutoHotkeyGUI
			WinMinimizeAll ; 最小化所有窗口
			Sleep, 150
			WinMaximize, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 最大化营销QQ 黄金套餐窗口
			MsgBox, 4161, 提示, 请在客户管理中打开靠后的失效客户列表并选中最底部的客户，点击确定继续
			IfMsgBox, Cancel
			{
				WinShow, ‎Everything has a spirit ahk_class AutoHotkeyGUI
				Return
			}
			BlockInput, SendAndMouse ; 开启规避用户鼠标和键盘输入
			加为好友:="|<>48.809U80208SBU9z70zP5Uy6Tz9HTySA609H12G87y9H12Hz769H3GK8D49H2+A89gNH62C8MsFTA2O8FsrHMyksr7U"
			已失效:="|<>35.00108Fzsm0NU0lznzy1a82gjz8E9tTyTzlGk0zwoRU470sn08P0la0nX2rbzQ3sNk"
			左翻页:="|<>50.00000036AA00601zz7003U0ognU01k07zhk00s006/Q00C00TynU01k068AQ00C01zv3001U03W0000003fU000003Wu"
			取消:="|<>23.T0GGryqhB85HuKTooaUjf1zTQ3yaMo7yljyPmEEwwXUU16U"
			滚页 = 0
			Loop, %Jfrequency%
			{
				loop ; 直到成功点击已失效
				{
					WinActivate, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 激活营销QQ主窗口
					If 识别结果(675,712,150000,150000,已失效,"*120",X,Y,OCR,0,0)
					{
						CoordMode, Mouse ; 相对屏幕执行鼠标动作
						Click, right, %X%, %Y%
						break
					}
					Else
					{
						MsgBox, 4149, 丢失目标, 当前页面未发现已失效客户或未选中其中一个失效客户，请切换列表或选中其中一个失效客户后重试, 60
						IfMsgBox, Timeout
						{
							break, 2
						}
						Else IfMsgBox, Cancel
						{
							WinShow, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 显示程序主窗口
							Return
						}
					}
				}
				tt = 0 ; 此处用作容错判断
				Loop ; 直到成功点击加为好友
				{
					Sleep, 50
					If 识别结果(961,761,150000,150000,加为好友,"*140",X,Y,OCR,0,0) ; 获取加为好菜单项坐标
					{
						CoordMode, Mouse ; 相对屏幕执行鼠标动作
						Click, %X%, %Y%
						break
					}
					tt := % tt+1
					If tt = 3 ; 超过 3 次未找到加为好友即重启大循环
					{
						Continue, 2
					}
					Click, right
				}
				Loop ; 直到添加客户窗口消失
				{
					WinWait, 添加客户 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 等待添加客户窗口
					WinGetPos, , , , sizeH, 添加客户 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 获取当前添加客户窗口的高度
					If sizeH = 294 ; 添加步骤
					{
						If Greetings != 
						{
							Clipboard := Greetings
							ControlClick, x155 y163, 添加客户 ahk_class TXGuiFoundation ahk_exe QQCRM.exe
							Send, ^a
							Send, ^v
						}
						ControlClick, x220 y277, 添加客户 ahk_class TXGuiFoundation ahk_exe QQCRM.exe
					}
					Else If sizeH = 150 ; 完成确认
					{
						WinActivate, 添加客户 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 激活添加客户弹窗
						CoordMode, Mouse, Window ; 相对当前活动窗口执行鼠标动作
						Click, 296, 133, 1 ; 确定
						WinWaitClose, 添加客户 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 等待添加客户弹窗消失
						Break
					}
					Else If sizeH = 246 ; 跳过需要验证客户
					{
						WinActivate, 添加客户 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 激活添加客户弹窗
						If 识别结果(691,546,150000,150000,取消,"*150",X,Y,OCR,0,0)
						{
							CoordMode, Mouse ; 相对屏幕执行鼠标动作
							Click, %X%, %Y% ; 取消
							Break
						}
					}
					Sleep, 50
				}
				WinActivate, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 激活营销QQ主窗口
				If 滚页 = 4
				{
					Click, WheelUp, 1 ; 向上滚动一次
					滚页 = 0
					Sleep, 500
				}
				If 识别结果(675,712,150000,150000,已失效,"*120",X,Y,OCR,0,0)
				{
					WinGetPos, , coordinatesY, , , 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 获取当前窗口的 Y 坐标
					Y := % Y-25 ; 偏移到新坐标
					coordinatesY := % Y-coordinatesY ; 计算新坐标差值
					If coordinatesY < 145 ; 到达顶部自动调整页面
					{
						If 识别结果(1044,730,150000,150000,左翻页,"*136",X,Y,OCR,0,0)
						{
							CoordMode, Mouse ; 相对屏幕执行鼠标动作
							Click, %X%, %Y% ; 点击左翻页按钮
							Y := % Y-43 ; 坐标偏移
							CoordMode, Mouse ; 相对屏幕执行鼠标动作
							MouseMove, X, Y ; 鼠标移动到偏移后坐标
							Click, WheelDown, 5 ; 向下滚动5次
							滚页 = 0
							Sleep, 1000
							CoordMode, Mouse ; 相对屏幕执行鼠标动作
							Click, %X%, %Y% ; 点击偏移后坐标
							Continue
						}
					}
					CoordMode, Mouse ; 相对屏幕执行鼠标动作
					Click, %X%, %Y%
				}
				滚页 := % 滚页+1
			}
			BlockInput, Default ; 停用规避用户鼠标和键盘输入
		}
		Else If Jway = 2
		{	
			F4:

			IfWinNotExist, ahk_class Notepad ahk_exe NOTEPAD.EXE
			{
				IfWinNotExist, 查找 ahk_class TXGuiFoundation
				{
					MsgBox, 262165, 缺少必要条件, 没有检测到QQ查找界面和需要添加的QQ号码文档，请确保QQ好友查找窗口和QQ号码txt文档窗口处于打开状态, 6
					IfMsgBox, Retry
					{
						Goto, F4
					}
					Return
				}
				MsgBox, 262165, 缺少必要条件, 没有检测到需要添加的QQ号码文档，请确保QQ号码txt文档窗口处于打开状态, 5
				IfMsgBox, Retry
				{
					Goto, F4
				}
				Return
			}
			Else IfWinNotExist, 查找 ahk_class TXGuiFoundation
			{
				MsgBox, 262165, 缺少必要条件, 没有检测到QQ查找界面，请确保QQ好友查找窗口处于打开状态, 5
				IfMsgBox, Retry
				{
					Goto, F4
				}
				Return
			}

			#Persistent
			ToolTip, 注意：F7 是全局暂停/继续 ，F3 是全局强制重启主程序
			SetTimer, RemoveToolTip, 3500

			WinHide, ‎Everything has a spirit ahk_class AutoHotkeyGUI
			WinMinimizeAll ; 最小化所有窗口
			WinRestore, 查找 ahk_class TXGuiFoundation  ; 恢复查找窗口
			WinRestore, ahk_class Notepad ahk_exe NOTEPAD.EXE ; 恢复QQ号码文档窗口
			WinMove, ahk_class Notepad ahk_exe NOTEPAD.EXE,, 0, 120, 143, 600  ; 调整QQ号码txt文档窗口位置和尺寸

			Loop, %Jfrequency% ; 循环%Jfrequency%变量指定的循环次数
			{
				WinActivate, ahk_class Notepad ahk_exe NOTEPAD.EXE ; 激活txt文本窗口
				Sleep,10
				SetControlDelay -1  ; 这样可以避免在点击时按住鼠标, 减少对用户使用鼠标的干扰.
				ControlClick, Edit1, ahk_class Notepad ahk_exe NOTEPAD.EXE,, Left, 3,  x29 y9 NA ; 光标移动到编辑区首行并单击
				Send, ^{Right} ; 光标移动到当前行右侧
				Sleep, 10
				Send, ^+{Left} ; 当前行从光标位置向左选中一段连续字符
				Sleep, 10
				Send, ^x ; 剪切选中字符
				Sleep, 10
				Send, {Down} ; 光标向下移动一行
				Sleep, 10
				Send, {Backspace} ; 向左删除一个字符位
				Sleep, 10
				WinActivate, 查找 ahk_class TXGuiFoundation ; 激活QQ查找窗口
				Sleep, 10
				SetControlDelay -1  ; 这样可以避免在点击时按住鼠标, 减少对用户使用鼠标的干扰.
				ControlClick, , 查找 ahk_class TXGuiFoundation,, Left, 1,  x68 y101 NA ; 光标定位到输入条
				Send, ^a ; 全选输入条内所有内容
				Send, ^v ; 粘贴内容到输入条
				Send, {Enter}
				Loop ; 循环直到开始搜索
				{
					CoordMode, Pixel, Window
					PixelGetColor, color, 455, 390, RGB
				}
				Until color != 0xFFFFFF
				Loop ; 循环直到搜索完成
				{
					CoordMode, Pixel, Window
					PixelGetColor, color, 455, 390, RGB
				}
				Until color = 0xFFFFFF
				Sleep, 50
				CoordMode, Pixel, Window ; 设定坐标方式相对于当前活动窗口
				PixelGetColor, color, 104, 304, RGB ; 获取指定坐标点色值
				If color = 0x8FC0E7 ; 如果搜索到相关QQ执行下方
				{
					Loop, 8 ; 焦点转移到+好友按钮
					{
						Send, {Tab}
					}
					Sleep, 10
					Send, {Enter}
					SetTitleMatchMode, 2 ; 下方匹配为包含匹配
					WinWait, 添加好友 ahk_class TXGuiFoundation
					Sleep, 200
					Send, {Enter}
					Sleep, 200
					Send, {Enter}
					loop ; 出现完成时点击
					{
						CoordMode, Pixel, Window ; 设定坐标方式相对于当前活动窗口
						PixelGetColor, color, 319, 346, Alt RGB ; 获取指定坐标点色值
						If color = 0xE3E3E2
						{
							Send, {Enter}
							Break
						}
					}
				}
			}
		}
		Else
		{
			ToolTip, 未选择应用模式！
			SetTimer, RemoveToolTip, 2000
			Return
		}

		#Persistent
		ToolTip, 已添加完成
		SetTimer, RemoveToolTip, 2000

		If Jshutdown = 0
		{
			WinShow, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 显示程序主窗口
			return
		}
		Else If Jshutdown = 1
		{
			Shutdown, 1
			Return
		}
	}
	Else If function = 发广告
	{
		If paragraph = 请在这里输入广告词
		{
			#Persistent
			ToolTip, 没有输入广告词，无法继续！请重新输入需要发送的广告词。
			SetTimer, RemoveToolTip, 4000
			return
		}
		Else If paragraph = 
		{
			#Persistent
			ToolTip, 没有输入广告词，无法继续！请重新输入需要发送的广告词。
			SetTimer, RemoveToolTip, 4000
			return
		}

		If Fway = 1
		{
			F1:
			IfWinNotExist, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe
			{
				MsgBox, 262165, 缺少必要条件, 没有检测到营销QQ窗口，请确保营销QQ窗口处于打开状态, 5
				IfMsgBox, Retry
				{
					Goto, F1
				}
				Return
			}

			#Persistent
			ToolTip, 注意：F7 是全局暂停/继续 ，F3 是全局强制重启主程序
			SetTimer, RemoveToolTip, 3500

			WinHide, ‎Everything has a spirit ahk_class AutoHotkeyGUI
			WinMinimizeAll ; 最小化所有窗口
			Sleep, 150
			PostMessage, 0x112, 0xF120,,, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe, , ; 还原营销QQ 黄金套餐窗口
			MsgBox, 4161, 提示, 请在客户管理中打开靠后的未失效客户列表，点击确定继续
			IfMsgBox, Cancel
			{
				WinShow, ‎Everything has a spirit ahk_class AutoHotkeyGUI
				Return
			}
			tt = 0
			BlockInput, SendAndMouse ; 开启规避用户鼠标和键盘输入
			WinMove, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe, , , , 980, 640 ; 更改营销QQ主窗口尺寸
			Loop, %Ffrequency% ; 循环%Ffrequency%变量指定的循环次数
			{
				WinActivate, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 激活营销QQ主窗口
				CoordMode, Mouse, Window ; 相对当前活动窗口执行鼠标动作
				Click, 280, 156 Left, 1 ; 点击首个客户 
				Send, {Enter}
				Loop
				{
					Sleep, 100
					CoordMode, Pixel, Window ; 色彩坐标相对当前活动窗口
					PixelSearch, PX, PY, 516, 594, 516, 594, 0xFFFFFF, 0, Fast RGB ; 判断视图是否跳转到会话窗口
					If ErrorLevel = 0
					{
						Break ; 结束循环
					}
					Else If ErrorLevel = 1
					{
						IfWinNotExist, 身份验证 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 检查是否弹出身份验证对话框
						{
							IfWinExist, 提示 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 检查是否弹出提示证对话框
							{
								MsgBox, 4144, 提示, 建议切换列表后再单击确定继续执行，如果是会话量达到上限可以按键盘上的 F3 键直接结束。, 60
								IfMsgBox, Timeout
								{
									Break, 2
								}
								IfWinNotExist, 提示 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 检查是否弹出提示证对话框
								{
									Click, 280, 156 Left, 1 ; 点击首个客户 
									Send, {Enter}
								}
							}
						}
						Else
						{
							If tgyzm = 1
							{
								SendRaw, 中山狼杨立博
								Send, {Enter}
							}
							Else If tgyzm = 0
							{
								MsgBox, 4144, 提示, 请输入验证码后再单击确定继续执行。, 60
								IfMsgBox, Timeout
								{
									Break, 2
								}
							}
						}
					}
				}
				Clipboard := paragraph ; 发送内写入剪切板
				Send, ^v ; 粘贴内容到输入区域
				Sleep, 200
				ControlClick, x561 y616, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 点击发送
				Sleep, 100
				ControlClick, x478 y621, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 点击关闭会话
				Sleep, 100
				ControlClick, x215 y37, 营销QQ 黄金套餐 ahk_class TXGuiFoundation ahk_exe QQCRM.exe ; 点击客户管理
				Loop
				{
					Sleep, 50
					CoordMode, Pixel, Window ; 色彩坐标相对当前活动窗口
					PixelSearch, PX, PY, 516, 594, 516, 594, 0xFFFFFF, 0, Fast RGB ; 判断视图是否跳转到客户管理窗口
					If ErrorLevel = 1
					{
						Break ; 结束循环
					}
				}
				tt := % tt+1
				If tt = 1
				{
					RunWait, ETHAS\empty.exe *.exe, , Hide
				}
				Else If tt = 10
				{
					tt = 0
				}
			}
			BlockInput, Default ; 停用规避用户鼠标和键盘输入
		}
		Else If Fway = 2
		{
			F2:
			IfWinNotExist, 企业QQ ahk_class TXGuiFoundation ahk_exe QQEIM.exe
			{
				IfWinNotExist, QQ ahk_class TXGuiFoundation ahk_exe QQ.exe
				{
					MsgBox, 262165, 缺少必要条件, 没有检测到QQ或企业QQ主窗口，请确保检测到QQ或企业QQ主窗口处于打开状态, 5
					IfMsgBox, Retry
					{
						Goto, F2
					}
					Return
				}
			}
			Else IfWinExist, QQ ahk_class TXGuiFoundation ahk_exe QQ.exe
			{
				MsgBox, 262165, 条件溢出, 企业QQ和QQ主窗口无法同时共存！！！, 请确保只打开其中一个主窗口，不要重复, 5
				IfMsgBox, Retry
					{
						Goto, F2
					}
					Return
			}

			#Persistent
			ToolTip, 注意：F7 是全局暂停/继续 ，F3 是全局强制重启主程序
			SetTimer, RemoveToolTip, 3500

			WinHide, ‎Everything has a spirit ahk_class AutoHotkeyGUI
			WinMinimizeAll
			SetTitleMatchMode, 2 ; 窗口标题的某个位置必须包含 QQ 才能匹配
			WinRestore, QQ ahk_class TXGuiFoundation ; 还原QQ主窗口
			MsgBox, , 提示, 请单击选中待发送列表中的开始第一个客户后，点击确认继续
			adaptive := 0
			Sleep, 300
			
			Loop, %Ffrequency% ; 循环%Ffrequency%变量指定的循环次数
			{
				adaptive += 1
				SetTitleMatchMode, 2
				WinActivate, QQ ahk_class TXGuiFoundation
				SetTitleMatchMode, 2
				ControlClick, QQ, ahk_class TXGuiFoundation,, Left, 1,  x93 y18 NA
				Send, {Tab}{Tab}
				If adaptive > 1
				{
					Sleep, 300
					Send, {Down}
				}
				Sleep, 300
				Send, {Enter}
				Sleep, 300
				Clipboard := paragraph ; 发送内写入剪切板
				Send, ^v
				Sleep, 300
				Send, {Enter}{Escape}
				Sleep, 300
			}
		}
		Else
		{
			#Persistent
			ToolTip, 未选择应用模式！
			SetTimer, RemoveToolTip, 2000
			Return
		}

		#Persistent
		ToolTip, 已发送完成
		SetTimer, RemoveToolTip, 2000

		If Fshutdown = 0
		{
			WinShow, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 显示程序主窗口
			return
		}
		Else If Fshutdown = 1
		{
			Shutdown, 1
			Return
		}
	}
加好友模式:
	Gui, Submit, NoHide ; 控件内容写入变量不隐藏窗口
	GuiControl, Disable, Static2
	GuiControl, Hide, Static2
	If Jway = 1
	{
		GuiControl, Disable, Button10
		GuiControl, Disable, Button11
		GuiControl, Disable, ListBox1
		GuiControl, Enable, Edit2
		GuiControl, Hide, Button10
		GuiControl, Hide, Button11
		GuiControl, Hide, ListBox1
		GuiControl, Show, Edit2
	}
	Else If Jway = 2
	{
		GuiControl, Enable, Button10
		GuiControl, Enable, Button11
		GuiControl, Enable, ListBox1
		GuiControl, Disable, Edit2
		GuiControl, Show, Button10
		GuiControl, Show, Button11
		GuiControl, Show, ListBox1
		GuiControl, Hide, Edit2
	}
	Return
Button冗沉垃圾清理:
	FileDelete, C:\tmp\tt.cmd
	FileAppend,
	(
	@echo off
	echo 正在清理系统垃圾文件，请稍等......
	del /f /s /q %systemdrive%\*.tmp
	del /f /s /q %systemdrive%\*._mp
	del /f /s /q %systemdrive%\*.log
	del /f /s /q %systemdrive%\*.gid
	del /f /s /q %systemdrive%\*.chk
	del /f /s /q %systemdrive%\*.old
	del /f /s /q %systemdrive%\recycled\*.*
	del /f /s /q %windir%\*.bak
	del /f /s /q %windir%\prefetch\*.*
	rd /s /q %windir%\temp & md %windir%\temp
	del /f /q %userprofile%\cookies\*.*
	del /f /q %userprofile%\recent\*.*
	del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
	del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
	del /f /s /q "%userprofile%\recent\*.*"
	echo 清理系统垃圾完成！
	echo. & pause
	), C:\tmp\tt.cmd
	Run *RunAs C:\tmp\tt.cmd
	Return
Button网络dns缓存清理:
	FileDelete, C:\tmp\tt.cmd
	FileAppend,
	(
	@echo off
		arp -d
		nbtstat -R
	ipconfig /flushdns
	echo ~~~~~~~~~~~~~~~~
		echo 目测已经清理干净dns缓存
		pause
	), C:\tmp\tt.cmd
	Run *RunAs C:\tmp\tt.cmd
	Return
Button解除拖动打开限制: ; 由于 ahk不能在本机写入注册表只能取巧了
	FileDelete, C:\tmp\tt.reg
	FileAppend,
	(
	Windows Registry Editor Version 5.00
	[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
	"EnableLUA"=dword:00000000
	), C:\tmp\tt.reg
	Run C:\tmp\tt.reg
	Return
Button系统检测及修复:
	FileDelete, C:\tmp\tt.cmd
	FileAppend,
	(
	@echo off
	color 0f
	title Windows 一键修复
	@echo.
	@echo 以管理员身份运行(A)
	C:\WINDOWS\system32\sfc.exe /scannow
	@echo.
	@echo Done.
	rem shutdown
	@echo.
	@pause
	), C:\tmp\tt.cmd
	Run *RunAs C:\tmp\tt.cmd
	Return
Button窗口置顶或取消:
	Menu Tray, Add, 窗口置顶或取消说明, hint
	Menu Tray, Add, 消除窗口置顶或取消, backout
	Menu, Tray, Tip, ‎Everything has a spirit`n窗口置顶或取消正在运行
	TopAndBottom = open
	hint:
	Hotkey, #BackSpace, , ON
	Hotkey, #End, , ON
	MsgBox, , 说明,
	(LTrim
	按下（Win）+（←Backspace）可以切换当前窗口置顶状态
	按下（win）+（End）可以退出窗口置顶或取消
	)
	Return
	#BackSpace::
	WinSet, AlwaysOnTop, Toggle, A
	Return
	backout:
	#End::
	TopAndBottom =
	Menu, Tray, Tip, ‎Everything has a spirit
	Hotkey, #BackSpace, , OFF
	Hotkey, #End, , OFF
	Menu Tray, DeleteAll
	Return
Button去除快捷方式箭头:
	FileDelete, C:\tmp\tt.cmd
	FileAppend,
	(
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
	taskkill /f /im explorer.exe
	attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
	del "%userprofile%\AppData\Local\iconcache.db" /f /q
	start explorer
	pause
	), C:\tmp\tt.cmd
	Run *RunAs C:\tmp\tt.cmd
	Return
Button恢复快捷方式小箭头:
	FileDelete, C:\tmp\tt.cmd
	FileAppend,
	(
	reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
	taskkill /f /im explorer.exe
	attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
	del "%userprofile%\AppData\Local\iconcache.db" /f /q
	start explorer
	pause
	), C:\tmp\tt.cmd
	Run *RunAs C:\tmp\tt.cmd
	Return
Button系统详细信息:
	FileDelete, C:\tmp\tt.cmd
	FileAppend,
	(
	systeminfo
		pause
	), C:\tmp\tt.cmd
	Run *RunAs C:\tmp\tt.cmd
	Return
Button更新记录:
	run, https://github.com/QL-boy/AutoHotKey-Everything-has-a-spirit/blob/master/Change`%20log.md
	Loop
	{
		URL := "https://raw.githubusercontent.com/QL-boy/AutoHotKey-Everything-has-a-spirit/master/Current%20version"
		If InternetCheckConnection(URL)
		{
			SV := ComObjCreate("WinHttp.WinHttpRequest.5.1")
			SV.Open("GET", "https://raw.githubusercontent.com/QL-boy/AutoHotKey-Everything-has-a-spirit/master/Current%20version", true)
			SV.Send()
			SV.WaitForResponse()
			SV := SV.ResponseText
			SV := RegExReplace(SV, "(*BSR_ANYCRLF)\R+", "") 
			If SV > %CV%
			{
				MsgBox, 786468, 发现新版本(%SV%), 检测到比本机版本(%CV%)更新的服务器版本(%SV%)，是否更新？
				IfMsgBox, Yes
				{
					Run, https://github.com/QL-boy/AutoHotKey-Everything-has-a-spirit/blob/master/Download.md
				}
			}
			Else If SV = %CV%
			{
				MsgBox, 4096, 已是最新, 恭喜！您的 Everyhing has a spirit 是最新版本！
			}
			Else
			{
				MsgBox, 版本存在异常，即将前往下载。
				Run, https://github.com/QL-boy/AutoHotKey-Everything-has-a-spirit/blob/master/Download.md
			}
		}
		else
		{
			Msgbox, 4117, 检查失败, 未连接到服务器，请检查网络连接是否正确。
			IfMsgBox, Retry
			{
				Continue
			}
		}
		Break
	}
	Return
Button问题反馈:
	run, https://jq.qq.com/?_wv=1027&k=5mU2PnP
	Return
标签预判:
	Gui, Submit, NoHide ; 控件内容写入变量不隐藏窗口
	ControlGetText, tt, Button7, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 获取分组框控件内容
	WinGetPos, , , sizeW, sizeH, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 获取 ‎Everything has a spirit 窗口的大小
	If sizeH = %dimensionH% 
	{
		Return
	}
	If tt = %function%帮助
	{
		Return
	}
	Else If tt = 
	{
		Return
	}
	Else If tt = 关于软件
	{
		Return
	}

Button功能帮助:
	Critical ; 防止当前线程被中断
	Gui, Submit, NoHide ; 控件内容写入变量不隐藏窗口
	ControlGetText, tt, Button7, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 获取分组框控件内容
	WinGetPos, , , sizeW, sizeH, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 获取 ‎Everything has a spirit 窗口的大小
		If (sizeH + sizeW > dimensionH + dimensionW)
		{
			If tt = %function%帮助
			{
				tt := 450
				Loop, 30
				{
					tt := % tt-5
					Gui Show, w430 h%tt%, ‎Everything has a spirit ; 程序抽屉关闭
				}
				Gui Show, w430 h300, ‎Everything has a spirit
				Return
			}
			GuiControl, Text, Button7, %function%帮助
			If function = 加好友
			{
				help := 加好友
			}
			Else If function = 发广告
			{
				help := 发广告
			}
			Else If function = 优化修复
			{
				help := 优化修复
			}
			Else If function = 辅助增强
			{
				help := 辅助增强
			}
			GuiControl, Text, Edit1, %help%
			Return
		}
	GuiControl, Text, Button7, %function%帮助

		If function = 加好友
		{
			help := 加好友
		}
		Else If function = 发广告
		{
			help := 发广告
		}
		Else If function = 优化修复
		{
			help := 优化修复
		}
		Else If function = 辅助增强
		{
			help := 辅助增强
		}
	GuiControl, Text, Edit1, %help%
	tt := 300
	Loop, 30
	{
		tt := % tt+5
		Gui Show, w430 h%tt%, ‎Everything has a spirit ; 程序抽屉打开
	}
	Gui Show, w430 h450, ‎Everything has a spirit
	#Persistent
	ToolTip, 再次点击关闭抽屉 ; 提示气泡
	SetTimer, RemoveToolTip, 1500
	Return

Button关于软件:
	Critical ; 防止当前线程被中断
	ControlGetText, tt, Button7, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 获取分组框控件内容
	WinGetPos, , , sizeW, sizeH, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 获取 ‎Everything has a spirit 窗口的大小
		If (sizeH + sizeW > dimensionH + dimensionW)
		{	
			If tt = 关于软件
			{
				tt := 450
				Loop, 30
				{
					tt := % tt-5
					Gui Show, w430 h%tt%, ‎Everything has a spirit ; 程序抽屉关闭
				}
				Gui Show, w430 h300, ‎Everything has a spirit
				Return
			}
			GuiControl, Text, Button7, 关于软件
			GuiControl, Text, Edit1, 千灵辅助是一款为了帮助将接单员从大部分重复枯燥的工作钟解放出来的快捷工具箱。`n她除了可以简化大部分的工作流程外，也提供了一些实用工具用来增强和优化工作环境。`n目前也许并不强大，但每次更新都会变得更好的。`n在不断的探索中成长，相信千灵最终也会变成你最好的工作伙伴之一！`n（作者：千灵）
			Return
		}
	GuiControl, Text, Button7, 关于软件
	GuiControl, Text, Edit1, 千灵辅助是一款为了帮助将接单员从大部分重复枯燥的工作钟解放出来的快捷工具箱。`n她除了可以简化大部分的工作流程外，也提供了一些实用工具用来增强和优化工作环境。`n目前也许并不强大，但每次更新都会变得更好的。`n在不断的探索中成长，相信千灵最终也会变成你最好的工作伙伴之一！`n（作者：千灵）
	tt := 300
	Loop, 30
	{
		tt := % tt+5
		Gui Show, w430 h%tt%, ‎Everything has a spirit ; 程序抽屉打开
	}
	Gui Show, w430 h450, ‎Everything has a spirit
	#Persistent
	ToolTip, 再次点击关闭抽屉 ; 提示气泡
	SetTimer, RemoveToolTip, 1500
	Return

Button查看在线帮助:
	Gui, Submit, NoHide
	Run, https://github.com/QL-boy/AutoHotKey-Everything-has-a-spirit/wiki
	Return
Button敬请期待:
	MsgBox, 更多功能敬请期待！
	Return
实验性:
	Gui, Submit, NoHide ; 控件内容写入变量不隐藏窗口
	If tgyzm = 1
	{
		MsgBox, 262196, 警告！, 此为实验性功能，可能存在未知错误及不稳定情况，是否继续开启？
		IfMsgBox, No
		{
			Control, UnCheck, , Button18, ‎Everything has a spirit ahk_class AutoHotkeyGUI
			Return
		}
		#Persistent
		ToolTip, 已成功开启，如出现异常情况需要再次关闭
		SetTimer, RemoveToolTip, 2500
	}
	Return
RemoveToolTip:
	SetTimer, RemoveToolTip, Off
	ToolTip  ; 消除提示气泡
	Return
New:
	Loop
	{
		URL := "https://raw.githubusercontent.com/QL-boy/AutoHotKey-Everything-has-a-spirit/master/Current%20version"
		If InternetCheckConnection(URL)
		{
			SV := ComObjCreate("WinHttp.WinHttpRequest.5.1")
			SV.Open("GET", "https://raw.githubusercontent.com/QL-boy/AutoHotKey-Everything-has-a-spirit/master/Current%20version", true)
			SV.Send()
			SV.WaitForResponse()
			SV := SV.ResponseText
			SV := RegExReplace(SV, "(*BSR_ANYCRLF)\R+", "") 
			If SV > %CV%
			{
				MsgBox, 786468, 发现新版本(%SV%), 检测到比本机版本(%CV%)更新的服务器版本(%SV%)，是否更新？
				IfMsgBox, Yes
				{
					Run, https://github.com/QL-boy/AutoHotKey-Everything-has-a-spirit/blob/master/Download.md
				}
			}
			Else If SV = %CV%
			{
				Break
			}
			Else
			{
				MsgBox, 版本存在异常，即将前往下载。
				Run, https://github.com/QL-boy/AutoHotKey-Everything-has-a-spirit/blob/master/Download.md
			}
		}
		Break
	}
	Return
GuiEscape:
	Critical ; 防止当前线程被中断
	WinGetPos, , , sizeW, sizeH, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 获取 ‎Everything has a spirit 窗口的大小
	If (sizeH + sizeW > dimensionH + dimensionW)
	{
		tt := 450
		Loop, 30
		{
			tt := % tt-5
			Gui Show, w430 h%tt%, ‎Everything has a spirit ; 程序抽屉关闭
		}
		Return
	}
	Gui Show, w430 h300, ‎Everything has a spirit ; 程序抽屉关闭
	Return
GuiClose:
	If TopAndBottom = open
	{
		MsgBox, 4129, 存在子任务, (窗口置顶或取消)还在运行中确定退出么？
		IfMsgBox, Cancel
		{
			Return
		}
	}
	WinGetPos, , , sizeW, sizeH, ‎Everything has a spirit ahk_class AutoHotkeyGUI ; 获取 ‎Everything has a spirit 窗口的大小
	If (sizeH + sizeW > dimensionH + dimensionW)
	{
		sizeH := % sizeH-(sizeH-450)
	}
	Else
	{
		sizeH := % sizeH-(sizeH-300)
	}
	tt := 430
	Loop, 43
	{
		tt := % tt-10
		Gui Show, w%tt% h%sizeH%, ‎Everything has a spirit ; 程序关闭
	}
	ExitApp

InternetCheckConnection(Url="",FIFC=1) ; 联网检测函数
{
	Return DllCall("Wininet.dll\InternetCheckConnectionW", Str,Url, Int,FIFC, Int,0)
}
GetLoggedinQQ() ; 已登录 QQ 检测函数
{
	static wb
	Gui, New
	Gui, Add, ActiveX, w0 h0 vwb, % "http://xui.ptlogin2.qq.com/cgi-bin/xlogin?appid=501038301&proxy_url=http%3A%2F%2Fid.qq.com%2Flogin%2Fproxy.html&s_url=http%3A%2F%2Fim.qq.com%2F"
		While wb.readystate != 4 || wb.busy
			Sleep, 100
		result := wb.document.body.innerHTML
		qq := ""
		loop
		{
			RegExMatch(result, "O)uin=""(\d+)"">", match, (match ? match.Pos(1) : 1))
			if (not match)
			{
				break
			}
			qq .= match.Value(1) . ", "
		}
		qq := RTrim(qq, " ,")
	Gui, Destroy
	Return qq
}
WriteFile(file,data) ; 写入扩展数据
{
    Handle :=  DllCall("CreateFile","str",file,"Uint",0x40000000
    ,"Uint",0,"UInt",0,"UInt",4,"Uint",0,"UInt",0)
    Loop
    {
        if strlen(data) = 0
            break
        StringLeft, Hex, data, 2
        StringTrimLeft, data, data, 2
        Hex = 0x%Hex%
        DllCall("WriteFile","UInt", Handle,"UChar *", Hex
        ,"UInt",1,"UInt *",UnusedVariable,"UInt",0)
    }

    DllCall("CloseHandle", "Uint", Handle)
    Return
}
empty连续数据:
20190717193554_1 =
    ( join
    4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000D00000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A24000000000000009B893863DFE85630DFE85630DFE856305CE05930DEE856305CE00B30D0E85630DFE857308EE8563051E00930CDE856305CE00830DEE856305CE00C30DEE8563052696368DFE856300000000000000000504500004C0103004FA1A03E0000000000000000E0000F010B01070A001A000000082D00000000008918000000100000003000000000000100100000000200000500020005000200040000000000000000502D00000400009F3E0000030000800000040000200000000010000010000000000000100000000000000000000000C42100007800000000402D0008040000000000000000000000000000000000000000000000000000201100001C0000000000000000000000000000000000000000000000000000002814000040000000000000000000000000100000200100000000000000000000000000000000000000000000000000002E746578740000003C18000000100000001A000000040000000000000000000000000000200000602E646174610000009C012D000030000000020000001E0000000000000000000000000000400000C02E727372630000000804000000402D00000600000020000000000000000000000000000040000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002E260000462600005E26000000000000D4230000EA230000BE230000182400002C240000AE23000094230000802300006E230000042400005C230000CC250000B0250000A225000094250000842500007625000066250000000000009227000084270000682700005C2700004A27000038270000282700000E270000FA260000E4260000CA260000BA260000A62600009626000080260000A227000000000000FC25000006260000102600001A26000024260000F225000080240000762400006C2400006224000058240000E8250000942400009C240000AA240000B4240000BC240000C8240000D8240000E4240000F8240000082500005825000026250000382500008A240000182500000000000000280000C4270000E427000000000000000000004FA1A03E00000000020000001A0000007014000070080000636F756C64206E6F7420656D70747920776F726B696E672073657420666F722070726F6365737320232564205B25735D0A000000636F756C64206E6F7420656D70747920776F726B696E672073657420666F722070726F63657373202325640A0000000055534147453A20656D7074792E657865207B706964207C207461736B2D6E616D657D0A006D697373696E6720706964206F72207461736B206E616D650A000000556E68616E646C6564457863657074696F6E46696C746572000000006B65726E656C33322E646C6C0000000000000000FFFFFFFFD5190001E91900012C00000053797374656D2050726F63657373000041646A757374546F6B656E50726976696C65676573206661696C656420776974682025640A0000004C6F6F6B757050726976696C65676556616C7565206661696C656420776974682025640A000000005365446562756750726976696C656765000000004F70656E50726F63657373546F6B656E206661696C656420776974682025640A00000000FFFFFFFF9D200001A1200001B1AEABEC197FD211978E0000F8757E2AB2AEABEC197FD211978E0000F8757E2AB3AEABEC197FD211978E0000F8757E2AB4AEABEC197FD211978E0000F8757E2AB5AEABEC197FD211978E0000F8757E2AB6AEABEC197FD211978E0000F8757E2AB7AEABEC197FD211978E0000F8757E2AB8AEABEC197FD211978E0000F8757E2AB9AEABEC197FD211978E0000F8757E2ABAAEABEC197FD211978E0000F8757E2AC1AEABEC197FD211978E0000F8757E2ABBAEABEC197FD211978E0000F8757E2ABCAEABEC197FD211978E0000F8757E2ABEAEABEC197FD211978E0000F8757E2ABFAEABEC197FD211978E0000F8757E2AC0AEABEC197FD211978E0000F8757E2AF32A3751E7CACF11BE8100AA00A2FA253C1F4E7B02A7D211A33600C04F7978E03E0FE941C156334681C36E8BAC8BDD703E0FE941C156334681C36E8BAC8BDD70F1B3D40288FDD111960D00805FC79235824F17D7B836A84A800AE963AB2DFAB9000000004800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001C300001B0140001010000004E423130000000004FA1A03E01000000656D7074792E7064620000000000000000000000000000000000000000000000000000000000000000000000000000007C1A0000558BEC33C039450C7507B857000780EB268B5508568B75108A0E84C97409880A4246FF4D0C75F1837D0C005E75064AB87A000780C602005DC20C0051832580312D010053555657C744241060300001C6056030000100FF15381000018BF08A1E4680FB20740980FB09740484DB75EF8B3DC0100001EB038A1E460FB6C350FFD785C05975F28B2DC41000010FB6FB57FFD585C059742CEB17A180312D018D04808D4447D0A380312D018A06460FB6F857FFD585C05975E1EB1FFF44241088188A1E4684DB8B44241075EF68603000018818FF15C8100001595F5E5D5B59C381ECA0000000A11C3000018324240053898424A0000000E841FFFFFF833D80312D0100754C8A1D6030000184DB750D68C4110001FF15B8100001EB5FB8603000018D50018A084084C975F92BC283F802751F80FB2D740580FB2F7515803D613000013F750C68A0110001FF15B810000159E813070000A180312D0185C0742C50E81509000085C0751BFF3580312D016870110001FF15B81000015933C05940E91C01000033C0E9150100005556576800040000BE8031000156E8B60600008BD88D442418508974241C895C2420E84E0B000085DB767DBF90310001895C24148D6F105568800000008D44243450E830FEFFFF8D44242C6A2E50FF15BC10000185C059597403C600006A00BE60300001568D44243450E87007000085C0751E505655E86407000085C07512505681C58000000055E85207000085C07406C7070100000081C7400B0000FF4C24147591BE8031000185DBBD3C11000176328D7E20837FF0007420FF36E82E08000085C0751557FF3655FF15B810000183C40CC74424100100000081C6400B00004B75CE6A006860300001BE1430000156E8EA06000085C07415E84208000085C0750C565055FF15B810000183C40C8B4424105F5E5D5B8B8C249C00000081C4A0000000E986000000558BEC83EC10A11C30000185C074073D4EE640BB756E568D45F850FF15141000018B75FC3375F8FF151010000133F0FF151810000133F0FF152410000133F08D45F050FF15281000018B45F43345F033F089351C300001750AC7051C3000014EE640BB68FC110001FF152C10000185C05E741168E011000150FF1530100001A388312D01C9C33B0D1C3000017501C3E900000000558DAC2458FDFFFF81EC28030000A11C3000018985A4020000A184312D0185C07402FFD0833D88312D0100743E5733C02145D86A13598D7D84F3ABB9B20000008D7DDCF3AB8D45808945D08D45D86A00C74580090400C08945D4FF15201000018D45D050FF1588312D015F6802050000FF151C10000150FF15341000018B8DA4020000E86AFFFFFF81C5A8020000C9C36A286810120001E89B01000066813D000000014D5A7528A13C00000181B8000000015045000075170FB7881800000181F90B010000742181F90B02000074068365E400EB2A83B8840000010E76F133C93988F8000001EB1183B8740000010E76DE33C93988E80000010F95C1894DE48365FC006A01FF15FC10000159830D8C312D01FF830D90312D01FFFF15081100018B0D4C3000018908FF15F41000018B0D483000018908A1F01000018B00A394312D01E8EC000000833D2030000100750C682C1A0001FF15EC10000159E8C00000006810300001680C300001E8AB000000A1443000018945DC8D45DC50FF35403000018D45E0508D45D8508D45D450FF15E41000018945CC68083000016800300001E8750000008B45E08B0DE01000018901FF75E0FF75D8FF75D4E8DAFBFFFF83C4308BF08975C8837DE400750756FF15DC100001FF15D8100001EB2D8B45EC8B088B09894DD05051E8280000005959C38B65E88B75D0837DE400750756FF15D0100001FF1504110001834DFCFF8BC6E85E000000C3FF25D4100001FF25E810000168000003006800000100E8590000005959C333C0C3CC687C1A000164A100000000508B442410896C24108D6C24102BE05356578B45F88965E8508B45FCC745FCFFFFFFFF8945F88D45F064A300000000C38B4DF064890D00000000595F5E5BC951C3FF2500110001FF25F8100001558BEC83EC20A198312D015333DB895DEC3BC3751D6A046800100000FF352430000153FF154C1000013BC3A398312D01743C53FF3524300001506A05FF15181100013D040000C0752C81052430000100200000680080000053FF3598312D01FF155010000133C0A398312D01EBA333C0E904020000568B7508578B3D98312D01895DF4895DE4395F3C74356A018D4738508D45E050FF1514110001395DE474196A5CFF75E4FF15A41000013BC35959740340EB118B45E4EB0CB82F120001EB05B8201200016880000000508D462050FF15A0100001C6869F00000000895E108B474489068B47488946048B47208946088B472489460C8B47588986200100008B475C8986240100008B47608986280100008B476489862C0100008B47688986300100008B470483C40C395D10898634010000743CC1E00350FF15CC1000013BC359898638010000742D8B8E340100003BCB8BD074218D87DC0000008B5810891A8B18895A0483C20883C0404975EDEB06899E38010000C6863C050000008B475089863C09000033C03945148D9E3C010000C6864009000000C603000F84A9000000C745F001000000C74508FF0300008945F80F86920000008B45188945FC8B0E3B482475708B088BC18D50018955E88A104084D275F92B45E8837DF0008945E8741BFF75088365F0005153FF15A01000018B450883C40CC6040300EB2A837D08017624FF7508681C12000153FF15B4100001FF4D08FF75088B45FCFF3053FF15B410000183C4188B45E8394508721B2945088B45FCFF45F88B4DF883C02C3B4D148945FC0F8274FFFFFF8B45EC81C6400B0000403B450C8945EC741B8B3F85FF7415017DF4A198312D018B4DF48D3C0833DBE90CFEFFFF5F5E5BC9C2140033C0505050FF742414FF742414E870FDFFFFC20800558BEC83EC1C8D45FC506A28FF151C10000150FF150810000185C0750EFF1554100001506894120001EB628D45F45068801200016A00FF150410000185C0750EFF1554100001506858120001EB3F8B45F46A008945E88B45F86A006A108945EC8D45E4506A00FF75FCC745E401000000C745F002000000FF150010000185C07518FF1554100001506830120001FF15B8100001595933C0C9C333C040C9C35633F66A006A00566AFDFF15741000018BF085F6740DFF74240C56FF54241085C075E033C0405EC20800568B35BC100001578B7C240C6A2A57FFD685C05959740533C040EB186A3F57FFD685C0595975F06A5B57FFD6F7D8591BC059F7D85F5EC20400538B5C2408568B74241057837C241800743C56E8AFFFFFFF85C075325653FF15AC10000185C0595974248D50018A084084C975F92BC28BCE8BF88D51018A014184C075F92BCA3BF90F84B00000000FB63E4685FF0F84A900000083FF2A0F848C00000083FF3F746C0FB6034383FF5B741350FF15A81000013BC75974D133C0E98600000085C074F550FF15A81000015933D2EB2483F95D74E483F92D75140FB60E85C974D883F95D74D33BC27C043BC17E193BC18BD174130FB60E4685C975D4EB0983F95D74870FB60E4685C975F3E97AFFFFFF8A034384C00F856FFFFFFFEB9C6A005653E816FFFFFF4385C0750F803B0075ED8364241800E90DFFFFFF33C040EB0733C038030F94C05F5E5BC20C00558BEC515657FF750833FF5768FF0F1F00FF15441000018BF03BF7750433C0EB2A8D4508508D45FC5056FF153C10000185C0740E6AFF6AFF56FF154010000133FF4756FF15481000018BC75F5EC9C20400558BEC83EC24834DE8FF834DECFF6A248D45DC506A15FF151011000133C985C00F9DC18BC1C9C3689C00000068B8120001E87DFAFFFFA11C3000018945E433F689B55CFFFFFF8B7D0C8B1F8B4704898558FFFFFF8975FC8D855CFFFFFF50FF7508FF156410000185C00F84B80000006A04FF7508FF156810000185C00F85A50000006AF0FF7508FF156C100001A90000001075093977100F858A00000089B560FFFFFF8B8560FFFFFF3B8558FFFFFF737669C0400B00008D34188B063B855CFFFFFF7554837F10007506837E140075488B45088946148B47088946188B470C89461CBF80000000578D8564FFFFFF50FF7614FF157010000185C0742B8D8564FFFFFF505781C6A000000056E827F4FFFF898554FFFFFFEB0FFF8560FFFFFFEB8333C040C38B65E8834DFCFF33C0408B4DE4E838F7FFFFE8B3F9FFFFC20800515568000000026A006A00FF742418FF15881000018BE885ED7476535657FF151810000150FF157C1000015589442414FF158C100001FF742418FF15B01000018B7424208B1D601000015956BFA41F00015789460CC7461001000000FFD35657E899FCFFFF836610005657FFD35657E88AFCFFFF3B6C24105F5E5B7411FF742404FF158C10000155FF159010000133C0405D59C208005768000000026A00FF742410FF15801000018BF885FF74455356FF15781000018B3584100001578BD8FFD6FF742410FF15B0100001598B4C24145168BB20000157894108FF155C1000013BFB740A53FFD657FF159410000133C05E405B5FC20800FF7424046851210001FF1598100001C204004C22000000000000000000004A24000010100000DC22000000000000000000004C250000A01000003C22000000000000000000007226000000100000982200000000000000000000B82700005C1000004C23000000000000000000001A2800001011000000000000000000000000000000000000000000002E260000462600005E26000000000000D4230000EA230000BE230000182400002C240000AE23000094230000802300006E230000042400005C230000CC250000B0250000A225000094250000842500007625000066250000000000009227000084270000682700005C2700004A27000038270000282700000E270000FA260000E4260000CA260000BA260000A62600009626000080260000A227000000000000FC25000006260000102600001A26000024260000F225000080240000762400006C2400006224000058240000E8250000942400009C240000AA240000B4240000BC240000C8240000D8240000E4240000F8240000082500005825000026250000382500008A240000182500000000000000280000C4270000E4270000000000000801476574436F6D6D616E644C696E654100980147657450726F6341646472657373000077014765744D6F64756C6548616E646C6541000099025175657279506572666F726D616E6365436F756E74657200D5014765745469636B436F756E7400003E0147657443757272656E74546872656164496400003B0147657443757272656E7450726F63657373496400C00147657453797374656D54696D65417346696C6554696D650051035465726D696E61746550726F6365737300003A0147657443757272656E7450726F63657373003D03536574556E68616E646C6564457863657074696F6E46696C746572004B45524E454C33322E646C6C00000D025F73747275707200C4026973646967697400CA02697373706163650008037374726368720000EF027072696E74660000CA005F635F6578697400FB005F65786974004E005F5863707446696C74657200CD005F636578697400009A0265786974000071005F5F696E6974656E760070005F5F6765746D61696E617267730040015F696E69747465726D009E005F5F736574757365726D6174686572720000BB005F61646A7573745F66646976000083005F5F705F5F636F6D6D6F6465000088005F5F705F5F666D6F646500009C005F5F7365745F6170705F747970650000F2005F6578636570745F68616E646C65723300006D73766372742E646C6C0000DB005F636F6E74726F6C6670000069014765744C6173744572726F72000078035669727475616C467265650075035669727475616C416C6C6F6300002E00436C6F736548616E646C65007C024F70656E50726F63657373002A0353657450726F63657373576F726B696E6753657453697A650000A40147657450726F63657373576F726B696E6753657453697A650000E2026D616C6C6F63000010037374726E6361740012037374726E63707900140373747272636872002503746F75707065720016037374727374720000FF015F737472647570001C0041646A757374546F6B656E50726976696C65676573004D014C6F6F6B757050726976696C65676556616C75654100AA014F70656E50726F63657373546F6B656E000041445641504933322E646C6C00004500436C6F736557696E646F7753746174696F6E00004300436C6F73654465736B746F70000078025365745468726561644465736B746F700000F6014F70656E4465736B746F70410000670253657450726F6365737357696E646F7753746174696F6E00FA014F70656E57696E646F7753746174696F6E41000061014765745468726561644465736B746F700000480147657450726F6365737357696E646F7753746174696F6E00E40046696E6457696E646F7745784100770147657457696E646F77546578744100006E0147657457696E646F774C6F6E674100006A0147657457696E646F77007B0147657457696E646F7754687265616450726F6365737349640000DE00456E756D57696E646F777300CE00456E756D4465736B746F70734100DC00456E756D57696E646F7753746174696F6E7341005553455233322E646C6C00006F0352746C556E69636F6465537472696E67546F416E7369537472696E67000028014E74517565727953797374656D496E666F726D6174696F6E00006D014E7453657453797374656D496E666F726D6174696F6E00006E74646C6C2E646C6C006F6C6533322E646C6C004F4C4541555433322E646C6C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006517000100000000000000000000000053797374656D00004EE640BB010000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    )
20190717193554_2 =
    ( join
    00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100100000001800008000000000000000000000000000000100010000003000008000000000000000000000000000000100090400004800000060402D00A403000000000000000000000000000000000000A40334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100020005000000CE0E020005000000CE0E3F00000008000000040004000100000000000000000000000000000002030000010053007400720069006E006700460069006C00650049006E0066006F000000DE02000001003000340030003900300034004200300000004C001600010043006F006D00700061006E0079004E0061006D006500000000004D006900630072006F0073006F0066007400200043006F00720070006F0072006100740069006F006E000000720025000100460069006C0065004400650073006300720069007000740069006F006E00000000004D006900630072006F0073006F0066007400AE00200046006C00750073006800200057006F0072006B0069006E006700200053006500740020005500740069006C0069007400790000000000700028000100460069006C006500560065007200730069006F006E000000000035002E0032002E0033003700390030002E00300020006200750069006C0074002000620079003A00200064006E007300720076005F00640065007600280076002D0073006D00670075006D002900000034000A00010049006E007400650072006E0061006C004E0061006D006500000065006D007000740079002E00650078006500000080002E0001004C006500670061006C0043006F0070007900720069006700680074000000A90020004D006900630072006F0073006F0066007400200043006F00720070006F0072006100740069006F006E002E00200041006C006C0020007200690067006800740073002000720065007300650072007600650064002E0000003C000A0001004F0072006900670069006E0061006C00460069006C0065006E0061006D006500000065006D007000740079002E0065007800650000006A0025000100500072006F0064007500630074004E0061006D006500000000004D006900630072006F0073006F0066007400AE002000570069006E0064006F0077007300AE0020004F007000650072006100740069006E0067002000530079007300740065006D00000000003A000B000100500072006F006400750063007400560065007200730069006F006E00000035002E0032002E0033003700390030002E00300000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000904B00400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    )
Return

; 下方为屏幕找图识别算法
识别结果(x,y,w,h,wz,c,ByRef rx="",ByRef ry="",ByRef ocr=""
	, cha1=0, cha0=0)
{
	xywh2xywh(x-w,y-h,2*w+1,2*h+1,x,y,w,h)
	if (w<1 or h<1)
		return, 0
	bch:=A_BatchLines
	SetBatchLines, -1
	GetBitsFromScreen(x,y,w,h,Scan0,Stride,bits)
	sx:=0, sy:=0, sw:=w, sh:=h
	loop, 2 {
		if PicOCR(Scan0,Stride,sx,sy,sw,sh,wz,c
			,rx,ry,ocr,cha1,cha0)
		{
			rx+=x, ry+=y
			SetBatchLines, %bch%
			return, 1
		}
		if (A_Index=1 and cha1=0 and cha0=0)
			cha1:=0.05, cha0:=0.05
		else break
	}
	SetBatchLines, %bch%
	return, 0
}
xywh2xywh(x1,y1,w1,h1,ByRef x,ByRef y,ByRef w,ByRef h)
{
	SysGet, zx, 76
	SysGet, zy, 77
	SysGet, zw, 78
	SysGet, zh, 79
	left:=x1, Right:=x1+w1-1, up:=y1, down:=y1+h1-1
	left:=left<zx ? zx:left, Right:=Right>zx+zw-1 ? zx+zw-1:Right
	up:=up<zy ? zy:up, down:=down>zy+zh-1 ? zy+zh-1:down
	x:=left, y:=up, w:=Right-left+1, h:=down-up+1
}
GetBitsFromScreen(x,y,w,h,ByRef Scan0,ByRef Stride,ByRef bits)
{
	VarSetCapacity(bits,w*h*4,0), bpp:=32
	Scan0:=&bits, Stride:=((w*bpp+31)//32)*4
	Ptr:=A_PtrSize ? "UPtr" : "UInt", PtrP:=Ptr . "*"
	win:=DllCall("GetDesktopWindow", Ptr)
	hDC:=DllCall("GetWindowDC", Ptr,win, Ptr)
	mDC:=DllCall("CreateCompatibleDC", Ptr,hDC, Ptr)
	VarSetCapacity(bi, 40, 0), NumPut(40, bi, 0, "int")
	NumPut(w, bi, 4, "int"), NumPut(-h, bi, 8, "int")
	NumPut(1, bi, 12, "short"), NumPut(bpp, bi, 14, "short")
	if hBM:=DllCall("CreateDIBSection", Ptr,mDC, Ptr,&bi
		, "int",0, PtrP,ppvBits, Ptr,0, "int",0, Ptr)
	{
		oBM:=DllCall("SelectObject", Ptr,mDC, Ptr,hBM, Ptr)
		DllCall("BitBlt", Ptr,mDC, "int",0, "int",0, "int",w, "int",h
			, Ptr,hDC, "int",x, "int",y, "uint",0x00CC0020|0x40000000)
		DllCall("RtlMoveMemory","ptr",Scan0,"ptr",ppvBits,"ptr",Stride*h)
		DllCall("SelectObject", Ptr,mDC, Ptr,oBM)
	}
	DllCall("DeleteObject", Ptr,hBM)
	DllCall("DeleteDC", Ptr,mDC)
	DllCall("ReleaseDC", Ptr,win, Ptr,hDC)
}
PicOCR(Scan0, Stride, sx, sy, sw, sh, wenzi, c
	, ByRef rx, ByRef ry, ByRef ocr, cha1, cha0)
{
	static MyFunc
	if !MyFunc
	{
		x32:="5589E55383C4808B452C0FAF45248B5528C1E20201D0894"
		. "5F08B5530B80000000029D0C1E00289C28B452401D08945ECC"
		. "745E800000000C745D800000000C745D4000000008B4530894"
		. "5D08B45348945CCC745C800000000837D08000F854D0100008"
		. "B450CC1E81025FF0000008945C48B450CC1E80825FF0000008"
		. "945C08B450C25FF0000008945BC8B4510C1E81025FF0000008"
		. "945B88B4510C1E80825FF0000008945B48B451025FF0000008"
		. "945B08B45C42B45B88945AC8B45C02B45B48945A88B45BC2B4"
		. "5B08945A48B55C48B45B801D08945A08B55C08B45B401D0894"
		. "59C8B55BC8B45B001D0894598C745F400000000E9A6000000C"
		. "745F800000000E9840000008B45F083C00289C28B452001D00"
		. "FB6000FB6C08945C48B45F083C00189C28B452001D00FB6000"
		. "FB6C08945C08B55F08B452001D00FB6000FB6C08945BC8B45C"
		. "43B45AC7C338B45C43B45A07F2B8B45C03B45A87C238B45C03"
		. "B459C7F1B8B45BC3B45A47C138B45BC3B45987F0B8B55E88B4"
		. "53C01D0C600318345F8018345F0048345E8018B45F83B45300"
		. "F8C70FFFFFF8345F4018B45EC0145F08B45F43B45340F8C4EF"
		. "FFFFFE917020000837D08010F85A30000008B450C83C001C1E"
		. "00789450CC745F400000000EB7DC745F800000000EB628B45F"
		. "083C00289C28B452001D00FB6000FB6C06BD0268B45F083C00"
		. "189C18B452001C80FB6000FB6C06BC04B8D0C028B55F08B452"
		. "001D00FB6000FB6D089D0C1E00429D001C83B450C730B8B55E"
		. "88B453C01D0C600318345F8018345F0048345E8018B45F83B4"
		. "5307C968345F4018B45EC0145F08B45F43B45340F8C77FFFFF"
		. "FE96A010000C745F400000000EB7BC745F800000000EB608B5"
		. "5E88B45388D0C028B45F083C00289C28B452001D00FB6000FB"
		. "6C06BD0268B45F083C00189C38B452001D80FB6000FB6C06BC"
		. "04B8D1C028B55F08B452001D00FB6000FB6D089D0C1E00429D"
		. "001D8C1F80788018345F8018345F0048345E8018B45F83B453"
		. "07C988345F4018B45EC0145F08B45F43B45340F8C79FFFFFF8"
		. "B453083E8018945948B453483E801894590C745F401000000E"
		. "9B0000000C745F801000000E9940000008B45F40FAF453089C"
		. "28B45F801D08945E88B55E88B453801D00FB6000FB6D08B450"
		. "C01D08945EC8B45E88D50FF8B453801D00FB6000FB6C03B45E"
		. "C7F488B45E88D50018B453801D00FB6000FB6C03B45EC7F328"
		. "B45E82B453089C28B453801D00FB6000FB6C03B45EC7F1A8B5"
		. "5E88B453001D089C28B453801D00FB6000FB6C03B45EC7E0B8"
		. "B55E88B453C01D0C600318345F8018B45F83B45940F8C60FFF"
		. "FFF8345F4018B45F43B45900F8C44FFFFFF8B45D40FAF45308"
		. "9C28B45D801D089458CC745F800000000E912030000C745F40"
		. "0000000E9F60200008B45F40FAF453089C28B45F801C28B458"
		. "C01D08945F0C745E800000000E9C40200008B45E883C0018D1"
		. "485000000008B454801D08B008945948B45E883C0028D14850"
		. "00000008B454801D08B008945908B55F88B459401D03B45D00"
		. "F8F800200008B55F48B459001D03B45CC0F8F6F0200008B45E"
		. "88D1485000000008B454801D08B008945888B45E883C0038D1"
		. "485000000008B454801D08B008945848B45E883C0048D14850"
		. "00000008B454801D08B008945808B45E883C0058D148500000"
		. "0008B454801D08B008945E48B45E883C0068D1485000000008"
		. "B454801D08B008945E08B45843945800F4D458089857CFFFFF"
		. "FC745EC00000000E9820000008B45EC3B45847D378B55888B4"
		. "5EC01D08D1485000000008B454001D08B108B45F001D089C28"
		. "B453C01D00FB6003C31740E836DE401837DE4000F889E01000"
		. "08B45EC3B45807D378B55888B45EC01D08D1485000000008B4"
		. "54401D08B108B45F001D089C28B453C01D00FB6003C30740E8"
		. "36DE001837DE0000F88620100008345EC018B45EC3B857CFFF"
		. "FFF0F8C6FFFFFFF837DC8000F858A0000008B55288B45F801C"
		. "28B454C89108B454C83C0048B4D2C8B55F401CA89108B454C8"
		. "D50088B459489028B454C8D500C8B45908902C745C80400000"
		. "0837D180175728B45F42B45908945D48B559089D001C001D08"
		. "945CC8B559089D0C1E00201D001C083C0648945D0837DD4007"
		. "907C745D4000000008B45342B45D43B45CC7D338B45342B45D"
		. "48945CCEB288B55DC8B451401D03B45F87F1B8B45C88D50018"
		. "955C88D1485000000008B454C01D0C700FFFFFFFF8B45C88D5"
		. "0018955C88D1485000000008B454C01D08B55E883C20789108"
		. "17DC8FD0300000F8FAA000000C745EC00000000EB298B55888"
		. "B45EC01D08D1485000000008B454001D08B108B45F001D089C"
		. "28B453C01D0C600308345EC018B45EC3B45847CCF8B45F883C"
		. "0010145D88B45948945DC8B45302B45D83B45D00F8D0AFDFFF"
		. "F8B45302B45D88945D0E9FCFCFFFF90EB0490EB01908345E80"
		. "78B45E83B451C0F8C30FDFFFF8345F4018B45F43B45CC0F8CF"
		. "EFCFFFF8345F8018B45F83B45D00F8CE2FCFFFF837DC800750"
		. "8B800000000EB0690B80100000083EC805B5DC24800"
		x64:="554889E54883C480894D108955184489452044894D288B4"
		. "5580FAF45488B5550C1E20201D08945F48B5560B8000000002"
		. "9D0C1E00289C28B454801D08945F0C745EC00000000C745DC0"
		. "0000000C745D8000000008B45608945D48B45688945D0C745C"
		. "C00000000837D10000F855D0100008B4518C1E81025FF00000"
		. "08945C88B4518C1E80825FF0000008945C48B451825FF00000"
		. "08945C08B4520C1E81025FF0000008945BC8B4520C1E80825F"
		. "F0000008945B88B452025FF0000008945B48B45C82B45BC894"
		. "5B08B45C42B45B88945AC8B45C02B45B48945A88B55C88B45B"
		. "C01D08945A48B55C48B45B801D08945A08B55C08B45B401D08"
		. "9459CC745F800000000E9B6000000C745FC00000000E994000"
		. "0008B45F483C0024863D0488B45404801D00FB6000FB6C0894"
		. "5C88B45F483C0014863D0488B45404801D00FB6000FB6C0894"
		. "5C48B45F44863D0488B45404801D00FB6000FB6C08945C08B4"
		. "5C83B45B07C388B45C83B45A47F308B45C43B45AC7C288B45C"
		. "43B45A07F208B45C03B45A87C188B45C03B459C7F108B45EC4"
		. "863D0488B45784801D0C600318345FC018345F4048345EC018"
		. "B45FC3B45600F8C60FFFFFF8345F8018B45F00145F48B45F83"
		. "B45680F8C3EFFFFFFE959020000837D10010F85B60000008B4"
		. "51883C001C1E007894518C745F800000000E98D000000C745F"
		. "C00000000EB728B45F483C0024863D0488B45404801D00FB60"
		. "00FB6C06BD0268B45F483C0014863C8488B45404801C80FB60"
		. "00FB6C06BC04B8D0C028B45F44863D0488B45404801D00FB60"
		. "00FB6D089D0C1E00429D001C83B451873108B45EC4863D0488"
		. "B45784801D0C600318345FC018345F4048345EC018B45FC3B4"
		. "5607C868345F8018B45F00145F48B45F83B45680F8C67FFFFF"
		. "FE999010000C745F800000000E98D000000C745FC00000000E"
		. "B728B45EC4863D0488B4570488D0C028B45F483C0024863D04"
		. "88B45404801D00FB6000FB6C06BD0268B45F483C0014C63C04"
		. "88B45404C01C00FB6000FB6C06BC04B448D04028B45F44863D"
		. "0488B45404801D00FB6000FB6D089D0C1E00429D04401C0C1F"
		. "80788018345FC018345F4048345EC018B45FC3B45607C86834"
		. "5F8018B45F00145F48B45F83B45680F8C67FFFFFF8B456083E"
		. "8018945988B456883E801894594C745F801000000E9CA00000"
		. "0C745FC01000000E9AE0000008B45F80FAF456089C28B45FC0"
		. "1D08945EC8B45EC4863D0488B45704801D00FB6000FB6D08B4"
		. "51801D08945F08B45EC4898488D50FF488B45704801D00FB60"
		. "00FB6C03B45F07F538B45EC4898488D5001488B45704801D00"
		. "FB6000FB6C03B45F07F388B45EC2B45604863D0488B4570480"
		. "1D00FB6000FB6C03B45F07F1D8B55EC8B456001D04863D0488"
		. "B45704801D00FB6000FB6C03B45F07E108B45EC4863D0488B4"
		. "5784801D0C600318345FC018B45FC3B45980F8C46FFFFFF834"
		. "5F8018B45F83B45940F8C2AFFFFFF8B45D80FAF456089C28B4"
		. "5DC01D0894590C745FC00000000E98E030000C745F80000000"
		. "0E9720300008B45F80FAF456089C28B45FC01C28B459001D08"
		. "945F4C745EC00000000E9400300008B45EC48984883C001488"
		. "D148500000000488B85900000004801D08B008945988B45EC4"
		. "8984883C002488D148500000000488B85900000004801D08B0"
		. "08945948B55FC8B459801D03B45D40F8FEA0200008B55F88B4"
		. "59401D03B45D00F8FD90200008B45EC4898488D14850000000"
		. "0488B85900000004801D08B0089458C8B45EC48984883C0034"
		. "88D148500000000488B85900000004801D08B008945888B45E"
		. "C48984883C004488D148500000000488B85900000004801D08"
		. "B008945848B45EC48984883C005488D148500000000488B859"
		. "00000004801D08B008945E88B45EC48984883C006488D14850"
		. "0000000488B85900000004801D08B008945E48B45883945840"
		. "F4D4584894580C745F000000000E9980000008B45F03B45887"
		. "D428B558C8B45F001D04898488D148500000000488B8580000"
		. "0004801D08B108B45F401D04863D0488B45784801D00FB6003"
		. "C31740E836DE801837DE8000F88D40100008B45F03B45847D4"
		. "28B558C8B45F001D04898488D148500000000488B858800000"
		. "04801D08B108B45F401D04863D0488B45784801D00FB6003C3"
		. "0740E836DE401837DE4000F888D0100008345F0018B45F03B4"
		. "5800F8C5CFFFFFF837DCC000F859D0000008B55508B45FC01C"
		. "2488B85980000008910488B85980000004883C0048B4D588B5"
		. "5F801CA8910488B8598000000488D50088B45988902488B859"
		. "8000000488D500C8B45948902C745CC04000000837D3001757"
		. "A8B45F82B45948945D88B559489D001C001D08945D08B55948"
		. "9D0C1E00201D001C083C0648945D4837DD8007907C745D8000"
		. "000008B45682B45D83B45D07D3B8B45682B45D88945D0EB308"
		. "B55E08B452801D03B45FC7F238B45CC8D50018955CC4898488"
		. "D148500000000488B85980000004801D0C700FFFFFFFF8B45C"
		. "C8D50018955CC4898488D148500000000488B8598000000480"
		. "1D08B55EC83C2078910817DCCFD0300000F8FB5000000C745F"
		. "000000000EB348B558C8B45F001D04898488D1485000000004"
		. "88B85800000004801D08B108B45F401D04863D0488B4578480"
		. "1D0C600308345F0018B45F03B45887CC48B45FC83C0010145D"
		. "C8B45988945E08B45602B45DC3B45D40F8D8EFCFFFF8B45602"
		. "B45DC8945D4E980FCFFFF90EB0490EB01908345EC078B45EC3"
		. "B45380F8CB4FCFFFF8345F8018B45F83B45D00F8C82FCFFFF8"
		. "345FC018B45FC3B45D40F8C66FCFFFF837DCC007508B800000"
		. "000EB0690B8010000004883EC805DC3909090909090909090"
		MCode(MyFunc, A_PtrSize=8 ? x64:x32)
	}
	ocrtxt:=[], info:=[], t1:=[], t0:=[], p:=0
	loop, Parse, wenzi, |
	{
		v:=A_LoopField, txt:="", e1:=cha1, e0:=cha0
		if RegExMatch(v,"<([^>]*)>",r)
			v:=StrReplace(v,r), txt:=Trim(r1)
		if RegExMatch(v,"\[([^\]]*)]",r)
		{
			v:=StrReplace(v,r), r2:=""
			StringSplit, r, r1, `,
			e1:=r1, e0:=r2
		}
		StringSplit, r, v, .
		w:=r1, v:=base64tobit(r2), h:=StrLen(v)//w
		if (r0<2 or h<1 or w>sw or h>sh or StrLen(v)!=w*h)
			continue
		len1:=len0:=0, j:=sw-w+1, i:=-j
		ListLines, Off
		loop, Parse, v
		{
			i:=Mod(A_Index,w)=1 ? i+j : i+1
			if A_LoopField
				t1[4*(p+len1++)]:=i
			else
				t0[4*(p+len0++)]:=i
		}
		ListLines, On
		e1:=Round(len1*e1), e0:=Round(len0*e0)
		info.Push(p,w,h,len1,len0,e1,e0)
		ocrtxt.Push(txt), p+=StrLen(v)
	}
	IfEqual, p, 0, return, 0
	mode:=InStr(c,"**") ? 2 : InStr(c,"*") ? 1 : 0
	c:=StrReplace(c,"*"), interval:=5, limit:=1
	if mode=0
	{
		c:=StrReplace(c,"0x") . "-0"
		StringSplit, r, c, -
		c:=Round("0x" r1), dc:=Round("0x" r2)
	}
	num:=info.MaxIndex()
		, VarSetCapacity(gs, sw*sh)
		, VarSetCapacity(ss, sw*sh, Asc("0"))
		, VarSetCapacity(s1, p*4, 0)
		, VarSetCapacity(s0, p*4, 0)
		, VarSetCapacity(in, num*4)
		, VarSetCapacity(out, 1024*4, 0)
	ListLines, Off
	loop, % num
		NumPut(info[A_Index], in, (A_Index-1)*4, "int")
	For k,v in t1
		NumPut(v, s1, k, "int")
	For k,v in t0
		NumPut(v, s0, k, "int")
	ListLines, On
	if DllCall(&MyFunc, "int",mode
		, "uint",c, "uint",dc
		, "int",interval, "int",limit, "int",num
		, "ptr",Scan0, "int",Stride
		, "int",sx, "int",sy, "int",sw, "int",sh
		, "ptr",&gs, "ptr",&ss
		, "ptr",&s1, "ptr",&s0, "ptr",&in, "ptr",&out)
	{
		x:=NumGet(out,0,"int"), y:=NumGet(out,4,"int")
		w:=NumGet(out,8,"int"), h:=NumGet(out,12,"int")
		rx:=x+w//2, ry:=y+h//2, ocr:="", i:=12
		while (k:=NumGet(out,i+=4,"int"))
			v:=ocrtxt[k//7], ocr.=v="" ? "*" : v
		return, 1
	}
	return, 0
}
MCode(ByRef code, hex)
{
	ListLines, Off
	bch:=A_BatchLines
	SetBatchLines, -1
	VarSetCapacity(code, StrLen(hex)//2)
	loop, % StrLen(hex)//2
		NumPut("0x" . SubStr(hex,2*A_Index-1,2), code, A_Index-1, "char")
	Ptr:=A_PtrSize ? "UPtr" : "UInt"
	DllCall("VirtualProtect", Ptr,&code, Ptr
		,VarSetCapacity(code), "uint",0x40, Ptr . "*",0)
	SetBatchLines, %bch%
	ListLines, On
}
base64tobit(s)
{
	ListLines, Off
	Chars:="0123456789+/ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	. "abcdefghijklmnopqrstuvwxyz"
	SetFormat, IntegerFast, d
	StringCaseSense, On
	loop, Parse, Chars
	{
		i:=A_Index-1, v:=(i>>5&1) . (i>>4&1)
		. (i>>3&1) . (i>>2&1) . (i>>1&1) . (i&1)
		s:=StrReplace(s,A_LoopField,v)
	}
	StringCaseSense, Off
	s:=SubStr(s,1,InStr(s,"1",0,0)-1)
	s:=RegExReplace(s,"[^01]+")
	ListLines, On
	return, s
}
bit2base64(s)
{
	ListLines, Off
	s:=RegExReplace(s,"[^01]+")
	s.=SubStr("100000",1,6-Mod(StrLen(s),6))
	s:=RegExReplace(s,".{6}","|$0")
	Chars:="0123456789+/ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	. "abcdefghijklmnopqrstuvwxyz"
	SetFormat, IntegerFast, d
	loop, Parse, Chars
	{
		i:=A_Index-1, v:="|" . (i>>5&1) . (i>>4&1)
		. (i>>3&1) . (i>>2&1) . (i>>1&1) . (i&1)
		s:=StrReplace(s,v,A_LoopField)
	}
	ListLines, On
	return, s
}

; 下方为帮助说明内容
helptext:
加好友 =
(
加好友:
1. 需要确保查找窗口存在并且没有遮挡
2. 需要确保已整理规范的txt文档处于打开状态
3. 中途若需要进行其他操作需要按下F7即可暂停
4. F3键可以强制结束一切线程重新加载程序（不要长按F3，单击一次即可）
5. 注意关闭自动接收器等其他类型的自动化工具，否则容易产生冲突
6. 关机选项工作状态不要轻易勾选（真的会关机的）

QQ号码整理:
1. 只支持txt文本格式
2. 一次只能选择一个文件不支持批量操作
3. 推荐拖拽方式进行快速处理
4. 文件选择模式适用于多层路径下的文件
5. QQ号码出现收尾相连时程序无法识别并分离
)
发广告 =
(
1. 注意关闭自动接收器等其他类型的自动化工具，否则容易产生冲突
2. 中途若需要进行其他操作需要按下F7即可暂停
3. F3键可以强制结束一切线程重新加载程序（不要长按F3，单击一次即可）
4. 关机选项工作状态不要轻易勾选（真的会关机的）

营销QQ:
1. 开始前需要确保营销QQ窗口存在并且无遮挡
2. 待发送列表一定要从后向前数最后一页未失效的开始
3. 窗口如果被强行置顶未重置的情况可以通过辅助增强功能恢复。

普通和企业QQ:
1. 开始前需要确保企业或普通QQ存在且只存在1个主窗口
2. 从展开好友列表开始发送信息
3. 次数以当前展开列表好友数为准，不建议一次设置过高
)
优化修复 =
(
冗沉垃圾清理:
1. 可以清理系统及软件产生的临时缓存和无用日志
2. 建议关闭所有正在工作状态的软件后清理效果更好

网络dns缓存清理:
1. 清除dns服务器缓存数据，可解决部分网络故障
2. 计算机网络配置发生更改后建议执行一次

解除拖动打开限制:
1. 极少情况下出现文件拖动到软件中打开不了的情况可以尝试使用此功能修复

系统检测及修复:
1. 验证系统的完备性，并一定程度上尝试进行修复
)
辅助增强 =
(
窗口置顶或取消:
1. 出现某些窗口被置顶导致桌面遮挡可以使用此功能让窗口强制取消置顶
2. 可以强行置顶当前活动窗口（即使当前软件默认不支持）

去除快捷方式箭头&恢复快捷方式小箭头:
1. 对快捷方式图标右下角的小箭头不喜欢可以使用(去除快捷方式箭头)进行消除
2. 如果需要让捷方式图标右下角的小箭头恢复需要使用(恢复快捷方式小箭头)即可恢复

系统详细信息:
1. 查看关于本计算机的详细信息
)
Return
