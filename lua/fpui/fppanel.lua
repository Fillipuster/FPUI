local PANEL = {}

function PANEL:Init()
    self:SetBackgroundColor(FPUI.config.baseDark)
end

function PANEL:HoverPanel()
    local pnl = vgui.Create("FPPanel", self)
    pnl:SetSize(self:GetWide(), self:GetTall())
    pnl:SetBackgroundColor(self:GetBackgroundColor())
    pnl:SetVisible(false)

    self.hoverPanel = pnl

    return pnl
end

function PANEL:PerformLayout(w, h)
    // Save our screen bounds so we can check later
    self.b_x0, self.b_y0 = self:LocalToScreen(0, 0)
    self.b_xm, self.b_ym = self:LocalToScreen(self:GetWide() - 1, self:GetTall() - 1)
end

function PANEL:IsHovered()
    // TODO: Replace with implementation using Panel:CursorPos()
    if (self.hoverPanel && self.b_x0) then
        local x, y = input.GetCursorPos()

        return (x >= self.b_x0 && x <= self.b_xm) && (y >= self.b_y0 && y <= self.b_ym)
    end
end

function PANEL:Think()
    if (self.hoverPanel) then
        self.hoverPanel:SetVisible(self:IsHovered())
    end
end

vgui.Register("FPPanel", PANEL, "DPanel")