local PANEL = {}

DEFINE_BASECLASS("DFrame")

AccessorFunc(PANEL, "m_allowKeyClose", "AllowKeyClose", FORCE_BOOL)
AccessorFunc(PANEL, "m_closeKey", "CloseKey", FORCE_NUMBER)

function PANEL:Init()
	BaseClass.Init(self)

	// Disable all the default buttons and labels
	for _,child in pairs(self:GetChildren()) do
		child:SetVisible(false)
	end

	self:SetCloseKey(KEY_E)
	self:SetAllowKeyClose(true)

	self:MakeCloseButton()
end

function PANEL:PerformLayout()
	BaseClass.PerformLayout(self)
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
	draw.RoundedBoxEx(6, 0, 0, w, 24, FPUI.config.baseDark, true, true, false, false)
	draw.RoundedBoxEx(6, 0, 24, w, h - 24, FPUI.config.baseMedium, false, false, true, true)

	draw.SimpleText(self:GetTitle(self), "Poppins24", 5, 2.5, Color(255, 255, 255));
end

function PANEL:OnKeyCodePressed(key)
	if (self:GetAllowKeyClose() and key == self:GetCloseKey()) then
		self:Close()
	end
end

vgui.Register("FPFrame", PANEL, "DFrame")