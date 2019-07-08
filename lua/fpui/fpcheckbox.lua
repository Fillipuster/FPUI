local PANEL = {}

function PANEL:Paint(w, h)
    local checked = self:GetChecked()

    draw.RoundedBox(4, 0, 0, h, h, FPUI.config.baseDark)

    if (self:GetChecked()) then
        surface.SetDrawColor(255, 255, 255, 200)
        surface.DrawLine(4, 4, h - 4, h - 4)
        surface.DrawLine(4, h - 4, h - 4, 4)
    end
end

vgui.Register("FPCheckBox", PANEL, "DCheckBox")