local PANEL = {}

AccessorFunc(PANEL, "m_fraction", "Fraction", FORCE_NUMBER)
AccessorFunc(PANEL, "m_barColor", "BarColor")
AccessorFunc(PANEL, "m_textColor", "TextColor")
AccessorFunc(PANEL, "m_text", "Text", FORCE_STRING)
AccessorFunc(PANEL, "m_font", "Font", FORCE_STRING)
AccessorFunc(PANEL, "m_barTextCenter", "CenterBarText", FORCE_BOOL)

function PANEL:Init()
    self:SetFraction(0.5)
    self:SetBarColor(FPUI.config.primary)
    self:SetTextColor(Color(255, 255, 255))
    self:SetFont("Roboto24")
    self:SetCenterBarText(false)
end

function PANEL:Paint(w, h)
    local barWidth = (w - 6) * self:GetFraction()
    local barHeight = h - 6
    draw.RoundedBox(2, 0, 0, w, h, self:GetBackgroundColor())
    draw.RoundedBox(2, 3, 3, barWidth, barHeight, self:GetBarColor())

    local text = self:GetText()
    if (text && #text > 0) then
        if (self:GetCenterBarText()) then
            draw.SimpleText(text, self:GetFont(), w / 2, (barHeight / 2) + 3, self:GetTextColor(), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            surface.SetFont(self:GetFont())
            local x, y = surface.GetTextSize(text)
            
            if (x > barWidth - 10) then
                draw.SimpleText(text, self:GetFont(), barWidth + 10, (barHeight / 2) + 3, self:GetTextColor(), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText(text, self:GetFont(), barWidth - 5, (barHeight / 2) + 3, self:GetTextColor(), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
            end
        end
    end
end

vgui.Register("FPProgress", PANEL, "FPPanel")