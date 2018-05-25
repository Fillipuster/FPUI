if (SERVER) then
	resource.AddFile("resource/fonts/Roboto-Regular.ttf");
end

local ClientFiles = {
	"fpui_config.lua",
	"fpui/base.lua",
	"fpui/FPFrame.lua",
	"fpui/FPButton.lua",
}

for _,f in pairs(ClientFiles) do
	if (SERVER) then
		AddCSLuaFile(f);
	else
		include(f);
	end
end