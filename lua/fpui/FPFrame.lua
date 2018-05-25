local PANEL = {};

function PANEL:Init()
	self:SetSize(300, 200);

	self.rubrik = self.rubrik or "";
	self.closeKey = KEY_E;
	self.allowKeyClose = true;

	self:MakeCloseButton();
end

function PANEL:SetRubrik(title)
	self.rubrik = tostring(title);
end

function PANEL:Resize(x, y)
	self:SetSize(x, y);
	self:MakeCloseButton();
end

function PANEL:MakeCloseButton()
	if (self.closeButton) then
		self.closeButton:Remove();
	end

	local cb = vgui.Create("DButton", self);
	cb:SetSize(15, 15);
	cb:SetPos(self:GetWide() - 17.5, 2.5);
	cb:SetText("");
	cb.Paint = function(w, h)
		draw.SimpleText("x", FPUI.Font(20, false), 7, 6, cb.hover and Color(255, 255, 255) or Color(200, 200, 200), 1, 1);
	end
	cb.DoClick = function()
		self:Remove();
	end
	cb.OnCursorEntered = function()
		cb.hover = true;
	end
	cb.OnCursorExited = function()
		cb.hover = false;
	end

	self.closeButton = cb;
end

function PANEL:Paint(w, h)
	draw.RoundedBoxEx(2, 0, 0, w, 20, FPUI.config.baseDark, true, true, false, false);
	draw.RoundedBoxEx(2, 0, 20, w, h - 20, FPUI.config.baseMedium, false, false, true, true);

	draw.SimpleText(self.rubrik, FPUI.Font(15), 5, 2.5, Color(255, 255, 255));
end

function PANEL:AllowKeyClose(allow)
	self.allowKeyClose = allow;
end

function PANEL:SetCloseKey(key)
	self.closeKey = key;
end

function PANEL:OnKeyCodePressed(key)
	if (self.allowKeyClose && key == self.closeKey) then
		self:Remove();
	end
end

vgui.Register("FPFrame", PANEL, "EditablePanel");
