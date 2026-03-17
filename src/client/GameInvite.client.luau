--!nonstrict

--[[
	Shows how to use the SocialService to send game invites to friends.
	An icon will appear on the topbar to send game invites when clicked.

	https://create.roblox.com/docs/production/promotion/invite-prompts
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SocialService = game:GetService("SocialService")
local Players = game:GetService("Players")

local Icon = require(ReplicatedStorage.Packages.topbarplus)
local player = Players.LocalPlayer :: Player

local iconImage: string = script:GetAttribute("IconImage") :: string or "person-arrow-from-bottom-right"
local iconCaption: string = script:GetAttribute("IconCaption") :: string or "Invite Friends"

-- Function to check whether the player can send an invite
local function canSendGameInvite(sendingPlayer: Player): boolean
	local success: boolean, canSend: boolean = pcall(function(): boolean
		return SocialService:CanSendGameInviteAsync(sendingPlayer)
	end)
	return success and canSend
end

-- Check if the player can send a game invite
local canInvite: boolean = canSendGameInvite(player)
if canInvite then
	local inviteOptions: ExperienceInviteOptions = Instance.new("ExperienceInviteOptions")

	-- Create the topbar icon
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

	-- Prompt the game invite when the icon is selected
	icon.selected:Connect(function(): ()
		SocialService:PromptGameInvite(player, inviteOptions)
		icon:lock()
	end)

	-- Deselect the icon when the game invite prompt is closed
	SocialService.GameInvitePromptClosed:Connect(function(): ()
		icon:deselect()
		icon:unlock()
	end)
else
	-- Disable the script if the player cannot send a game invite
	script.Enabled = false

	return
end
