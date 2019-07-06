function FPUI.StringMargin(str, margin)
	// TODO
end

concommand.Add("fpui_test", function()
	local frame = vgui.Create("FPFrame")
	frame:SetTitle("Test Window")
	frame:SetSize(700, 600)
	frame:Center()
	frame:MakePopup()

	local btn = vgui.Create("FPButton", frame)
	btn:Dock(TOP)
	btn:SetDisabled(true)

	local scrlPnl = vgui.Create("FPScrollPanel", frame)
	scrlPnl:Dock(FILL)

	-- local scrlBtn = vgui.Create("FPButton", scrlPnl)
	-- scrlBtn:SetSize(100, 100)

	for i=1,25,1 do
		local scrlBtn = vgui.Create("FPButton", scrlPnl)
		scrlBtn:SetText(tostring(i))
		scrlBtn:SetTall(50)
		scrlBtn:Dock(TOP)
	end

	timer.Simple(1.5, function()
		if (btn.SetDisabled) then
			btn:SetDisabled(false)
		end
	end)
end)