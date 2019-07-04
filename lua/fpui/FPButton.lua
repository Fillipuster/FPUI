-- Color(114, 137, 218)
-- Color(91, 69, 69)
local PANEL = {}

DEFINE_BASECLASS("DButton")

AccessorFunc(PANEL, "m_paintColor", "Color")
AccessorFunc(PANEL, "m_disabledColor", "DisabledColor")

function PANEL:Init()
	BaseClass.Init(self)

	self:SetFont("Open-Sans24")
	self:SetText("Button")
	self:SetTextColor(Color(255, 255, 255))
end

function PANEL:SetDisabled(disable)
	BaseClass.SetDisabled(self, disable)

	self:SetTextColor(disable and Color(200, 200, 200) or Color(255, 255, 255))
end

function PANEL:Paint(width, height)
	local color = self:GetColor() or Color(114, 137, 218)

	local highlightColor = Color(color.r + 25, color.g + 25, color.b + 25)
	local downColor = Color(color.r - 25, color.g - 25, color.b - 25)
	
	if (self.Hovered) then color = highlightColor end
	if (self:IsDown()) then color = downColor end
	if (self:GetDisabled()) then color = self:GetDisabledColor() or Color(91, 69, 69) end

	if (not self:GetDisabled()) then
		local _, _, brightness = ColorToHSV(color)
		if (brightness > 0.9) then
			self:SetTextColor(FPUI.config.baseDark)
		else
			self:SetTextColor(Color(255, 255, 255))
		end
	end

	draw.RoundedBox(8, 0, 0, width, height, color)
end

vgui.Register("FPButton", PANEL, "DButton")
