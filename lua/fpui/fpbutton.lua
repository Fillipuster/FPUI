local PANEL = {}

AccessorFunc(PANEL, "m_disabledColor", "DisabledColor")

function PANEL:Init()
	self:SetFont("Open-Sans24")
	self:SetText("Button")
	self:SetTextColor(Color(255, 255, 255))

	self:SetColor(FPUI.config.primary)
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

function PANEL:SetEnabled(enable)
	baseclass.Get("DButton").SetEnabled(self, enable)

	self:SetTextColor(enable and Color(255, 255, 255) or Color(200, 200, 200))
	self.paintColor = enable and self:GetColor() or self:GetDisabledColor()
end

function PANEL:Paint(width, height)
	draw.RoundedBox(8, 0, 0, width, height, self:IsDown() and self.downColor or self.paintColor)
end

function PANEL:OnCursorEntered()
	if (self:IsEnabled()) then
		self.paintColor = self.hoverColor
	end
end

function PANEL:OnCursorExited()
	if (self:IsEnabled()) then
		self.paintColor = self:GetColor()
	end
end

vgui.Register("FPButton", PANEL, "DButton")
