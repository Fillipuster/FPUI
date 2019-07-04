local files = {
	"fpui_config.lua",
	"fpui/base.lua"
	"fpui/FPFrame.lua",
}

for _,f in pairs(files) do
	if (SERVER) then
		AddCSLuaFile(f)
	else
		include(f)
	end
end