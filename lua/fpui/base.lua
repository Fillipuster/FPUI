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
	-- btn:SetColor(Color(50, 255, 50))

	timer.Simple(1.5, function()
		btn:SetDisabled(false)
	end)
end)