local PANEL = {}

DEFINE_BASECLASS("DScrollPanel")

function PANEL:Init()
	self:GetCanvas():DockPadding(0, 0, 5, 0)
	
	local vBar = self:GetVBar()
	vBar:SetHideButtons(true)

	vBar.Paint = function() end
	vBar.btnGrip.Paint = function(self, w, h)
		draw.RoundedBox(self:GetWide() / 2, 0, 0, w, h, Color(0, 0, 0, 150))
	end
end

vgui.Register("FPScrollPanel", PANEL, "DScrollPanel")
