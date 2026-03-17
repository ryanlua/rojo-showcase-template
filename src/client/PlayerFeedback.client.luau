--!nonstrict

--[[
	Creates a topbar icon to open a feedback submission dialog.

	https://create.roblox.com/docs/en-us/reference/engine/classes/SocialService#PromptFeedbackSubmissionAsync
]]

local SocialService = game:GetService("SocialService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Icon = require(ReplicatedStorage.Packages.topbarplus)

local iconImage: string = script:GetAttribute("IconImage") :: string or "speech-bubble-align-left"
local iconCaption: string = script:GetAttribute("IconCaption") :: string or "Feedback"

local icon = Icon.new()
icon:modifyTheme({ "IconLabelContainer", "TargetWidth", 0 })
icon:setLabel(iconImage)
icon:setTextSize(24)
icon:setTextFont(
	"rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Normal,
	"Selected"
)
icon:setTextFont(
	"rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json",
	Enum.FontWeight.Regular,
	Enum.FontStyle.Normal,
	"Deselected"
)
icon:setCaption(iconCaption)
icon:oneClick(true)

-- Prompt for feedback when the icon is selected
icon.selected:Connect(function(): ()
	SocialService:PromptFeedbackSubmissionAsync()
end)
