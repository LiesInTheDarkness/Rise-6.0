-- // Services
local CoreGui = game:GetService('CoreGui')
local TweenService = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')
local TextService = game:GetService('TextService')
local Players = game:GetService('Players')
local HttpService = game:GetService('HttpService')

-- // Variables
getgenv().kms = false
local Ihatethisui = {}
local UIName = 'Visual UI Library | .gg/puxxCphTnK'
local Amount = 0
local ConfigF
local BreakAllLoops = false
local ChangeTheme = false
local NotificationTransparency = 0
local Utility = {}
local Library = {}
local Config = {}
local ConfigUpdates = {}
local Themes = {
    ['Default'] = {
        BackgroundColor = Color3.fromRGB(25, 25, 25),
        SidebarColor = Color3.fromRGB(30, 30, 30),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(60, 60, 60),
        PrimaryElementColor = Color3.fromRGB(30, 30, 30),
        SecondaryElementColor = Color3.fromRGB(50, 50, 50),
        OtherElementColor = Color3.fromRGB(25, 25, 25),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(40, 40, 40),
        NotificationColor = Color3.fromRGB(25, 25, 25),
        NotificationUIStrokeColor = Color3.fromRGB(125, 125, 125)
    },
    ['Lighter'] = {
        BackgroundColor = Color3.fromRGB(40, 40, 40),
        SidebarColor = Color3.fromRGB(45, 45, 45),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(80, 80, 80),
        PrimaryElementColor = Color3.fromRGB(45, 45, 45),
        SecondaryElementColor = Color3.fromRGB(65, 65, 65),
        OtherElementColor = Color3.fromRGB(40, 40, 40),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(60, 60, 60),
        NotificationColor = Color3.fromRGB(40, 40, 40),
        NotificationUIStrokeColor = Color3.fromRGB(125, 125, 125)
    },
    ['Light'] = {
        BackgroundColor = Color3.fromRGB(255, 255, 255),
        SidebarColor = Color3.fromRGB(200, 200, 200),
        PrimaryTextColor = Color3.fromRGB(0, 0, 0),
        SecondaryTextColor = Color3.fromRGB(75, 75, 75),
        UIStrokeColor = Color3.fromRGB(0, 0, 0),
        PrimaryElementColor = Color3.fromRGB(200, 200, 200),
        SecondaryElementColor = Color3.fromRGB(150, 150, 150),
        OtherElementColor = Color3.fromRGB(255, 255, 255),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(200, 200, 200),
        NotificationColor = Color3.fromRGB(255, 255, 255),
        NotificationUIStrokeColor = Color3.fromRGB(0, 0, 0)
    },
    ['Light+'] = {
        BackgroundColor = Color3.fromRGB(255, 255, 255),
        SidebarColor = Color3.fromRGB(255, 255, 255),
        PrimaryTextColor = Color3.fromRGB(0, 0, 0),
        SecondaryTextColor = Color3.fromRGB(75, 75, 75),
        UIStrokeColor = Color3.fromRGB(0, 0, 0),
        PrimaryElementColor = Color3.fromRGB(255, 255, 255),
        SecondaryElementColor = Color3.fromRGB(200, 200, 200),
        OtherElementColor = Color3.fromRGB(255, 255, 255),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(255, 255, 255),
        NotificationColor = Color3.fromRGB(255, 255, 255),
        NotificationUIStrokeColor = Color3.fromRGB(0, 0, 0)
    },
    ['Discord'] = {
        BackgroundColor = Color3.fromRGB(54, 57, 63),
        SidebarColor = Color3.fromRGB(44, 49, 54),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(110, 110, 115),
        UIStrokeColor = Color3.fromRGB(75, 75, 75),
        PrimaryElementColor = Color3.fromRGB(48, 52, 57),
        SecondaryElementColor = Color3.fromRGB(59, 65, 72),
        OtherElementColor = Color3.fromRGB(54, 57, 63),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(74, 77, 83),
        NotificationColor = Color3.fromRGB(54, 57, 63),
        NotificationUIStrokeColor = Color3.fromRGB(75, 75, 75)
    },
    ['Red And Black'] = {
        BackgroundColor = Color3.fromRGB(0, 0, 0),
        SidebarColor = Color3.fromRGB(0, 0, 0),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(255, 0, 0),
        PrimaryElementColor = Color3.fromRGB(34, 31, 31),
        SecondaryElementColor = Color3.fromRGB(50, 50, 50),
        OtherElementColor = Color3.fromRGB(25, 25, 25),
        ScrollBarColor = Color3.fromRGB(255, 0, 0),
        PromptColor = Color3.fromRGB(40, 40, 40),
        NotificationColor = Color3.fromRGB(255, 0, 0),
        NotificationUIStrokeColor = Color3.fromRGB(255, 0, 0)
    },
    ['Nordic Dark'] = {
        BackgroundColor = Color3.fromRGB(25, 30, 35),
        SidebarColor = Color3.fromRGB(20, 25, 30),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(50, 60, 70),
        PrimaryElementColor = Color3.fromRGB(30, 35, 40),
        SecondaryElementColor = Color3.fromRGB(50, 55, 60),
        OtherElementColor = Color3.fromRGB(25, 30, 35),
        ScrollBarColor = Color3.fromRGB(100, 105, 110),
        PromptColor = Color3.fromRGB(45, 50, 55),
        NotificationColor = Color3.fromRGB(25, 30, 35),
        NotificationUIStrokeColor = Color3.fromRGB(50, 60, 70)
    },
    ['Nordic Light'] = {
        BackgroundColor = Color3.fromRGB(67, 75, 94),
        SidebarColor = Color3.fromRGB(62, 67, 86),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(92, 97, 116),
        PrimaryElementColor = Color3.fromRGB(62, 67, 86),
        SecondaryElementColor = Color3.fromRGB(82, 87, 106),
        OtherElementColor = Color3.fromRGB(67, 75, 94),
        ScrollBarColor = Color3.fromRGB(100, 105, 110),
        PromptColor = Color3.fromRGB(62, 67, 86),
        NotificationColor = Color3.fromRGB(67, 75, 94),
        NotificationUIStrokeColor = Color3.fromRGB(67, 75, 94)
    },
    ['Purple'] = {
        BackgroundColor = Color3.fromRGB(30, 30, 45),
        SidebarColor = Color3.fromRGB(40, 40, 60),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(60, 60, 80),
        PrimaryElementColor = Color3.fromRGB(40, 40, 60),
        SecondaryElementColor = Color3.fromRGB(60, 60, 80),
        OtherElementColor = Color3.fromRGB(30, 30, 45),
        ScrollBarColor = Color3.fromRGB(100, 105, 110),
        PromptColor = Color3.fromRGB(50, 50, 65),
        NotificationColor = Color3.fromRGB(30, 30, 45),
        NotificationUIStrokeColor = Color3.fromRGB(60, 60, 80)
    },
    ['Sentinel'] = {
        BackgroundColor = Color3.fromRGB(30, 30, 30),
        SidebarColor = Color3.fromRGB(25, 25, 25),
        PrimaryTextColor = Color3.fromRGB(130, 190, 130),
        SecondaryTextColor = Color3.fromRGB(230, 35, 70),
        UIStrokeColor = Color3.fromRGB(50, 50, 50),
        PrimaryElementColor = Color3.fromRGB(25, 25, 25),
        SecondaryElementColor = Color3.fromRGB(35, 35, 35),
        OtherElementColor = Color3.fromRGB(30, 30, 30),
        ScrollBarColor = Color3.fromRGB(70, 70, 70),
        PromptColor = Color3.fromRGB(50, 50, 50),
        NotificationColor = Color3.fromRGB(30, 30, 30),
        NotificationUIStrokeColor = Color3.fromRGB(50, 50, 50)
    },
    ['Synapse X'] = {
        BackgroundColor = Color3.fromRGB(50, 50, 50),
        SidebarColor = Color3.fromRGB(50, 50, 50),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(125, 125, 125),
        UIStrokeColor = Color3.fromRGB(70, 70, 70),
        PrimaryElementColor = Color3.fromRGB(60, 60, 60),
        SecondaryElementColor = Color3.fromRGB(80, 80, 80),
        OtherElementColor = Color3.fromRGB(50, 50, 50),
        ScrollBarColor = Color3.fromRGB(70, 70, 70),
        PromptColor = Color3.fromRGB(70, 70, 70),
        NotificationColor = Color3.fromRGB(50, 50, 50),
        NotificationUIStrokeColor = Color3.fromRGB(70, 70, 70)
    },
    ['Krnl'] = {
        BackgroundColor = Color3.fromRGB(40, 40, 40),
        SidebarColor = Color3.fromRGB(30, 30, 30),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(125, 125, 125),
        UIStrokeColor = Color3.fromRGB(60, 60, 60),
        PrimaryElementColor = Color3.fromRGB(30, 30, 30),
        SecondaryElementColor = Color3.fromRGB(40, 40, 40),
        OtherElementColor = Color3.fromRGB(40, 40, 40),
        ScrollBarColor = Color3.fromRGB(60, 60, 60),
        PromptColor = Color3.fromRGB(60, 60, 60),
        NotificationColor = Color3.fromRGB(40, 40, 40),
        NotificationUIStrokeColor = Color3.fromRGB(60, 60, 60)
    },
    ['Script-Ware'] = {
        BackgroundColor = Color3.fromRGB(30, 30, 30),
        SidebarColor = Color3.fromRGB(35, 35, 35),
        PrimaryTextColor = Color3.fromRGB(0, 125, 255),
        SecondaryTextColor = Color3.fromRGB(255, 255, 255),
        UIStrokeColor = Color3.fromRGB(50, 50, 50),
        PrimaryElementColor = Color3.fromRGB(35, 35, 35),
        SecondaryElementColor = Color3.fromRGB(45, 45, 45),
        OtherElementColor = Color3.fromRGB(30, 30, 30),
        ScrollBarColor = Color3.fromRGB(50, 50, 50),
        PromptColor = Color3.fromRGB(50, 50, 50),
        NotificationColor = Color3.fromRGB(30, 30, 30),
        NotificationUIStrokeColor = Color3.fromRGB(50, 50, 50)
    },
    ['Kiriot'] = {
        BackgroundColor = Color3.fromRGB(35, 35, 35),
        SidebarColor = Color3.fromRGB(30, 30, 30),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(255, 170, 60),
        PrimaryElementColor = Color3.fromRGB(30, 30, 30),
        SecondaryElementColor = Color3.fromRGB(50, 50, 50),
        OtherElementColor = Color3.fromRGB(25, 25, 25),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(40, 40, 40),
        NotificationColor = Color3.fromRGB(25, 25, 25),
        NotificationUIStrokeColor = Color3.fromRGB(255, 170, 60)
    }
}

-- // Utility Functions
do
    function Utility:Tween(Instance, Properties, Duration, ...)
        local TweenInfo = TweenInfo.new(Duration, ...)
        TweenService:Create(Instance, TweenInfo, Properties):Play()
    end

    function Utility:DestroyUI()
        ChangeTheme = true
        BreakAllLoops = true
        writefile('fml.txt', 'true')
        for Index, Value in next, Ihatethisui do
            print(Index, Value)
            Ihatethisui[Index]:Break()
        end
        if CoreGui:FindFirstChild(UIName) ~= nil then
            CoreGui:FindFirstChild(UIName):Destroy()
        end
    end

    function Utility:Darken(Color)
        local H, S, V = Color:ToHSV()

        V = math.clamp(V - 0.03, 0, 1)

        return Color3.fromHSV(H, S, V)
    end

    function Utility:Lighten(Color)
        local H, S, V = Color:ToHSV()

        V = math.clamp(V + 0.03, 0, 1)

        return Color3.fromHSV(H, S, V)
    end

    function Utility:SplitColor(Color)
        local R, G, B = math.floor(Color.R * 255), math.floor(Color.G * 255), math.floor(Color.B * 255)
        return {R, G, B}
    end

    function Utility:JoinColor(Table)
        local R, G, B = Table[1], Table[2], Table[3]
        return Color3.fromRGB(R, G, B)
    end

    function Utility:ToggleUI()
        if CoreGui:FindFirstChild(UIName) ~= nil then
            CoreGui:FindFirstChild(UIName).Enabled = not CoreGui:FindFirstChild(UIName).Enabled
        end
    end

    local function EnableMobileDragging(Frame)
        local Dragging = false
        local DragStart = Vector2.new(0, 0)
        local StartPosition = UDim2.new(0, 0, 0, 0)

        Frame.InputBegan:Connect(function(Input, gameProcessedEvent)
            if not gameProcessedEvent and (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) then
                Dragging = true
                DragStart = Input.Position
                StartPosition = Frame.Position
            end
        end)

        Frame.InputChanged:Connect(function(Input)
            if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
                local Delta = Input.Position - DragStart
                Frame.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
            end
        end)

        Frame.InputEnded:Connect(function(Input, gameProcessedEvent)
            if Dragging and (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) then
                Dragging = false
            end
        end)
    end

    function Utility:Create(_Instance, Properties, Children)
        local Object = Instance.new(_Instance)
        local Properties = Properties or {}
        local Children = Children or {}
        
        for Index, Property in next, Properties do
            Object[Index] = Property
        end

        for _, Child in next, Children do
            Child.Parent = Object
        end

        return Object
    end

    function Library:CreateNotification(Title, Text, Duration)
        local Theme = {}
        local File = readfile('VisualUILibraryCurrentTheme.json')
        local Table = HttpService:JSONDecode(File)
        for Index, Value in next, Table do
            Theme[Index] = Utility:JoinColor(Value)
        end

        task.spawn(function()
            local Title = Title or 'Title'
            local Text = Text or 'Text'
            local Duration = Duration or 5

            if not CoreGui:FindFirstChild('Visual UI Library | .gg/puxxCphTnK | Notifications') then
                Utility:Create('ScreenGui', {
                    Name = 'Visual UI Library | .gg/puxxCphTnK | Notifications',
                    Parent = CoreGui
                })
            else
                Utility:Create('Frame', {
                    Parent = CoreGui:FindFirstChild('Visual UI Library | .gg/puxxCphTnK | Notifications'),
                    Name = 'Notification'..tostring(Amount + 1),
                    BackgroundColor3 = Theme.BackgroundColor,
                    BorderSizePixel = 0,
                    Position = UDim2.new(1, 300, 1, -30),
                    Size = UDim2.new(0, 300, 0, 50),
                    BackgroundTransparency = NotificationTransparency,
                    AnchorPoint = Vector2.new(1, 1)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = 'NotificationCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = 'NotificationStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.NotificationUIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = 'NotificationTitle',
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, -1),
                        Size = UDim2.new(0, 300, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = Title,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Utility:Create('UIPadding', {
                            Name = 'NotificationTitlePadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    }),
                    Utility:Create('TextLabel', {
                        Name = 'NotificationText',
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 25),
                        Size = UDim2.new(0, 300, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = Text,
                        TextWrapped = true,
                        TextColor3 = Theme.SecondaryTextColor,
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Utility:Create('UIPadding', {
                            Name = 'NotificationTextPadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    })
                })

                Amount = Amount + 1
                local Holder = CoreGui:FindFirstChild('Visual UI Library | .gg/puxxCphTnK | Notifications')['Notification'..tostring(Amount)]
                local TitleObj = Holder['NotificationTitle']
                local TextObj = Holder['NotificationText']
                local TextSize = TextService:GetTextSize(Text, 14, Enum.Font.Gotham, Vector2.new(300, math.huge))
                Holder.Size = UDim2.new(0, 300, 0, TextSize.Y + 30)
                TextObj.Size = UDim2.new(0, 300, 0, TextSize.Y)
                if Amount > 1 then
                    local PreviousSizes = 0
                    for _, Notification in next, Holder.Parent:GetChildren() do
                        if Notification ~= Holder.Parent['Notification'..tostring(Amount)] then
                            local AbsoluteY = Notification.AbsoluteSize.Y + 5
                            PreviousSizes = PreviousSizes + AbsoluteY
                        end
                    end
                    Holder.Position = UDim2.new(1, 300, 1, -30 - PreviousSizes)
                    Utility:Tween(Holder, {Position = UDim2.new(1, -30, 1, -30 - PreviousSizes)}, 0.5)
                else
                    Utility:Tween(Holder, {Position = UDim2.new(1, -30, 1, -30)}, 0.5)
                end
                task.wait(Duration - 1)
                Utility:Tween(Holder, {BackgroundTransparency = 0.8}, 0.25)
                Utility:Tween(TitleObj, {TextTransparency = 0.5}, 0.25)
                Utility:Tween(TextObj, {TextTransparency = 0.5}, 0.25)
                task.wait(0.5)
                Utility:Tween(Holder, {Position = UDim2.new(1, 300, 1, Holder.Position.Y.Offset)}, 0.5)
                task.wait(0.5)
                Holder:Destroy()
                Amount = Amount - 1
            end
        end)
    end

    function Library:CreatePrompt(Type, Title, Text, ...)
        local Title = Title or 'Title'
        local Text = Text or 'Text'

        for _, Item in next, CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder'):GetChildren() do
            if Item:IsA('Frame') then
                Item:Destroy()
            end
        end

        local Theme = {}
        local File = readfile('VisualUILibraryCurrentTheme.json')
        local Table = HttpService:JSONDecode(File)
        for Index, Value in next, Table do
            Theme[Index] = Utility:JoinColor(Value)
        end

        if Type == 'Text' then
            local ButtonText = ...
            Utility:Create('Frame', {
                Name = Title..'PromptFrame',
                Parent = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder'),
                BackgroundColor3 = Theme.PromptColor,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BorderSizePixel = 0,
                ZIndex = 101,
                BackgroundTransparency = NotificationTransparency,
                Size = UDim2.new(0, 0, 0, 0)
            }, {
                Utility:Create('UICorner', {
                    Name = Title..'PromptFrameCorner',
                    CornerRadius = UDim.new(0, 100)
                }),
                Utility:Create('UIStroke', {
                    Name = Title..'PromptFrameStroke',
                    ApplyStrokeMode = 'Contextual',
                    Color = Theme.UIStrokeColor,
                    LineJoinMode = 'Round',
                    Thickness = 1
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptTitle',
                    TextTransparency = 1,
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 5),
                    Size = UDim2.new(0, 0, 0, 20),
                    Font = Enum.Font.Gotham,
                    Text = Title,
                    TextColor3 = Theme.PrimaryTextColor,
                    TextSize = 20,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptText',
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 26),
                    Size = UDim2.new(0, 280, 0, 77),
                    Font = Enum.Font.Gotham,
                    Text = Text,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextSize = 15,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextButton', {
                    Name = Title..'Button',
                    BackgroundColor3 = Theme.SecondaryElementColor,
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    Text = ButtonText,
                    Font = Enum.Font.Gotham,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Position = UDim2.new(0, 10, 0, 110),
                    Size = UDim2.new(0, 280, 0, 30),
                    BorderSizePixel = 0,
                    TextSize = 15,
                    ZIndex = 103,
                    Visible = true,
                    AutoButtonColor = false
                }, {
                    Utility:Create('UIStroke', {
                        Name = Title..'ButtonStroke',
                        ApplyStrokeMode = 'Border',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 0
                    }),
                    Utility:Create('UICorner', {
                        Name = Title..'ButtonCorner',
                        CornerRadius = UDim.new(0, 5)
                    })
                })
            })

            local PromptHolder = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder')
            local PromptFrame = PromptHolder[Title..'PromptFrame']
            local PromptFrameCorner = PromptFrame[Title..'PromptFrameCorner']
            local Button = PromptFrame[Title..'Button']
            local ButtonStroke = Button[Title..'ButtonStroke']
            local PromptText = PromptFrame[Title..'PromptText']
            local PromptTitle = PromptFrame[Title..'PromptTitle']

            local TitleTextSize = TextService:GetTextSize(Title, 20, Enum.Font.Gotham, Vector2.new(280, 0))
            
            Utility:Tween(PromptTitle, {Size = UDim2.new(0, TitleTextSize.X, 0, TitleTextSize.Y)}, 0.25)

            Utility:Tween(PromptHolder, {BackgroundTransparency = 0.1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptFrame, {BackgroundTransparency = NotificationTransparency}, 0.25)
            Utility:Tween(PromptFrame, {Size = UDim2.new(0, 300, 0, 150)}, 0.25)
            Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 5)}, 0.25)
            task.wait(0.25)
            Utility:Tween(ButtonStroke, {Thickness = 1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptText, {TextTransparency = 0}, 0.25)
            Utility:Tween(PromptTitle, {TextTransparency = 0}, 0.25)
            Utility:Tween(Button, {BackgroundTransparency = 0}, 0.25)
            Utility:Tween(Button, {TextTransparency = 0}, 0.25)

            Button.MouseEnter:Connect(function(Input)
                Utility:Tween(Button, {TextColor3 = Utility:Lighten(Theme.PrimaryTextColor)}, 0.25)
            end)

            Button.MouseLeave:Connect(function(Input)
                Utility:Tween(Button, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
            end)
            
            Button.MouseButton1Down:Connect(function()
                Utility:Tween(Button, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptText, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptTitle, {TextTransparency = 1}, 0.25)
                task.wait(0.25)
                Utility:Tween(ButtonStroke, {Thickness = 0}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptFrame, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(PromptFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
                Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 100)}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptHolder, {BackgroundTransparency = 1}, 0.25)
                task.wait()
                PromptFrame:Destroy()
            end)

        elseif Type == 'OneButton' then
            local Args = ...
            local ButtonText = Args[1]
            local ButtonCallback = Args[2]
            Utility:Create('Frame', {
                Name = Title..'PromptFrame',
                Parent = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder'),
                BackgroundColor3 = Theme.PromptColor,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BorderSizePixel = 0,
                ZIndex = 101,
                BackgroundTransparency = NotificationTransparency,
                Size = UDim2.new(0, 0, 0, 0)
            }, {
                Utility:Create('UICorner', {
                    Name = Title..'PromptFrameCorner',
                    CornerRadius = UDim.new(0, 100)
                }),
                Utility:Create('UIStroke', {
                    Name = Title..'PromptFrameStroke',
                    ApplyStrokeMode = 'Contextual',
                    Color = Theme.UIStrokeColor,
                    LineJoinMode = 'Round',
                    Thickness = 1
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptTitle',
                    TextTransparency = 1,
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 5),
                    Size = UDim2.new(0, 0, 0, 20),
                    Font = Enum.Font.Gotham,
                    Text = Title,
                    TextColor3 = Theme.PrimaryTextColor,
                    TextSize = 20,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptText',
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 26),
                    Size = UDim2.new(0, 280, 0, 77),
                    Font = Enum.Font.Gotham,
                    Text = Text,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextSize = 15,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextButton', {
                    Name = Title..'Button',
                    BackgroundColor3 = Theme.SecondaryElementColor,
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    Text = ButtonText,
                    Font = Enum.Font.Gotham,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Position = UDim2.new(0, 10, 0, 110),
                    Size = UDim2.new(0, 280, 0, 30),
                    BorderSizePixel = 0,
                    TextSize = 15,
                    ZIndex = 103,
                    Visible = true,
                    AutoButtonColor = false
                }, {
                    Utility:Create('UIStroke', {
                        Name = Title..'ButtonStroke',
                        ApplyStrokeMode = 'Border',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 0
                    }),
                    Utility:Create('UICorner', {
                        Name = Title..'ButtonCorner',
                        CornerRadius = UDim.new(0, 5)
                    })
                })
            })

            local PromptHolder = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder')
            local PromptFrame = PromptHolder[Title..'PromptFrame']
            local PromptFrameCorner = PromptFrame[Title..'PromptFrameCorner']
            local Button = PromptFrame[Title..'Button']
            local ButtonStroke = Button[Title..'ButtonStroke']
            local PromptText = PromptFrame[Title..'PromptText']
            local PromptTitle = PromptFrame[Title..'PromptTitle']

            local TitleTextSize = TextService:GetTextSize(Title, 20, Enum.Font.Gotham, Vector2.new(280, 0))
            
            Utility:Tween(PromptTitle, {Size = UDim2.new(0, TitleTextSize.X, 0, TitleTextSize.Y)}, 0.25)

            Utility:Tween(PromptHolder, {BackgroundTransparency = 0.1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptFrame, {BackgroundTransparency = NotificationTransparency}, 0.25)
            Utility:Tween(PromptFrame, {Size = UDim2.new(0, 300, 0, 150)}, 0.25)
            Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 5)}, 0.25)
            task.wait(0.25)
            Utility:Tween(ButtonStroke, {Thickness = 1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptText, {TextTransparency = 0}, 0.25)
            Utility:Tween(PromptTitle, {TextTransparency = 0}, 0.25)
            Utility:Tween(Button, {BackgroundTransparency = 0}, 0.25)
            Utility:Tween(Button, {TextTransparency = 0}, 0.25)

            Button.MouseEnter:Connect(function(Input)
                Utility:Tween(Button, {TextColor3 = Utility:Lighten(Theme.PrimaryTextColor)}, 0.25)
            end)

            Button.MouseLeave:Connect(function(Input)
                Utility:Tween(Button, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
            end)
            
            Button.MouseButton1Down:Connect(function()
                Utility:Tween(Button, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptText, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptTitle, {TextTransparency = 1}, 0.25)
                task.wait(0.25)
                Utility:Tween(ButtonStroke, {Thickness = 0}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptFrame, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(PromptFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
                Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 100)}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptHolder, {BackgroundTransparency = 1}, 0.25)
                task.wait()
                PromptFrame:Destroy()
                task.spawn(function()
                    pcall(ButtonCallback)
                end)
            end)
        elseif Type == 'TwoButton' then
            local Args = ...
            local Button1Text = Args[1]
            local Button1Callback = Args[2]
            local Button2Text = Args[3]
            local Button2Callback = Args[4]
            Utility:Create('Frame', {
                Name = Title..'PromptFrame',
                Parent = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder'),
                BackgroundColor3 = Theme.PromptColor,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BorderSizePixel = 0,
                ZIndex = 101,
                BackgroundTransparency = NotificationTransparency,
                Size = UDim2.new(0, 0, 0, 0)
            }, {
                Utility:Create('UICorner', {
                    Name = Title..'PromptFrameCorner',
                    CornerRadius = UDim.new(0, 100)
                }),
                Utility:Create('UIStroke', {
                    Name = Title..'PromptFrameStroke',
                    ApplyStrokeMode = 'Contextual',
                    Color = Theme.UIStrokeColor,
                    LineJoinMode = 'Round',
                    Thickness = 1
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptTitle',
                    TextTransparency = 1,
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 5),
                    Size = UDim2.new(0, 0, 0, 20),
                    Font = Enum.Font.Gotham,
                    Text = Title,
                    TextColor3 = Theme.PrimaryTextColor,
                    TextSize = 20,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptText',
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 26),
                    Size = UDim2.new(0, 280, 0, 77),
                    Font = Enum.Font.Gotham,
                    Text = Text,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextSize = 15,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextButton', {
                    Name = Title..'Button1',
                    BackgroundColor3 = Theme.SecondaryElementColor,
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    Text = Button1Text,
                    Font = Enum.Font.Gotham,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Position = UDim2.new(0, 10, 0, 110),
                    Size = UDim2.new(0, 135, 0, 30),
                    BorderSizePixel = 0,
                    TextSize = 15,
                    ZIndex = 103,
                    Visible = true,
                    AutoButtonColor = false
                }, {
                    Utility:Create('UIStroke', {
                        Name = Title..'Button1Stroke',
                        ApplyStrokeMode = 'Border',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 0
                    }),
                    Utility:Create('UICorner', {
                        Name = Title..'Button1Corner',
                        CornerRadius = UDim.new(0, 5)
                    })
                }),
                Utility:Create('TextButton', {
                    Name = Title..'Button2',
                    BackgroundColor3 = Theme.SecondaryElementColor,
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    Text = Button2Text,
                    Font = Enum.Font.Gotham,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Position = UDim2.new(0, 155, 0, 110),
                    Size = UDim2.new(0, 135, 0, 30),
                    BorderSizePixel = 0,
                    TextSize = 15,
                    ZIndex = 103,
                    Visible = true,
                    AutoButtonColor = false
                }, {
                    Utility:Create('UIStroke', {
                        Name = Title..'Button2Stroke',
                        ApplyStrokeMode = 'Border',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 0
                    }),
                    Utility:Create('UICorner', {
                        Name = Title..'Button2Corner',
                        CornerRadius = UDim.new(0, 5)
                    })
                })
            })

            local PromptHolder = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder')
            local PromptFrame = PromptHolder[Title..'PromptFrame']
            local PromptFrameCorner = PromptFrame[Title..'PromptFrameCorner']
            local Button1 = PromptFrame[Title..'Button1']
            local Button1Stroke = Button1[Title..'Button1Stroke']
            local Button2 = PromptFrame[Title..'Button2']
            local Button2Stroke = Button2[Title..'Button2Stroke']
            local PromptText = PromptFrame[Title..'PromptText']
            local PromptTitle = PromptFrame[Title..'PromptTitle']

            local TitleTextSize = TextService:GetTextSize(Title, 20, Enum.Font.Gotham, Vector2.new(280, 0))
            
            Utility:Tween(PromptTitle, {Size = UDim2.new(0, TitleTextSize.X, 0, TitleTextSize.Y)}, 0.25)

            Utility:Tween(PromptHolder, {BackgroundTransparency = 0.1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptFrame, {BackgroundTransparency = NotificationTransparency}, 0.25)
            Utility:Tween(PromptFrame, {Size = UDim2.new(0, 300, 0, 150)}, 0.25)
            Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 5)}, 0.25)
            task.wait(0.25)
            Utility:Tween(Button1Stroke, {Thickness = 1}, 0.25)
            Utility:Tween(Button2Stroke, {Thickness = 1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptText, {TextTransparency = 0}, 0.25)
            Utility:Tween(PromptTitle, {TextTransparency = 0}, 0.25)
            Utility:Tween(Button1, {BackgroundTransparency = 0}, 0.25)
            Utility:Tween(Button1, {TextTransparency = 0}, 0.25)
            Utility:Tween(Button2, {BackgroundTransparency = 0}, 0.25)
            Utility:Tween(Button2, {TextTransparency = 0}, 0.25)

            Button1.MouseEnter:Connect(function(Input)
                Utility:Tween(Button1, {TextColor3 = Utility:Lighten(Theme.PrimaryTextColor)}, 0.25)
            end)

            Button1.MouseLeave:Connect(function(Input)
                Utility:Tween(Button1, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
            end)

            Button2.MouseEnter:Connect(function(Input)
                Utility:Tween(Button2, {TextColor3 = Utility:Lighten(Theme.PrimaryTextColor)}, 0.25)
            end)

            Button2.MouseLeave:Connect(function(Input)
                Utility:Tween(Button2, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
            end)
            
            Button1.MouseButton1Down:Connect(function()
                Utility:Tween(Button1, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button1, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptText, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptTitle, {TextTransparency = 1}, 0.25)
                Utility:Tween(Button2, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button2, {TextTransparency = 1}, 0.25)
                task.wait(0.25)
                Utility:Tween(Button1Stroke, {Thickness = 0}, 0.25)
                Utility:Tween(Button2Stroke, {Thickness = 0}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptFrame, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(PromptFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
                Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 100)}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptHolder, {BackgroundTransparency = 1}, 0.25)
                task.wait()
                PromptFrame:Destroy()
                task.spawn(function()
                    pcall(Button1Callback)
                end)
            end)

            Button2.MouseButton1Down:Connect(function()
                Utility:Tween(Button2, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button2, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptText, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptTitle, {TextTransparency = 1}, 0.25)
                Utility:Tween(Button1, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button1, {TextTransparency = 1}, 0.25)
                task.wait(0.25)
                Utility:Tween(Button1Stroke, {Thickness = 0}, 0.25)
                Utility:Tween(Button2Stroke, {Thickness = 0}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptFrame, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(PromptFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
                Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 100)}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptHolder, {BackgroundTransparency = 1}, 0.25)
                task.wait()
                PromptFrame:Destroy()
                task.spawn(function()
                    pcall(Button2Callback)
                end)
            end)
        end
    end
end

-- // Library Functions
do
    function Library:CreateWindow(HubName, GameName, IntroText, IntroIcon, ImprovePerformance, ConfigFolder, Theme)
        -- Existing code...
        local Theme = Theme or 'Default'
        local ThemeTable = Themes[Theme]
        local ConfigFolder = ConfigFolder or 'VisualUILibraryConfig'
        local ImprovePerformance = ImprovePerformance or false
        local IntroIcon = IntroIcon or 'rbxassetid://4535131979'
        local IntroText = IntroText or 'Welcome to the UI Library!'
        local GameName = GameName or 'Roblox'
        local HubName = HubName or 'UI Library'
        ConfigF = ConfigFolder
    
        if ImprovePerformance == true then
            NotificationTransparency = 1
        else
            NotificationTransparency = 0
        end
    
        if isfolder(ConfigFolder) == false then
            makefolder(ConfigFolder)
        end
    
        writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(ThemeTable))
    
        if readfile('fml.txt') == 'true' then
            writefile('fml.txt', 'false')
        end
    
        local Container = Utility:Create('ScreenGui', {
            Name = UIName,
            Parent = CoreGui,
            ResetOnSpawn = false, -- Keep UI on respawn
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            IgnoreGuiInset = true -- Important for full-screen UI
        }, {
            Utility:Create('Frame', {
                Name = 'Main',
                BackgroundColor3 = ThemeTable.BackgroundColor,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5), -- Center the UI
                Position = UDim2.new(0.5, 0, 0.5, 0), -- Center the UI
                Size = UDim2.new(0.3, 0, 0.6, 0)
            }, {
                Utility:Create('UICorner', {
                    CornerRadius = UDim.new(0, 5),
                    Name = 'MainCorner'
                }),
                Utility:Create('Frame', {
                    Name = 'Intro',
                    BackgroundColor3 = ThemeTable.SidebarColor,
                    Size = UDim2.new(0, 200, 1, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BorderSizePixel = 0
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = 'IntroCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = 'IntroStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = ThemeTable.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('ImageLabel', {
                        Name = 'IntroIcon',
                        BackgroundTransparency = 1,
                        Image = IntroIcon,
                        Size = UDim2.new(0, 75, 0, 75),
                        Position = UDim2.new(0.5, 0, 0.1, 0),
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    }),
                    Utility:Create('TextLabel', {
                        Name = 'IntroText',
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0.5, 0, 0.6, 0),
                        Size = UDim2.new(0, 180, 0, 75),
                        Font = Enum.Font.Gotham,
                        TextWrapped = true,
                        Text = IntroText,
                        TextColor3 = ThemeTable.PrimaryTextColor,
                        TextSize = 15,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        TextXAlignment = Enum.TextXAlignment.Center
                    }),
                    Utility:Create('TextLabel', {
                        Name = 'GameName',
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0.5, 0, 0.9, 0),
                        Size = UDim2.new(0, 180, 0, 20),
                        Font = Enum.Font.Gotham,
                        Text = GameName,
                        TextColor3 = ThemeTable.SecondaryTextColor,
                        TextSize = 12,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        TextXAlignment = Enum.TextXAlignment.Center
                    }),
                    Utility:Create('TextLabel', {
                        Name = 'HubName',
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0.5, 0, 0.2, 0),
                        Size = UDim2.new(0, 180, 0, 20),
                        Font = Enum.Font.GothamBold,
                        Text = HubName,
                        TextColor3 = ThemeTable.PrimaryTextColor,
                        TextSize = 16,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                }),
                Utility:Create('Frame', {
                    Name = 'Sidebar',
                    BackgroundColor3 = ThemeTable.SidebarColor,
                    Size = UDim2.new(0, 200, 0.9, 0),
                    Position = UDim2.new(0, 0, 0.1, 0),
                    BorderSizePixel = 0
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = 'SidebarCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = 'SidebarStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = ThemeTable.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('ScrollingFrame', {
                        Name = 'TabButtons',
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, -10, 1, -10),
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        ScrollBarThickness = 3,
                        CanvasSize = Vector2.new(0, 0)
                    }, {
                        Utility:Create('UIPadding', {
                            Name = 'TabButtonsPadding',
                            PaddingTop = UDim.new(0, 5),
                            PaddingBottom = UDim.new(0, 5)
                        }),
                        Utility:Create('UIListLayout', {
                            Name = 'TabButtonsListLayout',
                            Padding = UDim.new(0, 5),
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })
                    })
                }),
                Utility:Create('Frame', {
                    Name = 'TabContainer',
                    BackgroundColor3 = ThemeTable.BackgroundColor,
                    Size = UDim2.new(1, -200, 0.9, 0),
                    Position = UDim2.new(1, 0, 0.1, 0),
                    BorderSizePixel = 0
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = 'TabContainerCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = 'TabContainerStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = ThemeTable.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('Frame', {
                        Name = 'PromptHolder',
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 1, 0),
                        Position = UDim2.new(0, 0, 0, 0),
                        ZIndex = 100
                    })
                })
            })
        })
    
        local Main = Container.Main
    
        -- Mobile Dragging (Modified)
        local function EnableMobileDragging(Frame)
            local Dragging = false
            local DragStart = Vector2.new(0, 0)
            local StartPosition = UDim2.new(0, 0, 0, 0)
    
            Frame.InputBegan:Connect(function(Input, gameProcessedEvent)
                if not gameProcessedEvent and (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) then
                    Dragging = true
                    DragStart = Input.Position
                    StartPosition = Frame.Position
                end
            end)
    
            Frame.InputChanged:Connect(function(Input)
                if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
                    local Delta = Input.Position - DragStart
                    Frame.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
                end
            end)
    
            Frame.InputEnded:Connect(function(Input, gameProcessedEvent)
                if Dragging and (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) then
                    Dragging = false
                end
            end)
        end
    
        EnableMobileDragging(Container.Main)
    
        -- Show/Hide Button (Draggable)
        local ShowHideButton = Utility:Create('TextButton', {
            Name = 'ShowHideButton',
            Size = UDim2.new(0, 50, 0, 30),
            BackgroundColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = 0.5,
            TextColor3 = Color3.new(1, 1, 1),
            Text = "Show",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.1, 0, 0.9, 0),
            ZIndex = 100
        })
        ShowHideButton.Parent = CoreGui
        local function ToggleVisibility()
            if Main.Visible then
                Main.Visible = false
                ShowHideButton.Text = "Show"
            else
                Main.Visible = true
                ShowHideButton.Text = "Hide"
            end
        end
    
        ShowHideButton.MouseButton1Click:Connect(ToggleVisibility)
    
        EnableMobileDragging(ShowHideButton)
    
        -- Mobile Keybind Frame (Floating Toggle)
        local MobileKeybindFrame = Utility:Create('Frame', {
            Name = 'MobileKeybindFrame',
            Size = UDim2.new(0, 100, 0, 40),
            BackgroundColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = 0.5,
            Visible = false,
            Active = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            ZIndex = 101
        })
        MobileKeybindFrame.Parent = CoreGui
    
        local MobileKeybindText = Utility:Create('TextLabel', {
            Name = 'MobileKeybindText',
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = 1,
            TextColor3 = Color3.new(1, 1, 1),
            Text = "Keybind",
            TextScaled = true,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center
        })
        MobileKeybindText.Parent = MobileKeybindFrame
    
        -- Function to show/hide the mobile keybind frame
        local function ShowMobileKeybind(text)
            MobileKeybindText.Text = text
            MobileKeybindFrame.Visible = true
        end
    
        local function HideMobileKeybind()
            MobileKeybindFrame.Visible = false
        end
    
        -- Existing code (Sidebar, TabContainer, etc.)
        -- Modify the Toggle Element Function
        local self = {}
        function self:AddTab(TabName)
            local TabButton = Utility:Create('TextButton', {
                Name = TabName,
                BackgroundColor3 = ThemeTable.PrimaryElementColor,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, -10, 0, 30),
                Font = Enum.Font.Gotham,
                Text = TabName,
                TextColor3 = ThemeTable.PrimaryTextColor,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                AutoButtonColor = false
            }, {
                Utility:Create('UIPadding', {
                    Name = 'TabButtonPadding',
                    PaddingLeft = UDim.new(0, 5)
                }),
                Utility:Create('UICorner', {
                    CornerRadius = UDim.new(0, 5),
                    Name = 'TabButtonCorner'
                }),
                Utility:Create('UIStroke', {
                    Name = 'TabButtonStroke',
                    ApplyStrokeMode = 'Contextual',
                    Color = ThemeTable.UIStrokeColor,
                    LineJoinMode = 'Round',
                    Thickness = 1
                })
            })
            local TabContainer = Utility:Create('ScrollingFrame', {
                Name = TabName,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Position = UDim2.new(0, 0, 0, 0),
                Visible = false,
                ScrollBarThickness = 3,
                CanvasSize = Vector2.new(0, 0)
            }, {
                Utility:Create('UIPadding', {
                    Name = 'TabContainerPadding',
                    PaddingTop = UDim.new(0, 5),
                    PaddingLeft = UDim.new(0, 5),
                    PaddingRight = UDim.new(0, 5),
                    PaddingBottom = UDim.new(0, 5)
                }),
                Utility:Create('UIListLayout', {
                    Name = 'TabContainerListLayout',
                    Padding = UDim.new(0, 5),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            })
            TabButton.Parent = Main.Sidebar.TabButtons
            TabContainer.Parent = Main.TabContainer
            TabButton.MouseButton1Click:Connect(function()
                for _, Tab in next, Main.TabContainer:GetChildren() do
                    if Tab:IsA('ScrollingFrame') then
                        Tab.Visible = false
                    end
                end
                TabContainer.Visible = true
                for _, Button in next, Main.Sidebar.TabButtons:GetChildren() do
                    if Button:IsA('TextButton') then
                        Utility:Tween(Button, {BackgroundColor3 = ThemeTable.PrimaryElementColor}, 0.25)
                    end
                end
                Utility:Tween(TabButton, {BackgroundColor3 = ThemeTable.SecondaryElementColor}, 0.25)
            end)
            local Table = {TabButton, TabContainer}
            return Table
        end
    
        local Elements = {}
        function Elements:CreateButton(Tab, Name, Text, DebounceAmount, Callback)
            local TabButton = Tab[1]
            local TabContainer = Tab[2]
            local Debounce = false
            local Button = Utility:Create('TextButton', {
                Name = Name,
                BackgroundColor3 = ThemeTable.PrimaryElementColor,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 30),
                Font = Enum.Font.Gotham,
                Text = Text,
                TextColor3 = ThemeTable.PrimaryTextColor,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Center,
                BorderSizePixel = 0,
                AutoButtonColor = false
            }, {
                Utility:Create('UICorner', {
                    CornerRadius = UDim.new(0, 5),
                    Name = 'ButtonCorner'
                }),
                Utility:Create('UIStroke', {
                    Name = 'ButtonStroke',
                    ApplyStrokeMode ='Contextual',
                    Color = ThemeTable.UIStrokeColor,
                    LineJoinMode = 'Round',
                    Thickness = 1
                })
            })
            Button.Parent = TabContainer
            Button.MouseButton1Click:Connect(function()
                if not Debounce then
                    task.spawn(function()
                        pcall(Callback)
                    end)
                    Debounce = true
                    task.wait(DebounceAmount)
                    Debounce = false
                end
            end)
        end
    
        function Elements:CreateLabel(Tab, Name, Text)
            local TabButton = Tab[1]
            local TabContainer = Tab[2]
            local Label = Utility:Create('TextLabel', {
                Name = Name,
                BackgroundColor3 = ThemeTable.PrimaryElementColor,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 30),
                Font = Enum.Font.Gotham,
                Text = Text,
                TextColor3 = ThemeTable.PrimaryTextColor,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
            }, {
                Utility:Create('UIPadding', {
                    Name = 'LabelPadding',
                    PaddingLeft = UDim.new(0, 5)
                })
            })
            Label.Parent = TabContainer
        end
    
        function Elements:CreateTextBox(Tab, Name, Default, DebounceAmount, Callback)
            local TabButton = Tab[1]
            local TabContainer = Tab[2]
            local Debounce = false
            local TextBox = Utility:Create('TextBox', {
                Name = Name,
                BackgroundColor3 = ThemeTable.PrimaryElementColor,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 30),
                Font = Enum.Font.Gotham,
                Text = Default,
                TextColor3 = ThemeTable.PrimaryTextColor,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                ClearTextOnFocus = false,
                PlaceholderText = 'Text'
            }, {
                Utility:Create('UIPadding', {
                    Name = 'TextBoxPadding',
                    PaddingLeft = UDim.new(0, 5)
                }),
                Utility:Create('UICorner', {
                    CornerRadius = UDim.new(0, 5),
                    Name = 'TextBoxCorner'
                }),
                Utility:Create('UIStroke', {
                    Name = 'TextBoxStroke',
                    ApplyStrokeMode = 'Contextual',
                    Color = ThemeTable.UIStrokeColor,
                    LineJoinMode = 'Round',
                    Thickness = 1
                })
            })
            TextBox.Parent = TabContainer
            TextBox.FocusLost:Connect(function(enterInput)
                if not Debounce then
                    task.spawn(function()
                        pcall(Callback, TextBox.Text)
                    end)
                    Debounce = true
                    task.wait(DebounceAmount)
                    Debounce = false
                end
            end)
        end
    
        function Elements:CreateSlider(Tab, Name, Min, Max, Default, Increment, Callback)
            local TabButton = Tab[1]
            local TabContainer = Tab[2]
            local SliderHolder = Utility:Create('Frame', {
                Name = Name,
                BackgroundColor3 = ThemeTable.BackgroundColor,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 30),
                BorderSizePixel = 0,
            }, {
                Utility:Create('TextLabel', {
                    Name = 'SliderLabel',
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(0, 100, 1, 0),
                    Font = Enum.Font.Gotham,
                    Text = Name,
                    TextColor3 = ThemeTable.PrimaryTextColor,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left
                }, {
                    Utility:Create('UIPadding', {
                        Name = 'SliderLabelPadding',
                        PaddingLeft = UDim.new(0, 5)
                    })
                }),
                Utility:Create('TextLabel', {
                    Name = 'SliderValue',
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, -100, 0, 0),
                    Size = UDim2.new(0, 100, 1, 0),
                    Font = Enum.Font.Gotham,
                    Text = tostring(Default),
                    TextColor3 = ThemeTable.SecondaryTextColor,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Right
                }, {
                    Utility:Create('UIPadding', {
                        Name = 'SliderValuePadding',
                        PaddingRight = UDim.new(0, 5)
                    })
                }),
                Utility:Create('Frame', {
                    Name = 'SliderBackground',
                    BackgroundColor3 = ThemeTable.SecondaryElementColor,
                    Position = UDim2.new(0, 100, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.new(1, -200, 0, 5),
                    BorderSizePixel = 0
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = 'SliderBackgroundCorner'
                    }),
                    Utility:Create('Frame', {
                        Name = 'SliderBar',
                        BackgroundColor3 = ThemeTable.PrimaryTextColor,
                        Position = UDim2.new(0, 0, 0, 0),
                        Size = UDim2.new((Default - Min) / (Max - Min), 0, 1, 0),
                        BorderSizePixel = 0
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = 'SliderBarCorner'
                        })
                    })
                })
            })
            SliderHolder.Parent = TabContainer
            local SliderBackground = SliderHolder['SliderBackground']
            local SliderBar = SliderBackground['SliderBar']
            local SliderValue = SliderHolder['SliderValue']
            local UIS = game:GetService('UserInputService')
            local IsDragging = false
            SliderBackground.InputBegan:Connect(function(Input, gameProcessedEvent)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    IsDragging = true
                end
            end)
            SliderBackground.InputEnded:Connect(function(Input, gameProcessedEvent)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    IsDragging = false
                end
            end)
            UIS.InputChanged:Connect(function(Input)
                if IsDragging then
                    local ObjectXSize = SliderBackground.AbsolutePosition.X
                    local MousePosition = Input.Position.X
                    local SizeX = SliderBackground.AbsoluteSize.X
                    local NewValue = math.clamp((MousePosition - ObjectXSize) / SizeX, 0, 1)
                    local Value = math.floor((Min + (Max - Min) * NewValue) / Increment + 0.5) * Increment
                    SliderBar:TweenSize(UDim2.new((Value - Min) / (Max - Min), 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
                    SliderValue.Text = tostring(Value)
                    Callback(Value)
                end
            end)
        end
    
        function Elements:CreateDropdown(Tab, Name, Options, Default, Callback)
            local TabButton = Tab[1]
            local TabContainer = Tab[2]
            local DropdownHolder = Utility:Create('Frame', {
                Name = Name,
                BackgroundColor3 = ThemeTable.BackgroundColor,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 30),
                BorderSizePixel = 0,
            }, {
                Utility:Create('TextLabel', {
                    Name = 'DropdownLabel',
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(0, 100, 1, 0),
                    Font = Enum.Font.Gotham,
                    Text = Name,
                    TextColor3 = ThemeTable.PrimaryTextColor,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left
                }, {
                    Utility:Create('UIPadding', {
                        Name = 'DropdownLabelPadding',
                        PaddingLeft = UDim.new(0, 5)
                    })
                }),
                Utility:Create('TextButton', {
                    Name = 'DropdownButton',
                    BackgroundColor3 = ThemeTable.PrimaryElementColor,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, -100, 0, 0),
                    Size = UDim2.new(0, 100, 1, 0),
                    Font = Enum.Font.Gotham,
                    Text = Default,
                    TextColor3 = ThemeTable.PrimaryTextColor,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    BorderSizePixel = 0,
                    AutoButtonColor = false
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = 'DropdownButtonCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = 'DropdownButtonStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = ThemeTable.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    })
                })
            })
            DropdownHolder.Parent = TabContainer
            local DropdownButton = DropdownHolder['DropdownButton']
            local DropdownOpen = false
            DropdownButton.MouseButton1Click:Connect(function()
                if DropdownOpen == false then
                    DropdownOpen = true
                    local DropdownOptions = Utility:Create('Frame', {
                        Name = 'DropdownOptions',
                        BackgroundColor3 = ThemeTable.BackgroundColor,
                        Position = UDim2.new(0, 0, 1, 0),
                        Size = UDim2.new(1, 0, 0, 0),
                        BorderSizePixel = 0
                    }, {
                        Utility:Create('UIListLayout', {
                            Name = 'DropdownOptionsListLayout',
                            Padding = UDim.new(0, 5),
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })
                    })
                    DropdownOptions.Parent = DropdownHolder
                    for Index, Option in next, Options do
                        local DropdownOptionButton = Utility:Create('TextButton', {
                            Name = Option,
                            BackgroundColor3 = ThemeTable.PrimaryElementColor,
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 0, 30),
                            Font = Enum.Font.Gotham,
                            Text = Option,
                            TextColor3 = ThemeTable.PrimaryTextColor,
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            BorderSizePixel = 0,
                            AutoButtonColor = false
                        }, {
                            Utility:Create('UICorner', {
                                CornerRadius = UDim.new(0, 5),
                                Name = 'DropdownOptionButtonCorner'
                            }),
                            Utility:Create('UIStroke', {
                                Name = 'DropdownOptionButtonStroke',
                                ApplyStrokeMode = 'Contextual',
                                Color = ThemeTable.UIStrokeColor,
                                LineJoinMode = 'Round',
                                Thickness = 1
                            })
                        })
                        DropdownOptionButton.Parent = DropdownOptions
                        DropdownOptionButton.MouseButton1Click:Connect(function()
                            DropdownButton.Text = Option
                            Callback(Option)
                            DropdownOpen = false
                            DropdownOptions:Destroy()
                        end)
                    end
                else
                    DropdownOpen = false
                    if DropdownHolder:FindFirstChild('DropdownOptions') then
                        DropdownHolder:FindFirstChild('DropdownOptions'):Destroy()
                    end
                end
            end)
        end
    
        function Elements:CreateColorPicker(Tab, Name, Default, Callback)
            local TabButton = Tab[1]
            local TabContainer = Tab[2]
            local ColorPickerHolder = Utility:Create('Frame', {
                Name = Name,
                BackgroundColor3 = ThemeTable.BackgroundColor,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 30),
                BorderSizePixel = 0,
            }, {
                Utility:Create('TextLabel', {
                    Name = 'ColorPickerLabel',
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(0, 100, 1, 0),
                    Font = Enum.Font.Gotham,
                    Text = Name,
                    TextColor3 = ThemeTable.PrimaryTextColor,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left
                }, {
                    Utility:Create('UIPadding', {
                        Name = 'ColorPickerLabelPadding',
                        PaddingLeft = UDim.new(0, 5)
                    })
                }),
                Utility:Create('Frame', {
                    Name = 'ColorPickerButton',
                    BackgroundColor3 = Default,
                    Position = UDim2.new(1, -100, 0, 0),
                    Size = UDim2.new(0, 100, 1, 0),
                    BorderSizePixel = 0
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = 'ColorPickerButtonCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = 'ColorPickerButtonStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = ThemeTable.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    })
                })
            })
            ColorPickerHolder.Parent = TabContainer
            local ColorPickerButton = ColorPickerHolder['ColorPickerButton']
            ColorPickerButton.MouseButton1Click:Connect(function()
                local ColorPickerFrame = Utility:Create('Frame', {
                    Name = 'ColorPickerFrame',
                    BackgroundColor3 = ThemeTable.BackgroundColor,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(0, 200, 0, 200),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BorderSizePixel = 0
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = 'ColorPickerFrameCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = 'ColorPickerFrameStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = ThemeTable.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    })
                })
                ColorPickerFrame.Parent = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder')
            end)
        end
    
        function Elements:CreateToggle(Tab, Name, Default, ToggleColor, DebounceAmount, Callback)
            local TabButton = Tab[1]
            local TabContainer = Tab[2]
            local Debounce = false
            local Toggled = Default
            local ToggleHolder = Utility:Create('Frame', {
                Name = Name,
                BackgroundColor3 = ThemeTable.BackgroundColor,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 30),
                BorderSizePixel = 0,
            }, {
                Utility:Create('TextLabel', {
                    Name = 'ToggleLabel',
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(0, 100, 1, 0),
                    Font = Enum.Font.Gotham,
                    Text = Name,
                    TextColor3 = ThemeTable.PrimaryTextColor,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left
                }, {
                    Utility:Create('UIPadding', {
                        Name = 'ToggleLabelPadding',
                        PaddingLeft = UDim.new(0, 5)
                    })
                }),
                Utility:Create('Frame', {
                    Name = 'Toggle',
                    BackgroundColor3 = ThemeTable.SecondaryElementColor,
                    Position = UDim2.new(1, -55, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.new(0, 50, 0, 20),
                    BorderSizePixel = 0
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = 'ToggleCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = 'ToggleStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = ThemeTable.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('Frame', {
                        Name = 'Circle',
                        BackgroundColor3 = ThemeTable.PrimaryTextColor,
                        Position = UDim2.new(0, 5, 0.5, 0),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Size = UDim2.new(0, 10, 0, 10),
                        BorderSizePixel = 0
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 100),
                            Name = 'CircleCorner'
                        })
                    })
                })
            })
            ToggleHolder.Parent = TabContainer
            local Toggle = ToggleHolder['Toggle']
            local Circle = Toggle['Circle']
            local ToggleButton = ToggleHolder['Toggle']
            if Toggled then
                Utility:Tween(Toggle, {BackgroundColor3 = ToggleColor}, 0.25)
                Utility:Tween(Circle, {Position = UDim2.new(0, 30, 0, 5)}, 0.25)
            else
                Utility:Tween(Toggle, {BackgroundColor3 = ThemeTable.SecondaryElementColor}, 0.25)
                Utility:Tween(Circle, {Position = UDim2.new(0, 5, 0, 5)}, 0.25)
            end
            ToggleButton.MouseButton1Down:Connect(function()
                if not Debounce then
                    Toggled = not Toggled
                    task.spawn(function()
                        pcall(Callback, Toggled)
                    end)
                    Debounce = true
                    if Toggled then
                        Utility:Tween(Toggle, {BackgroundColor3 = ToggleColor}, 0.25)
                        Utility:Tween(Circle, {Position = UDim2.new(0, 30, 0, 5)}, 0.25)
                        -- Show Mobile Keybind
                        if RunService:IsTouchEnabled() then
                            ShowMobileKeybind(Name)
                        end
                    else
                        Utility:Tween(Toggle, {BackgroundColor3 = ThemeTable.SecondaryElementColor}, 0.25)
                        Utility:Tween(Circle, {Position = UDim2.new(0, 5, 0, 5)}, 0.25)
                        -- Hide Mobile Keybind
                        if RunService:IsTouchEnabled() then
                            HideMobileKeybind()
                        end
                    end
                    task.wait(DebounceAmount)
                    Debounce = false
                end
            end)
        end
        local Table = {self, Elements}
        return Table
    end
end
return Library
