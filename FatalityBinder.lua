if not doesDirectoryExist("moonloader/config") then createDirectory("moonloader/config") end
require "lib.moonloader"

--����
local SE = require 'samp.events'
local imgui = require 'imgui'
local dlstatus = require('moonloader').download_status
local inicfg = require 'inicfg'
local keys = require "vkeys"
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
--

--������
local tags = "{ff2faa}[FATALITY TOOLS]: "
update_state = false
--

--������
local script_vers = 21
local script_vers_text = "0.7"
local last_vers = "0.6"
--
--Ainfo
local file = 'FatalityBinder.ini'
local mainIni = inicfg.load({
    Basic = {
        slot = 'None',
        slot2 = 'None',
        slot3 = 'None',
        slot4 = 'None',
        slot5 = 'None',
		kd = '0',
    },
},file)
if not doesFileExist(thisScript().directory..'/config/'..file..encoding.default) then
    inicfg.save(mainIni, file)
end
--
--������
local update_url = "https://raw.githubusercontent.com/RAZEwallker/binder/main/update.ini"
local update_path = getWorkingDirectory() .. "/config/update.ini"

local script_url = "https://github.com/RAZEwallker/binder/blob/main/FatalityBinder.luac?raw=true"
local script_path = thisScript().path
--

--���� ������
	okno = imgui.ImBool(false)
	main_command = imgui.ImBool(false)
	okno2 = imgui.ImBool(false)
	okno3 = imgui.ImBool(false)
	okno4 = imgui.ImBool(false)
	okno5 = imgui.ImBool(false)
	okno6 = imgui.ImBool(false)
	okno7 = imgui.ImBool(false)
	okno8 = imgui.ImBool(false)
	okno9 = imgui.ImBool(false)
	okno10 = imgui.ImBool(false)
	leader_main = imgui.ImBool(false)
	main_button = imgui.ImBool(false)
	main_obnova = imgui.ImBool(false)
	main_info = imgui.ImBool(false)
	main_reconect = imgui.ImBool(false)
	main_exit = imgui.ImBool(false)
	main_acars = imgui.ImBool(false)
	main_chat = imgui.ImBool(false)
	main_skin = imgui.ImBool(false)
	main_cars = imgui.ImBool(false)
	main_anfo = imgui.ImBool(false)
	main_anfo2 = imgui.ImBool(false)
	main_anti = imgui.ImBool(false)
	main_code = imgui.ImBool(false)
--

--����� �����
local yr = imgui.ImBuffer(250)
local nick = imgui.ImBuffer(3)
local cheat = imgui.ImBuffer(250)
local dm = imgui.ImBuffer(250)
local dom = imgui.ImBuffer(5)
local biz = imgui.ImBuffer(3)
local ful = imgui.ImBuffer(3)
local flood = imgui.ImBuffer(250)
local fosk = imgui.ImBuffer(250)
local group1 = imgui.ImBuffer(100)
local group2 = imgui.ImBuffer(100)
local group3 = imgui.ImBuffer(100)
local group4 = imgui.ImBuffer(100)
local group5 = imgui.ImBuffer(100)
local adress = imgui.ImBuffer(100)
local leaderoff = imgui.ImBuffer(100)
local leader = imgui.ImBuffer(100)
local nickoff = imgui.ImBuffer(100)
local leaderid = imgui.ImBuffer(100)
local tempnick = imgui.ImBuffer(100)
local recc = imgui.ImBuffer(100)
local nickname = imgui.ImBuffer(100)
local texit = imgui.ImBuffer(100)
local radius = imgui.ImBuffer(4)
local idskina = imgui.ImBuffer(5)
local mahina = imgui.ImBuffer(1000)
local ainfo1 = imgui.ImBuffer(1000)
local ainfo2 = imgui.ImBuffer(1000)
local ainfo3 = imgui.ImBuffer(1000)
local ainfo4 = imgui.ImBuffer(1000)
local ainfo5 = imgui.ImBuffer(1000)
local ainfo6 = imgui.ImBuffer(1000)
local ainfo7 = imgui.ImBuffer(1000)
local ainfo8 = imgui.ImBuffer(1000)
local ainfo9 = imgui.ImBuffer(1000)
local ainfo10 = imgui.ImBuffer(1000)
local kd = imgui.ImBuffer(5)
local password = imgui.ImBuffer(6)
local code = imgui.ImBuffer(6)
--

function main()
	while not isSampAvailable() do wait(0) end
	downloadUrlToFile(update_url, update_path, function(id, status)
			if status == dlstatus.STATUS_ENDDOWNLOADDATA then
					updateIni = inicfg.load(nil, update_path)
					if tonumber(updateIni.info.vers) > script_vers then
							sampAddChatMessage(tags.." {ffAAff}���� ����������! ������: " .. updateIni.info.vers_text, -1)
							update_state = true
					end
            os.remove(update_path)
        end
	end)
--194.67.195.138
	 print("�������� �������...")
    	if sampGetCurrentServerAddress() == "194.67.195.138" or sampGetCurrentServerAddress() == "164.132.201.89" then
    		srv = 1
		elseif sampGetCurrentServerAddress() == "" then
    		srv = 2
		else
			print("������ �� �������, ������ ������� ���������")
    		sampAddChatMessage(tags.."{FFFFFF} � ���������, ������ ������ ���������� ��� ������ �� ������ �������.", 0x046D63)
    		sampAddChatMessage(tags.."{FFFFFF} ��������� � �������������, ���� ������ �������� ����������� ������� ������ ��������.", 0x046D63)
    		thisScript():unload()
    		return
    	end
    	print("�������� ��������, �������� ����")
	sampAddChatMessage(tags..' {ffAAff}����� ���� ��� �������� ��� ��, �������� ��� {ffffff}/ftools ��� Alt+U', -1)
    wait(5000)
		sampRegisterChatCommand('ftools', ftools)
	while true do
		wait(0)
		if update_state then
				downloadUrlToFile(script_url, script_path, function(id, status)
						if status == dlstatus.STATUS_ENDDOWNLOADDATA then
								sampAddChatMessage(tags.." {ffAAff}������ ������� ��������!", -1)
								thisScript():reload()
						end
				end)
				break
		end
		if isKeyDown(VK_MENU) and isKeyJustPressed(VK_U) then
			okno.v = not okno.v
			imgui.Process = okno.v
		end
		if not sampIsChatInputActive() then
			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_I) then
				main_anti.v = not main_anti.v
				imgui.Process = main_anti.v
			end
		end
		
		if res and recc.v ~= nil then
			sampDisconnectWithReason(quit)
			wait(recc.v*1000)
			sampSetGamestate(1)
			res= false
		end

	end
end

function ftools()
	okno.v = not okno.v
	imgui.Process = okno.v
end

function imgui.OnDrawFrame(param)
	if not okno.v and not main_anti.v and not main_anfo2.v and not main_command.v  and not main_info.v and not okno6.v and not main_button.v and not main_obnova.v then
		imgui.Process = false
	end
	if okno.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 180), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"FATALITY TOOLS v0.7", okno, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoMove)
	if imgui.Button(u8"������� �������", imgui.ImVec2(300, 20)) then
		main_command.v = not main_command.v
		Process = main_command.v
	end
	if imgui.Button(u8"��������", imgui.ImVec2(300, 20)) then
		main_button.v = not main_button.v
		Process = main_button.v
	end
	if imgui.Button(u8"������� �������", imgui.ImVec2(300, 20)) then
		okno6.v = not okno6.v
		Process = okno6.v
	end
	if imgui.Button(u8"���������� �� ����������", imgui.ImVec2(300, 20)) then
		main_obnova.v = not main_obnova.v
		Process = main_obnova.v
	end
	if imgui.Button(u8"����������", imgui.ImVec2(300, 20)) then
		main_info.v = not main_info.v
		Process = main_info.v
	end
	imgui.Text(u8"������: "..updateIni.info.vers_text, imgui.ImVec2(300, 20))
	imgui.Text(u8"���������: 45-�", imgui.ImVec2(300, 20))
	imgui.End()
	end
	if main_anti.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 100), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"������������", main_anti, imgui.WindowFlags.NoCollapse)
		imgui.Text(u8"����� ���������� �� ������,")
		imgui.Text(u8"����� ������ ������������?")
		if imgui.Button(u8"��",imgui.ImVec2(300, 20)) then
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
			imgui.Process = false; showCursor(false);
			sampSendChat("/antierror "..myid)
		end
		if imgui.Button(u8"���",imgui.ImVec2(300, 20)) then
		imgui.Process = false; showCursor(false);
		end
	imgui.End()
	end
	if main_anfo2.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 170), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"�������� ����������", main_anfo2, imgui.WindowFlags.NoCollapse)
		imgui.InputText("Text #1", ainfo1)
		imgui.InputText("Text #2", ainfo2)
		imgui.InputText("Text #3", ainfo3)
		imgui.InputText("Text #4", ainfo4)
		imgui.InputText("Text #5", ainfo5)
		imgui.InputText(u8"��", kd)
		if imgui.Button(u8"���������",imgui.ImVec2(300, 20)) then
			if #ainfo5.v == 0 then
				sampAddChatMessage(tags.."{FF0000}������, ��������� ���������� �� �����...", -1)
			else
				mainIni.Basic.slot = ainfo1.v
				mainIni.Basic.slot2 = ainfo2.v
				mainIni.Basic.slot3 = ainfo3.v
				mainIni.Basic.slot4 = ainfo4.v
				mainIni.Basic.slot5 = ainfo5.v
				mainIni.Basic.kd = kd.v
				inicfg.save(mainIni, file)
				sampAddChatMessage(tags.."���������� �������!", -1)
			end
		end
		if imgui.Button(u8"<-- ������� �������",imgui.ImVec2(300, 20)) then
			main_anfo.v = not main_anfo.v
			Process = main_anfo.v
		end
	imgui.End()
	end
	
	if main_command.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(550, 330), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"������ �������", main_command, imgui.WindowFlags.NoCollapse )
		if imgui.CollapsingHeader(u8"1. ������ ��� �� ��") then
				imgui.InputText(u8"�� ������ ������� �������", nick)
				imgui.InputText(u8"����� ������ ����", flood)
			if imgui.Button(u8"������ � ����� ���") then
					sampSendChat('/amute '..nick.v..' '..yr.v..' ��')
					sampSendChat('/ans '..nick.v..' ������������ �� - ���. �� ������� �������, ������! : )')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"����� ��� �� �������� ������(/a)") then
				sampSendChat("/amute "..nick.v..' 1 1')
			end
			if imgui.Button(u8"������ ��� � ������� ���") then
				sampSendChat('/mute '..nick.v..' '..yr.v..' ��')
				sampSendChat('/ans '..nick.v..' ������������ �� - ���. �� ������� �������, ������! : )')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"����� ��� �� �������� ������(������� ���)") then
				sampSendChat("/unmute "..nick.v)
			end
		end
		if imgui.CollapsingHeader(u8"2. ������ ��� �� ����") then
			imgui.InputText(u8"�� ������ ������� �������", nick)
			imgui.InputText(u8"����� ������ ���", cheat)
			if imgui.Button(u8"������ ��� �� ���������") then
					sampSendChat('/ban '..nick.v..' '..cheat.v..' ���� �������')
			end
		end
		if imgui.CollapsingHeader(u8"3. ������ ����� �� ��/���� �� ��") then
			imgui.InputText(u8"�� ������ ������� �������", nick)
			imgui.InputText(u8"����� ������ �����", dm)
			if imgui.Button(u8"������ ����� �� ��") then
					sampSendChat('/jail '..nick.v..' '..dm.v..' dm')
					sampSendChat('/ans '..nick.v..' ������������ �� - ���, �� ������� ������� (/rules)')
			end
			if imgui.Button(u8"������ ����� �� ���� �� ��") then
					sampSendChat('/dkick '..nick.v)
					sampSendChat('/jail '..nick.v..' '..dm.v..' ���� �� ��')
					sampSendChat('/ans '..nick.v..' ������������ ���� �� �� - ���, �� ������� ������� (/rules)')
			end
			if imgui.Button(u8"����� ����� �� �������� ������") then
				sampSendChat("/unjail "..nick.v)
			end
		end
		if imgui.CollapsingHeader(u8"4. ������� �������� � �������, ����, ��������") then
			imgui.InputText(u8"����� ����", dom)
			imgui.InputText(u8"����� �������", biz)
			imgui.InputText(u8"����� ��������", ful)
			if imgui.Button(u8"�������� � ����") then
				sampSendChat('/house '..dom.v)
			end
			if imgui.Button(u8"�������� � �������") then
				sampSendChat('/biz '..biz.v)
				sampSendChat('/biz '..biz.v)
			end
			if imgui.Button(u8"�������� � ��������") then
				sampSendChat('/fuel '..ful.v)
			end
		end
		if imgui.CollapsingHeader(u8"5. ������ ���� �� ����") then
			imgui.InputText(u8"�� ������ ������� �������", nick)
			imgui.InputText(u8"����� ������ ����", flood)
			if imgui.Button(u8"������ � ����� ���") then
				sampSendChat("/amute "..nick.v..' '..flood.v..' ����(/a)')
				sampSendChat('/ans '..nick.v..' ������������ ���� - ���, �� ������� ������� (/rules)')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"����� ��� �� �������� ������(/a)") then
				sampSendChat("/amute "..nick.v..' 1 1')
			end
			if imgui.Button(u8"������ � ������� ���") then
				sampSendChat("/mute "..nick.v..' '..flood.v..' ����')
				sampSendChat('/ans '..nick.v..' ������������ ���� - ���, �� ������� ������� (/rules)')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"����� ��� �� �������� ������(������� ���)") then
				sampSendChat("/unmute "..nick.v)
			end
			if imgui.Button(u8"������ �� ���� ���") then
				sampSendChat("/mute "..nick.v..' '..flood.v..' ����(/sms)')
				sampSendChat('/ans '..nick.v..' ������������ ���� - ���, �� ������� ������� (/rules)')
			end
		end
		if imgui.CollapsingHeader(u8"6. ������ ���� �� �����������") then
			imgui.InputText(u8"�� ������ ������� �������", nick)
			imgui.InputText(u8"����� ������ ����", fosk)
			if imgui.Button(u8"������ � ����� ���") then
				sampSendChat("/amute "..nick.v..' '..fosk.v..' �����������(/a)')
				sampSendChat('/ans '..nick.v..' ������������ ����������� - ���, �� ������� ������� (/rules)')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"����� ��� �� �������� ������(/a)") then
				sampSendChat("/amute "..nick.v..' 1 1')
			end
			if imgui.Button(u8"������ � ������� ���") then
				sampSendChat("/mute "..nick.v..' '..fosk.v..' �����������')
				sampSendChat('/ans '..nick.v..' ������������ ����������� - ���, �� ������� ������� (/rules)')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"����� ��� �� �������� ������(������� ���)") then
				sampSendChat("/unmute "..nick.v)
			end
		end
		if imgui.CollapsingHeader(u8"7. ���������� ip ���������") then
			imgui.InputText(u8"id ������", nick)
			if imgui.Button(u8"������ ip ������") then
				sampSendChat("/getip "..nick.v)
			end
			imgui.InputText(u8"ip ������ ������", adress)
			if imgui.Button(u8"�������� ip ������") then
				sampSendChat("/banip "..adress.v)
			end
			if imgui.Button(u8"��������� �������� ip") then
				sampSendChat("/lip "..adress.v)
			end
			if imgui.Button(u8"��������� ip ������") then
				sampSendChat("/unbanip "..adress.v)
			end
		end
		if imgui.CollapsingHeader(u8"8. ������ ���������� ���������") then
			if imgui.Button(u8"������ id �������") then
				sampSendChat("/fid")
			end
			lua_thread.create(function()
			imgui.InputText(u8"id ������", nick)
			imgui.InputText(u8"id �������", leaderid)
			imgui.InputText(u8"��� ������� ������", nickoff)
			if imgui.Button(u8"��������� ������ ��/����� �������") then
				sampSendChat("/uninviteoff "..nickoff.v)
				wait(1000)
				sampSendChat("/setleader "..nick.v.." "..leaderid.v.." 1")
			end
			end)
			imgui.InputText(u8"id ����.������", tempnick)
			if imgui.Button(u8"����� ����.������ �� ���������") then
				sampSendChat("/auninvite "..tempnick.v.." 1")
			end
		end
		if imgui.CollapsingHeader(u8"9. ��������") then
			imgui.InputText("Time reconnect", recc)
			if imgui.Button(u8"���������") then
				imgui.Process = false; showCursor(false);
				res = true
			end
			if imgui.Button(u8"������� ��������", imgui.SameLine()) then
					imgui.Process = false; showCursor(false);
					sampDisconnectWithReason(quit)
					sampSetGamestate(1)
			end
		end
		if imgui.CollapsingHeader(u8"10. ���������") then
			imgui.InputText(u8"Time exit", texit)
			imgui.InputText(u8"You nickname", nickname)
			if imgui.Button(u8"���������") then
			imgui.Process = false; showCursor(false);
			lua_thread.create(function()
				sampSendChat("/msg "..tags.." ������ "..nickname.v.." ����� "..texit.v.." �����(�) �������� �� ����, �������� ��� ����")
				wait(texit.v*60000)
				sampSendChat("/group")
				sampSendChat("/gg")
				wait(3000)
				sampProcessChatInput('/q')
			end)
			end
		end
		if imgui.CollapsingHeader(u8"11. ���������� �������� �������") then
			imgui.InputText(u8"������(�� 10 �� 200)", radius)
			if imgui.Button(u8"���������� ������� �����") then
				lua_thread.create(function()
				sampSendChat("/msg �����, ����� 3 ������� ����� ���������� ������� �����")
				wait(3000)
				sampSendChat("/spawncars")
				wait(2000)
				sampSendChat("/msg ������� �������, ������� ��� ����!")
				end)
			end
			if imgui.Button(u8"������� ����� � �������", imgui.SameLine()) then
				sampSendChat("/respv "..radius.v)
			end
		end
		if imgui.CollapsingHeader(u8"12. ���������� �����") then
			if imgui.Button(u8"�������� ��������� ���", imgui.ImVec2(300, 20)) then
				local memory = require "memory"
				memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
				memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
				memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
				sampAddChatMessage(tags.." {FF22AA}�� ������� �������� ���� ��������� ���")
			end
			if imgui.Button(u8"�������� ���������� ���", imgui.ImVec2(300, 20)) then
				lua_thread.create(function()
				sampSendChat("/msg �����, ����� 5 ������ ����� �������� ������� ����")
				wait(5000)
				sampSendChat("/cc")
				wait(2000)
				sampSendChat("/msg ������� ���� ������ �������, �������� ��� ����!")
				end)
			end
		end
		if imgui.CollapsingHeader(u8"13. ���������� �������") then
			imgui.InputText("##1", idskina)
			imgui.Text(u8"ID skina(�� 1 �� 311)", imgui.SameLine())
			if imgui.Button(u8"������� ����") then
				sampSendChat("/skin "..idskina.v)
			end
			imgui.InputText("##2", nick)
			imgui.Text(u8"�� ������", imgui.SameLine())
			if imgui.Button(u8"������ ���� ������") then
				sampSendChat("/setskin "..nick.v.." "..idskina.v)
			end
		end
		if imgui.CollapsingHeader(u8"14. ���������� �����������") then
			imgui.InputText("ID`S Cars", mahina)
			if imgui.Button(u8"������ ������ ������") then
				sampSendChat("/adelveh")
				sampSendChat("/veh "..mahina.v.." 1 1")
			end
		end
		if imgui.CollapsingHeader(u8"15. ��������� ����������") then
			imgui.Text(u8"�����������:")
			imgui.Text(" "..mainIni.Basic.slot)
			imgui.Text(" "..mainIni.Basic.slot2)
			imgui.Text(" "..mainIni.Basic.slot3)
			imgui.Text(" "..mainIni.Basic.slot4)
			imgui.Text(" "..mainIni.Basic.slot5)
			imgui.Text(u8"����� ��������: "..mainIni.Basic.kd..u8" ������")
			if imgui.Button(u8"���������",imgui.ImVec2(300, 20)) then
			lua_thread.create(function()
				sampSendChat("/a "..mainIni.Basic.slot)
				wait(mainIni.Basic.kd*1000)
				sampSendChat("/a "..mainIni.Basic.slot2)
				wait(mainIni.Basic.kd*1000)
				sampSendChat("/a "..mainIni.Basic.slot3)
				wait(mainIni.Basic.kd*1000)
				sampSendChat("/a "..mainIni.Basic.slot4)
				wait(mainIni.Basic.kd*1000)
				sampSendChat("/a "..mainIni.Basic.slot5)
			end)
			end
			if imgui.Button(u8"����� -->",imgui.ImVec2(300, 20)) then
				main_anfo2.v = not main_anfo2.v
				Process = main_anfo2.v
			end
		end
	imgui.End()
	end
	
	if main_button.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 1.4, sh / 1.8), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 130), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"�������� �������", main_button, imgui.WindowFlags.NoCollapse )
		if imgui.Button(u8"������� �������", imgui.ImVec2(300, 20)) then
			sampSendChat("/sp")
		end
		if imgui.Button(u8"������ ���-500", imgui.ImVec2(300, 20)) then
			sampSendChat("/adelveh")
			sampSendChat("/veh 522 1 1 ")
		end
		if imgui.Button(u8"������ �������", imgui.ImVec2(300, 20)) then
			sampSendChat("/adelveh")
			sampSendChat("/veh 560 1 1 ")
		end
		if imgui.Button("Killed games", imgui.ImVec2(300, 20)) then
			 sampProcessChatInput('/q')
		end
		if imgui.Button("Head Move", imgui.ImVec2(300, 20)) then
			 sampProcessChatInput('/headmove')
		end
	imgui.End()
	end
	
	if main_obnova.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 1.3, sh / 1.7), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(500, 200), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"�� ����������", main_obnova, imgui.WindowFlags.NoCollapse  + imgui.WindowFlags.NoScrollbar)
		imgui.BeginChild(u8"�� ����������", imgui.ImVec2(500, 200), false)
		imgui.Text(u8"�� ����������: "..updateIni.info.vers_text)
		imgui.Text(u8"���������� ����������!")
		imgui.Text(u8"����� ������ ������������ ����� �� ������� ALT + I")
		imgui.EndChild()
	imgui.End()
	end
	
	if main_info.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 1.4, sh / 1.5), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 100), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"����������", main_info, imgui.WindowFlags.NoCollapse )
			if imgui.Button(u8"���������", imgui.ImVec2(300, 20)) then
			os.execute("start https://vk.com/id662467029")
			end
			imgui.Text(u8"Discord: 45-�#9665", imgui.ImVec2(300, 20))
	imgui.End()
	end

--		if okno9.v then
--		local sw, sh = getScreenResolution()
--		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
--		imgui.SetNextWindowSize(imgui.ImVec2(400, 300), imgui.Cond.FirstUseEver)
--	imgui.Begin(u8"[~~������ �����(������������� ���������)~~]", okno9, imgui.WindowFlags.NoCollapse)
--	imgui.Text(u8'����� �����:')
--	imgui.Text(group1.v)
--	imgui.Text(group2.v)
--	imgui.Text(group3.v)
--	imgui.Text(group4.v)
--	imgui.InputText(u8"1-� �����", group1)
--	imgui.InputText(u8"2-� �����", group2)
--	imgui.InputText(u8"3-� �����", group3)
--	imgui.InputText(u8"4-� �����", group4)
--	imgui.InputText("##1", group5)
--	imgui.Text(u8"�� ����",imgui.SameLine())
--	imgui.Text(u8'��������� ����� �� '..group5.v)
--	if imgui.Button(u8"��������� ���� ����������") then
--		sampSendChat(u8"/msg "..group1.v)
--		sampSendChat(u8"/msg "..group2.v)
--		sampSendChat(u8"/msg "..group3.v)
--		sampSendChat(u8"/msg "..group4.v)
--		sampSendChat(u8"/msg �������� ��� ����, ��������� �� "..group5.v)
--	end
--	imgui.End()
--	end

	if okno6.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(1000, 200), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"[~~������� ������� FATALITY NON RP~~]", okno6, imgui.WindowFlags.NoCollapse)
		if imgui.CollapsingHeader(u8"1. ��������") then
			imgui.Text(u8"1.1 - ��������� ������������ ������������� CLEO ��� ����, ��������� ����� �������� �� 7 ����")
			imgui.Text(	u8"1.2 - �������� ���������� DeathMatch (DM) - ���������� ��������, ��������� ������� �� 15 �����")
			imgui.Text(u8"1.3 - ��������� ������� ������� �� ������ (�� �����, ��� ��� ����������), ��������� ������� �� 20 �����")
			imgui.Text(u8"1.4 - ��������� �������� ������� ��� �������� �� ���� ��� �������, ��������� ������� �� 15 �����")
			imgui.Text(u8"1.5 - ��������� ������������� ����������� ������� ��� �������� ���������, ��������� ����� �������� �� 7 ����")
			imgui.Text(u8"1.7 - ��������� ���������� ������� ������� (���� ������� ������� 14+ ������), ��������� ����� �������� �� 14 ����")
			imgui.Text(u8"1.8 - �������� ����� ������� � ����� ������ ������, ��������� ����� �������� �� 7 ���� ��� ����� ���� �� 120 �����*")
		end
		if imgui.CollapsingHeader(u8"2. ������� �������") then
			imgui.Text(u8"2.1 - �������� ������ ��� � ����������� ������ �������, ��������� ����� ���� �� 30 �����")
			imgui.Text(u8"2.2 - ��������� �����������/���������� ������ �������, ��������� ����� ���� �� 300 �����")
			imgui.Text(u8"2.3 - ��������� ������ ������ ������� (�� ����������� � �������� ��������), ��������� ����� ���� �� 60 �����")
			imgui.Text(u8"2.4 - ��������� ����� ������� ��������� ��������, ��������� ����� ���� �� 90 ����� ��� ����� �������� �� 7 ����")
			imgui.Text(u8"2.5 - ��������� ������� (��������� ���������� ��������� ������ 5 ���), ��������� ����� ���� �� 15 �����")
			imgui.Text(u8"2.6 - ��������� ����������� ������� ��� �������� ��������������, ��������� ����� ���� �� 120 �����")
		end
		if imgui.CollapsingHeader(u8"3. �������������") then
			imgui.Text(u8"- ���������� �������� ������������� ������� � ����� ������� ��������� ������ ������")
			imgui.Text(u8"- ������������� �� �������� �������� �������� ������� ��� ������� ����������� ������")
			imgui.Text(u8"- ������� ����� ����������� ����� ����� ��������� ��� ����� ����� (��������, ����� ������������ ������)")
			imgui.Text(u8"- ���� �������� ������� ���� ��������� � ��� ��������, ��������� � vk.com/andreylolkek")
		end
		if imgui.CollapsingHeader(u8"4. ��� ������� �������������") then
			imgui.Text(u8"4.1 - ���� ����� ��� �������� � ������ ����� (�����, ����� � ��), ���������� ��� �������������")
			imgui.Text(u8"4.2 - ���� ����� ��� �������� � ������� ����� (� ���. ���������), ���������� ���������� �� �. 2.6")
			imgui.Text(u8"4.3 - ���� ����� ��� �������� � ������� ����� (� ����. ������), ���������� ���������� �� �. 2.2")
			imgui.Text(u8"4.4 - ���� ����� ��� �������� � ����� ����� � ���������� ������������� ��, ���������� ���������� �� �. 1.1")
			imgui.Text(u8"4.5 - ���� ����� ������� �� ��� ��� / ������� / ��� ���� / ������ � ���� �� ���������/������ ���� �����, � ����� ����� �������� ��������, ��")
			imgui.Text(u8"�� � ����� �������� �������� (�� ��� � x2 ������), �� ��� �������, ��� ������ ��������� ���� ������ �� �. 1.1, 1.2, 1.5, 1.7, 1.8, 2.2, 2.4, 2.6 (�����)")
		end
		if imgui.CollapsingHeader(u8"5. ������ ����������") then
			imgui.Text(u8"5.1 - ������� ������������� ������� �������, ��������� ������ � ������� �������������� (����� �. 2.2) �� ������������")
			imgui.Text(u8"5.2 - ������� ������������� ������ ������� �� ������� �������� �������� ��� ������ �������, � �� ��� ����")
			imgui.Text(u8"5.3 - ������� ������������� ������ ����� �������������� �� �������� ������� (�. 1.1, 1.5, 1.7, 1.8, 2.2, 4.1, 4.2, 4.3, 4.4, 4.5)")
			imgui.Text(u8"5.4 - ������� ������������� �� ������ ���������� ������� ������ �� 1 ��������� (�. 1.2, 1.3, 1.4, 1.5, 1.6, 1.8), ���������� ���������� �� �����������")
		end
		if imgui.CollapsingHeader(u8"6. ������� ���������") then
			imgui.Text(u8"6.1 - ���� ������� ������������� �������� �������� / ���������� �������, �� �� ������� ������� ��� ��� ���� �� 300 �����*")
			imgui.Text(u8"6.2 - ������� ������������� �� ������ ������������� � ��������, ��������� ��������� ������������ ���������")
			imgui.Text(u8"6.3 - ������� ������������� - ������������ ������������, ��������� ����� ���� ����������� (� ������ ��������� �������)")
			imgui.Text(u8"6.4 - ���� ������� ������������� ��������� ���������� � ������ ������� ���������������, �� ���� ����������� �������� ��� ���� �� 300 �����")
			imgui.Text(u8"6.5 - ���� ������� ������������� ������� ��������� �� �������� ��������������, �� ��������� ����� ��������� �� �. 1.6")
		end
		if imgui.CollapsingHeader(u8"7. ����������") then
			imgui.TextColored(imgui.ImVec4(1.0, 0.0, 0.0, 1.0 ), u8'* ��� ��������� ����� ���� �������� �� ������� ������� ��������� (������, �������, �������-��������������, �������)')
			imgui.TextColored(imgui.ImVec4(1.0, 0.0, 0.0, 1.0 ), u8'* � ���� �� �� ��� ��� ��� ������ ��� ������������� �������� �� ����� �������, �� �������� ��� ������� � ���������')
		end
		imgui.End()
	end
end

function CherryTheme()
  imgui.SwitchContext()
  local style = imgui.GetStyle()
  local colors = style.Colors
  local clr = imgui.Col
  local ImVec4 = imgui.ImVec4
  local ImVec2 = imgui.ImVec2


  style.WindowPadding = ImVec2(6, 4)
  style.WindowRounding = 0.0
  style.FramePadding = ImVec2(5, 2)
  style.FrameRounding = 3.0
  style.ItemSpacing = ImVec2(7, 1)
  style.ItemInnerSpacing = ImVec2(1, 1)
  style.TouchExtraPadding = ImVec2(0, 0)
  style.IndentSpacing = 6.0
  style.ScrollbarSize = 12.0
  style.ScrollbarRounding = 16.0
  style.GrabMinSize = 20.0
  style.GrabRounding = 2.0
  style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)

  style.WindowTitleAlign = ImVec2(0.5, 0.5)

  colors[clr.Text] = ImVec4(0.860, 0.930, 0.890, 0.78)
  colors[clr.TextDisabled] = ImVec4(0.860, 0.930, 0.890, 0.28)
  colors[clr.WindowBg] = ImVec4(0.13, 0.14, 0.17, 1.00)
  colors[clr.ChildWindowBg] = ImVec4(0.200, 0.220, 0.270, 0.58)
  colors[clr.PopupBg] = ImVec4(0.200, 0.220, 0.270, 0.9)
  colors[clr.Border] = ImVec4(0.31, 0.31, 1.00, 0.00)
  colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.FrameBg] = ImVec4(0.200, 0.220, 0.270, 1.00)
  colors[clr.FrameBgHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
  colors[clr.FrameBgActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.TitleBg] = ImVec4(0.232, 0.201, 0.271, 1.00)
  colors[clr.TitleBgActive] = ImVec4(0.502, 0.075, 0.256, 1.00)
  colors[clr.TitleBgCollapsed] = ImVec4(0.200, 0.220, 0.270, 0.75)
  colors[clr.MenuBarBg] = ImVec4(0.200, 0.220, 0.270, 0.47)
  colors[clr.ScrollbarBg] = ImVec4(0.200, 0.220, 0.270, 1.00)
  colors[clr.ScrollbarGrab] = ImVec4(0.09, 0.15, 0.1, 1.00)
  colors[clr.ScrollbarGrabHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
  colors[clr.ScrollbarGrabActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.CheckMark] = ImVec4(0.71, 0.22, 0.27, 1.00)
  colors[clr.SliderGrab] = ImVec4(0.47, 0.77, 0.83, 0.14)
  colors[clr.SliderGrabActive] = ImVec4(0.71, 0.22, 0.27, 1.00)
  colors[clr.Button] = ImVec4(0.47, 0.77, 0.83, 0.14)
  colors[clr.ButtonHovered] = ImVec4(0.455, 0.198, 0.301, 0.86)
  colors[clr.ButtonActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.Header] = ImVec4(0.455, 0.198, 0.301, 0.76)
  colors[clr.HeaderHovered] = ImVec4(0.455, 0.198, 0.301, 0.86)
  colors[clr.HeaderActive] = ImVec4(0.502, 0.075, 0.256, 1.00)
  colors[clr.ResizeGrip] = ImVec4(0.47, 0.77, 0.83, 0.04)
  colors[clr.ResizeGripHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
  colors[clr.ResizeGripActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.PlotLines] = ImVec4(0.860, 0.930, 0.890, 0.63)
  colors[clr.PlotLinesHovered] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.PlotHistogram] = ImVec4(0.860, 0.930, 0.890, 0.63)
  colors[clr.PlotHistogramHovered] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.TextSelectedBg] = ImVec4(0.455, 0.198, 0.301, 0.43)
  colors[clr.ModalWindowDarkening] = ImVec4(0.200, 0.220, 0.270, 0.73)
end
CherryTheme()