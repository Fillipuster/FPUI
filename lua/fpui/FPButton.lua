local PANEL = {};

function PANEL:Init()
	self:SetSize(100, 75);
	self:SetText("");

	self.label = "Button";
	self.font = FPUI.Font(5, false);
end

function PANEL:SetLabel(text)
	self.label = text;
end

function PANEL:SetFont(size, bold)
	self.font = FPUI.Font(size, bold);
end

function PANEL:Paint(w, h)
	local col = self.paintColor or Color(114, 137, 218);

	/*
	local hsvColH, hsvColS, hsvColB = ColorToHSV(col);
	local downColor = HSVToColor(hsvColH, hsvColS, hsvColB - 0.2);
	local highlightColor = HSVToColor(hsvColH, hsvColS, hsvColB + 0.2);
	*/

	local downColor = Color(col.r - 20, col.g - 20, col.b - 20);
	local highlightColor = Color(col.r + 20, col.g + 20, col.b + 20);
	
	if (self.hover) then col = highlightColor; end
	if (self:IsDown()) then col = downColor; end
	if (self:GetDisabled()) then col = Color(91, 69, 69); end

	draw.RoundedBox(8, 0, 0, w, h, col);
	draw.SimpleText(self.label, self.font, w / 2, h / 2, Color(255, 255, 255), 1, 1);
end

function PANEL:OnCursorEntered()
	self.hover = true;
end

function PANEL:OnCursorExited()
	self.hover = false;
end

vgui.Register("FPButton", PANEL, "DButton");
