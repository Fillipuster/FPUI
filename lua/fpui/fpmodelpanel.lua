local PANEL = {}

function PANEL:SetModel(mdl)
    baseclass.Get("DModelPanel").SetModel(self, mdl)

    local mn, mx = self.Entity:GetRenderBounds()
    local size = 0
    size = math.max(size, math.abs(mn.x) + math.abs(mx.x))
    size = math.max(size, math.abs(mn.y) + math.abs(mx.y))
    size = math.max(size, math.abs(mn.z) + math.abs(mx.z))

    self:SetFOV(40)
    self:SetCamPos(Vector(size, size, size))
    self:SetLookAt((mn + mx) * 0.2)
end

vgui.Register("FPModelPanel", PANEL, "DModelPanel")