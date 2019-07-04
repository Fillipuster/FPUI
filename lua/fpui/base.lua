function FPUI.StringMargin(str, margin)
	// TODO
end

concommand.Add("fpui_test", function()
	local frame = vgui.Create("FPFrame")
	frame:SetTitle("Test Window")
	frame:SetSize(700, 600)
	frame:Center()
	frame:MakePopup()

	vgui.Create("DButton", frame):Dock(TOP)
end)