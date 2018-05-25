FPUI.fonts = FPUI.fonts or {};

function FPUI.Font(fontSize, bold)
	local size = math.floor(fontSize);

	local b = ""
	if (bold) then
		b = "b";
	end

	local name = "fpui" .. tostring(size) .. b;
	
	if (FPUI.fonts[name]) then return FPUI.fonts[name]; end
	
	surface.CreateFont(name, {
		font = "Roboto",
		size = size,
		weight = (!bold) and 400 or 600,
		antialias = true
	})

	FPUI.fonts[name] = name;

	return name;
end

function FPUI.Button(parent, text, textSize, x, y, doClick, bold)
	local btn = vgui.Create("FPButton", parent);
	btn:SetLabel(text);
	btn:SetPos(x, y);
	btn:SetFont(textSize, bold);
	btn.DoClick = doClick;

	surface.SetFont(FPUI.Font(textSize, bold));
	local w, h = surface.GetTextSize(text);
	btn:SetSize(w + textSize, h + textSize);

	return btn;
end

concommand.Add("fpui_test", function()
	local frame = vgui.Create("FPFrame");
	frame:SetRubrik("Test Panel");
	frame:Resize(500, 500);
	frame:Center();
	frame:MakePopup();

	FPUI.Button(frame, "Button Close Test", 12, 50, 50, function()
		frame:Remove();
	end)

	FPUI.Button(frame, "Test Test", 24, 50, 100, function() end, false);
	FPUI.Button(frame, "Bold Test", 24, 170, 100, function() end, true);
	FPUI.Button(frame, "a", 24, 50, 200);
	FPUI.Button(frame, "Another test...", 48, 50, 300);

end)