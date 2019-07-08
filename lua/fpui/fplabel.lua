local PANEL = {}

function PANEL:Init()
    self:SetFont("Roboto18")
    self:SetColor(Color(255, 255, 255))
    self:SetWrap(true)
end

vgui.Register("FPLabel", PANEL, "DLabel")