local PANEL = {}

function PANEL:SetImage(path)
    self.material = Material(path)
end

function PANEL:Paint(w, h)
    if (self.material) then
        local x, y = self:LocalToScreen(0, 0)

        render.PushFilterMag(TEXFILTER.ANISOTROPIC)
        render.PushFilterMin(TEXFILTER.ANISOTROPIC)
            render.SetMaterial(self.material)
            render.DrawScreenQuadEx(x, y, w, h)
            -- surface.SetDrawColor(255, 255, 255)
            -- surface.SetMaterial(self.material)
            -- surface.DrawTexturedRect(0, 0, w, h)
        render.PopFilterMag()
        render.PopFilterMin()
    end
end

vgui.Register("FPImage", PANEL, "DPanel")