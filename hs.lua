local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/equ1nnox/horse/0e64bfa22b81c2e6e39b46498f0909757fb3a648/hs.lua"))()

local Window = Rayfield:CreateWindow({
   Name = "horse life script",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Me hub",
   LoadingSubtitle = "by me",
   Theme = "Dark Blue", -- Check https://[Log in to view URL]

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "me hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Home", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "the script has start",
   Content = "Notification Content",
   Duration = 3,
   Image = 4483362458,
})

local Button = MainTab:CreateButton({
   Name = "Auto Farm",
   Callback = function()
   -- Variables
local player = game.Players.LocalPlayer
local tamingDistance = 20 -- Distance to detect and tame horses
local sellDelay = 5 -- Delay before selling a tamed horse
local tamedHorses = {} -- Table to store tamed horses

-- Function to tame a horse
local function tameHorse(horse)
    if horse and horse:FindFirstChild("Owner") and horse.Owner.Value == nil then
        -- Simulate taming (replace with actual taming logic)
        game.ReplicatedStorage.TameHorse:FireServer(horse)
        table.insert(tamedHorses, horse)
        print("Tamed horse:", horse.Name)
    end
end

-- Function to sell a horse
local function sellHorse(horse)
    if horse and horse:FindFirstChild("Owner") and horse.Owner.Value == player then
        -- Simulate selling (replace with actual selling logic)
        game.ReplicatedStorage.SellHorse:FireServer(horse)
        print("Sold horse:", horse.Name)
    end
end

-- Main loop to find and tame horses
while true do
    for _, horse in pairs(workspace.WildHorses:GetChildren()) do
        if (horse.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude <= tamingDistance then
            tameHorse(horse)
            wait(sellDelay)
            sellHorse(horse)
        end
    end
    wait(1) -- Adjust delay to avoid performance issues
            end
   end,
})
