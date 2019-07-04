-- Color(114, 137, 218)
-- Color(91, 69, 69)
local PANEL = {}

DEFINE_BASECLASS("DButton")

AccessorFunc(PANEL, "m_disabledColor", "DisabledColor")

function PANEL:Init()
	BaseClass.Init(self)

	self:SetFont("Open-Sans24")
	self:SetText("Button")
	self:SetTextColor(Color(255, 255, 255))

	self:SetColor(Color(114, 137, 218))
	self:SetDisabledColor(Color(91, 69, 69))
end

function PANEL:SetColor(color)
	self.color = color
	self.paintColor = color
	self.downColor = Color(color.r - 25, color.g - 25, color.b - 25)
	self.hoverColor = Color(color.r + 25, color.g + 25, color.b + 25)
end

function PANEL:GetColor()
	return self.color
end

function PANEL:SetDisabled(disable)
	BaseClass.SetDisabled(self, disable)

	self:SetTextColor(disable and Color(200, 200, 200) or Color(255, 255, 255))
	self.paintColor = disable and self:GetDisabledColor() or self:GetColor()
end

function PANEL:Paint(width, height)
	draw.RoundedBox(8, 0, 0, width, height, self:IsDown() and self.downColor or self.paintColor)
end

function PANEL:OnCursorEntered()
	BaseClass.OnCursorEntered(self)

	if (not self:GetDisabled()) then
		self.paintColor = self.hoverColor
	end
end

function PANEL:OnCursorExited()
	BaseClass.OnCursorExited(self)

	if (not self:GetDisabled()) then
		self.paintColor = self:GetColor()
	end
end



vgui.Register("FPButton", PANEL, "DButton")
