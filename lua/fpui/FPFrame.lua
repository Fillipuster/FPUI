local PANEL = {}

AccessorFunc(PANEL, "m_allowKeyClose", "AllowKeyClose", FORCE_BOOL)
AccessorFunc(PANEL, "m_closeKey", "CloseKey", FORCE_NUMBER)

function PANEL:Init()
	baseclass.Get("DFrame").Init(self)

	// Disable all the default buttons and labels
	for _,child in pairs(self:GetChildren()) do
		child:SetVisible(false)
	end

	self:SetCloseKey(KEY_E)
	self:SetAllowKeyClose(true)

	self:MakeCloseButton()
end

function PANEL:PerformLayout()
	self.closeButton:SetPos(self:GetWide() - 20, 5)
end

function PANEL:MakeCloseButton()
	if (self.closeButton) then
		self.closeButton:Remove()
	end

	local cb = vgui.Create("DButton", self)
	cb:SetSize(15, 15)
	cb:SetPos(self:GetWide() - 20, 5)
	cb:SetText("")
	cb.Paint = function(w, h)
		draw.SimpleText("x", "Open-Sans30", 7.5, 3.5, cb.hover and Color(255, 255, 255) or Color(200, 200, 200), 1, 1)
	end
	cb.DoClick = function()
		self:Remove()
	end
	cb.OnCursorEntered = function()
		cb.hover = true
	end
	cb.OnCursorExited = function()
		cb.hover = false
	end

	self.closeButton = cb
end

function PANEL:Paint(w, h)
	draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 150))
	draw.RoundedBoxEx(6, 0, 0, w - 1, 24, FPUI.config.baseDark, true, true, false, false)
	draw.RoundedBoxEx(6, 0, 24, w - 1, h - 24 - 1, FPUI.config.baseMedium, false, false, true, true)

	draw.SimpleText(self:GetTitle(self), "Poppins24", 5, 2.5, Color(255, 255, 255));
end

function PANEL:OnKeyCodePressed(key)
	if (self:GetAllowKeyClose() and key == self:GetCloseKey()) then
		self:Close()
	end
end

vgui.Register("FPFrame", PANEL, "DFrame")
