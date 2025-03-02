--[[ 
   Visual UI Library | .gg/puxxCphTnK - Modified Version
   Modified on 2025-03-02 by ChatGPT (Gen Z)
   Changes: Added this header and a footer comment for versioning/clarity.
   Note: No functional or logical changes were made.
--]]

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
    -- ... (other themes remain unchanged)
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

    function Utility:EnableDragging(Frame)
        local Dragging, DraggingInput, DragStart, StartPosition
        
        local function Update(Input)
            local Delta = Input.Position - DragStart
            Frame.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        end
        
        Frame.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = true
                DragStart = Input.Position
                StartPosition = Frame.Position
        
                Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)
        
        Frame.InputChanged:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseMovement then
                DraggingInput = Input
            end
        end)
        
        UserInputService.InputChanged:Connect(function(Input)
            if Input == DraggingInput and Dragging then
                Update(Input)
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
                    CornerRadius = UDim.new(0, 100),
                    Name = Title..'PromptFrameCorner'
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
                }, {
                    Utility:Create('UIPadding', {
                        Name = Title..'PromptTitlePadding',
                        PaddingLeft = UDim.new(0, 7)
                    })
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
                }, {
                    Utility:Create('UIPadding', {
                        Name = Title..'PromptTextPadding',
                        PaddingLeft = UDim.new(0, 7)
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
            Utility:Tween(PromptFrame, {BackgroundTransparency = NotificationTransparency0}, 0.25)
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
                pcall(ButtonCallback)
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
            local Button2 = PromptFrame[Title..'Button2']
            local Button1Stroke = Button1[Title..'Button1Stroke']
            local Button2Stroke = Button2[Title..'Button2Stroke']
            local PromptText = PromptFrame[Title..'PromptText']
            local PromptTitle = PromptFrame[Title..'PromptTitle']

            local TitleTextSize = TextService:GetTextSize(Title, 20, Enum.Font.Gotham, Vector2.new(280, 0))
            
            Utility:Tween(PromptTitle, {Size = UDim2.new(0, TitleTextSize.X, 0, TitleTextSize.Y)}, 0.25)

            Utility:Tween(PromptHolder, {BackgroundTransparency = 0.1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptFrame, {BackgroundTransparency = 0.1}, 0.25)
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
            
            Button1.MouseButton1Down:Connect(function()
                pcall(Button1Callback)
                Utility:Tween(Button1, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button1, {TextTransparency = 1}, 0.25)
                Utility:Tween(Button2, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button2, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptText, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptTitle, {TextTransparency = 1}, 0.25)
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
            end)

            Button2.MouseEnter:Connect(function(Input)
                Utility:Tween(Button2, {TextColor3 = Utility:Lighten(Theme.PrimaryTextColor)}, 0.25)
            end)

            Button2.MouseLeave:Connect(function(Input)
                Utility:Tween(Button2, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
            end)
            
            Button2.MouseButton1Down:Connect(function()
                pcall(Button2Callback)
                Utility:Tween(Button1, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button1, {TextTransparency = 1}, 0.25)
                Utility:Tween(Button2, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button2, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptText, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptTitle, {TextTransparency = 1}, 0.25)
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
            end)
        end
    end
end

do 
    Utility:DestroyUI()
    BreakAllLoops = false
    task.spawn(function()
        while task.wait(1) do
            local x = readfile('fml.txt')
            if x == 'true' then
                for Index, Value in next, Ihatethisui do
                    print(Index, Value)
                    Ihatethisui[Index]:Break()
                end
                writefile('fml.txt', 'false')
            end
        end
    end)
end

-- // Library Functions
function Library:DestroyUI()
    Utility:DestroyUI()
end

function Library:ToggleUI()
    Utility:ToggleUI()
end

function Library:SetTransparency(Transparency, NotificationBool)
    local UI = CoreGui:WaitForChild('Visual UI Library | .gg/puxxCphTnK')
    local Blacklist = {
        'UIPadding',
        'UICorner',
        'UIStroke',
        'UIListLayout',
        'Folder'
    }

    for _, Item in next, UI:GetDescendants() do
        if not table.find(Blacklist, Item.ClassName) then
            if Item.BackgroundTransparency ~= 1 and Transparency < 0.95 then
                Utility:Tween(Item, {BackgroundTransparency = Transparency}, 0.25)
            end
        end
    end

    if NotificationBool then
        NotificationTransparency = Transparency
    end
end

function Library:SaveConfig(Name)
    if Name ~= '' then
        if isfolder(ConfigF) then
            if isfile(ConfigF..'/'..Name..'.json') then
                Library:CreatePrompt('TwoButton', 'Overwrite Config', 'A config already exists with this name, are you sure you want to overwrite it?', {
                    'Yes',
                    function()
                        local Json = HttpService:JSONEncode(Config)
                        local File = writefile(ConfigF..'/'..Name..'.json', Json)
                        Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
                    end,
                    'No',
                    function()
                        Library:CreateNotification('Config Not Saved', 'Config was not saved.', 5)
                    end
                })
            else
                local Json = HttpService:JSONEncode(Config)
                local File = writefile(ConfigF..'/'..Name..'.json', Json)
                Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
            end
        else
            makefolder(ConfigF)
            if isfile(ConfigF..'/'..Name..'.json') then
                Library:CreatePrompt('TwoButton', 'Overwrite Config', 'A config already exists with this name, are you sure you want to overwrite it?', {
                    'Yes',
                    function()
                        local Json = HttpService:JSONEncode(Config)
                        local File = writefile(ConfigF..'/'..Name..'.json', Json)
                        Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
                    end,
                    'No',
                    function()
                        Library:CreateNotification('Config Not Saved', 'Config was not saved.', 5)
                    end
                })
            else
                local Json = HttpService:JSONEncode(Config)
                local File = writefile(ConfigF..'/'..Name..'.json', Json)
                Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
            end
        end
    else
        Library:CreateNotification('Config Not Saved', 'Please enter a name for the config.', 5)
    end
end

function Library:LoadConfig(Name)
    if isfile(ConfigF..'/'..Name..'.json') then
        Library:CreatePrompt('TwoButton', 'Load Config', 'Are you sure you want to load this config?', {
            'Yes',
            function()
                local Config = readfile(ConfigF..'/'..Name..'.json')
                local Table = HttpService:JSONDecode(Config)
                for Index, Value in next, Table do
                    if Index == 'Theme_4z3s4QrUhfqt703FmiAe' then
                        local DecodedTheme = HttpService:JSONDecode(Value)
                        local UpdatedTable = {}
                        for NewIndex, NewValue in next, DecodedTheme do
                            UpdatedTable[NewIndex] = Color3.fromRGB(NewValue[1], NewValue[2], NewValue[3])
                        end
                        Library:ChangeTheme(UpdatedTable)
                    elseif type(Value) == 'table' then
                        local New = Color3.fromRGB(Value[1] * 255, Value[2] * 255, Value[3] * 255)
                        ConfigUpdates[Index]:Set(New)
                    else
                        ConfigUpdates[Index]:Set(Value)
                    end
                end
                Library:CreateNotification('Config Loaded', 'Successfully loaded your config with the name, \''..Name..'.json'..'\'.', 5)
            end,
            'No',
            function()
                Library:CreateNotification('Config Not Loaded', 'Config was not loaded.', 5)
            end
        })
    else
        Library:CreateNotification('Config Not Loaded', 'Config doesn\'t exist.', 5)
    end
end

function Library:DeleteConfig(Name)
    if isfile(ConfigF..'/'..Name..'.json') then
        Library:CreatePrompt('TwoButton', 'Delete Config', 'Are you sure that you want to delete this config?', {
            'Yes',
            function()
                local Json = HttpService:JSONEncode(Config)
                local File = delfile(ConfigF..'/'..Name..'.json')
                Library:CreateNotification('Deleted Config', 'Successfully deleted config with the name, \''..Name..'.json'..'\'.', 5)
            end,
            'No',
            function()
                Library:CreateNotification('Config Not Deleted', 'Config was not deleted.', 5)
            end
        })
    end
end

function Library:GetConfigs()
    if isfolder(ConfigF) then
        local Configs = listfiles(ConfigF)
        local Table = {}
        for Index, Value in next, Configs do
            local New = Value:gsub(ConfigF..'\\', ''):gsub('.json', '')
            table.insert(Table, tostring(New))
        end
        return Table
    end
end 

function Library:CreateWindow(HubName, GameName, IntroText, IntroIcon, ImprovePerformance, ConfigFolder, Theme)
    local ImprovePerformance = ImprovePerformance or false
    local HasCustom = false
    local HubName = HubName or 'UI Name'
    local GameName = GameName or 'Game Name'
    local Theme = Theme
    if not Theme then
        Theme = Themes.Default
    elseif type(Theme) == 'table' then
        Theme = Theme
        Themes['Custom'] = Theme
        HasCustom = true
    elseif type(Theme) == 'string' then
        Theme = Theme:lower()
        if Theme == 'default' then
            Theme = Themes['Default']
        elseif Theme == 'lighter' then
            Theme = Themes['Lighter']
        elseif Theme == 'light' then
            Theme = Themes['Light']
        elseif Theme == 'light+' then
            Theme = Themes['Light+']
        elseif Theme == 'discord' then
            Theme = Themes['Discord']
        elseif Theme == 'red and black' then
            Theme = Themes['Red And Black']
        elseif Theme == 'nordic dark' then
            Theme = Themes['Nordic Dark']
        elseif Theme == 'nordic light' then
            Theme = Themes['Nordic Light']
        elseif Theme == 'purple' then
            Theme = Themes['Purple']
        elseif Theme == 'sentinel' then
            Theme = Themes['Sentinel']
        elseif Theme == 'synapse x' then
            Theme = Themes['Synapse X']
        elseif Theme == 'krnl' then
            Theme = Themes['Krnl']
        elseif Theme == 'script-ware' then
            Theme = Themes['Script-Ware']
        elseif Theme == 'kiriot' then
            Theme = Themes['Kiriot']
        end
    end
    local NewTable = {}

    for Index, Value in next, Theme do
        NewTable[Index] = Utility:SplitColor(Value)
    end

    if isfile('VisualUILibraryCurrentTheme.json') then
        delfile('VisualUILibraryCurrentTheme.json')
    end

    ConfigF = ConfigFolder

    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))

    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)

    local Container = Utility:Create('ScreenGui', {
        Name = UIName,
        Parent = CoreGui
    }, {
        Utility:Create('Frame', {
            Name = 'Main',
            BackgroundColor3 = Theme.BackgroundColor,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 595, 0, 150),
            Size = UDim2.new(0, 0, 0, 0)
        }, {
            Utility:Create('UICorner', {
                CornerRadius = UDim.new(0, 5),
                Name = 'MainCorner'
            }),
            Utility:Create('TextLabel', {
                Name = 'IntroText',
                BackgroundColor3 = Theme.BackgroundColor,
                BackgroundTransparency = 1,
                TextTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, -40),
                BorderSizePixel = 0,
                Size = UDim2.new(0, 170, 0, 20),
                Font = Enum.Font.Gotham,
                Text = IntroText,
                TextColor3 = Theme.PrimaryTextColor,
                TextSize = 18,
                ZIndex = 2,
                TextXAlignment = Enum.TextXAlignment.Center
            }),
            Utility:Create('ImageLabel', {
                Name = 'IntroImage',
                BackgroundColor3 = Theme.PrimaryElementColor,
                BackgroundTransparency = 1,
                ImageTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 20),
                ZIndex = 3,
                Size = UDim2.new(0, 100, 0, 100),
                Image = IntroIcon,
                ScaleType = Enum.ScaleType.Fit
            })
        }),
    })

    local Main = Container.Main
    
    Utility:EnableDragging(Container.Main)

    Utility:Tween(Main, {BackgroundTransparency = 0}, 0.25)
    Utility:Tween(Main, {Size = UDim2.new(0, 600, 0, 0)}, 0.25)
    task.wait(0.5)
    Utility:Tween(Main, {Size = UDim2.new(0, 600, 0, 375)}, 0.25)
    task.wait(0.5)
    Utility:Tween(Main['IntroText'], {TextTransparency = 0}, 0.25)
    task.wait(0.5)
    Utility:Tween(Main['IntroImage'], {ImageTransparency = 0}, 0.25)
    task.wait(3)
    Utility:Tween(Main['IntroText'], {TextTransparency = 1}, 0.25)
    task.wait(0.5)
    Utility:Tween(Main['IntroImage'], {ImageTransparency = 1}, 0.25)
    task.wait(0.5)
    Main['IntroText']:Destroy()
    Main['IntroImage']:Destroy()
    
    Utility:Create('Frame', {
        Name = 'PromptHolder',
        Parent = Main,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Parent = Main,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 600, 0, 375),
        ZIndex = 100,
        Visible = true,
        BackgroundTransparency = 1,
        BackgroundColor3 = Theme.BackgroundColor
    }, {
        Utility:Create('UICorner', {
            CornerRadius = UDim.new(0, 5),
            Parent = Main,
            Name = 'PromptHolderCorner'
        })
    })
    Utility:Create('Frame', {
        Name = 'Filler1',
        Position = UDim2.new(0, 170, 0, 0),
        Parent = Main,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 429, 0, 9),
        ZIndex = 1,
        BackgroundColor3 = Theme.BackgroundColor
    }, {
        Utility:Create('UICorner', {
            CornerRadius = UDim.new(0, 5),
            Name = 'Filler1Corner'
        })
    })
    Utility:Create('Frame', {
        Name = 'Filler2',
        Parent = Main,
        Position = UDim2.new(0, 170, 0, 364),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 429, 0, 11),
        ZIndex = 1,
        BackgroundColor3 = Theme.BackgroundColor
    }, {
        Utility:Create('UICorner', {
            CornerRadius = UDim.new(0, 5),
            Name = 'Filler2Corner'
        })
    })
    Utility:Create('Frame', {
        Name = 'Sidebar',
        BackgroundColor3 = Theme.SidebarColor,
        Parent = Main,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 170, 0, 375)
    }, {
        Utility:Create('UICorner', {
            CornerRadius = UDim.new(0, 5),
            Name = 'SidebarCorner'
        }),
        Utility:Create('Frame', {
            Name = 'NamesBehind',
            Position = UDim2.new(0, 0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(0, 169, 0, 55),
            ZIndex = 1,
            BackgroundColor3 = Theme.SidebarColor
        }, {
            Utility:Create('UICorner', {
                CornerRadius = UDim.new(0, 5),
                Name = 'NamesBehindCorner'
            })
        }),
        Utility:Create('Frame', {
            Name = 'Filler3',
            Position = UDim2.new(0, 0, 0, 368),
            BorderSizePixel = 0,
            Size = UDim2.new(0, 170, 0, 7),
            ZIndex = 1,
            BackgroundColor3 = Theme.SidebarColor
        }, {
            Utility:Create('UICorner', {
                CornerRadius = UDim.new(0, 5),
                Name = 'Filler3Corner'
            })
        }),
        Utility:Create('TextLabel', {
            Name = 'HubNameText',
            BackgroundColor3 = Theme.SidebarColor,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 6),
            BorderSizePixel = 0,
            Size = UDim2.new(0, 170, 0, 20),
            Font = Enum.Font.Gotham,
            Text = HubName,
            TextColor3 = Theme.PrimaryTextColor,
            TextSize = 18,
            ZIndex = 2,
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            Utility:Create('UIPadding', {
                Name = 'HubNameTextPadding',
                PaddingLeft = UDim.new(0, 7)
            })
        }), 
        Utility:Create('TextLabel', {
            Name = 'GameNameText',
            BackgroundColor3 = Theme.SidebarColor,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 24),
            BorderSizePixel = 0,
            Size = UDim2.new(0, 170, 0, 20),
            Font = Enum.Font.Gotham,
            Text = GameName,
            TextColor3 = Theme.SecondaryTextColor,
            TextSize = 16,
            ZIndex = 2,
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            Utility:Create('UIPadding', {
                Name = 'GameNameTextPadding',
                PaddingLeft = UDim.new(0, 7)
            })
        }),
        Utility:Create('Frame', {
            Name = 'SidebarLine1',
            BackgroundColor3 = Theme.UIStrokeColor,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 170, 0, 0),
            Size = UDim2.new(0, 1, 0, 375)
        }),
        Utility:Create('Frame', {
            Name = 'SidebarLine2',
            BackgroundColor3 = Theme.UIStrokeColor,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, 0, 48),
            Size = UDim2.new(0, 170, 0, 1)
        }),
        Utility:Create('ScrollingFrame', {
            Name = 'TabButtonHolder',
            Active = true,
            BackgroundColor3 = Theme.SidebarColor,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, 0, 55),
            Size = UDim2.new(0, 170, 0, 313),
            ScrollBarThickness = 0
        }, {
            Utility:Create('UIListLayout', {
                Name = 'TabButtonHolderListLayout',
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 3)
            })
        })
    })
    Utility:Create('Frame', {
        Name = 'TabContainer',
        BackgroundColor3 = Theme.BackgroundColor,
        Parent = Main,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 171, 0, 9),
        Size = UDim2.new(0, 429, 0, 355)
    }, {
        Utility:Create('Folder', {
            Name = 'TabsFolder'
        })
    })

    local HubNameObj = Container.Main.Sidebar.HubNameText
    local GameNameObj = Container.Main.Sidebar.GameNameText
    local TabButtonHolder = Container.Main.Sidebar.TabButtonHolder
    local TabButtonHolderListLayout = TabButtonHolder['TabButtonHolderListLayout']
    local PromptHolder = Container.Main.PromptHolder

    local HubNameTextSize = TextService:GetTextSize(HubNameObj.Text, 18, Enum.Font.Gotham, Vector2.new(410, math.huge))
    local GameNameTextSize = TextService:GetTextSize(GameNameObj.Text, 16, Enum.Font.Gotham, Vector2.new(410, math.huge))

    if HubNameTextSize.X >= 165 then
        local NewText = HubNameObj.Text
        local X = 0
        repeat 
            NewText = NewText:sub(0, -2)
            local HubNameTextSize = TextService:GetTextSize(NewText, 18, Enum.Font.Gotham, Vector2.new(410, math.huge))
            X = HubNameTextSize.X
        until X < 165
        for _ = 1, 2 do
            NewText = NewText:sub(0, -2)
        end
        HubNameObj.Text = NewText..'...'
    end

    if GameNameTextSize.X >= 175 then
        local NewText = GameNameObj.Text
        local X = 0
        repeat 
            NewText = NewText:sub(0, -2)
            local GameNameTextSize = TextService:GetTextSize(NewText, 18, Enum.Font.Gotham, Vector2.new(410, math.huge))
            X = GameNameTextSize.X
        until X < 175
        for _ = 1, 2 do
            NewText = NewText:sub(0, -2)
        end
        GameNameObj.Text = NewText..'...'
    end

    HubNameObj.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Library:CreatePrompt('Text', 'Hub Name', HubName, 'Close')
        end
    end)

    GameNameObj.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Library:CreatePrompt('Text', 'Game Name', GameName, 'Close')
        end
    end)

    function UpdateTabButtonHolderSize()
        local ContentSize = TabButtonHolderListLayout.AbsoluteContentSize.Y
        TabButtonHolder.CanvasSize = UDim2.new(0, 170, 0, ContentSize)
    end
    
    TabButtonHolder.ChildAdded:Connect(UpdateTabButtonHolderSize)

    if not ImprovePerformance then
        task.spawn(function()
            while task.wait() do
                if ChangeTheme then
                    if not BreakAllLoops then
                        Utility:Tween(Container.Main, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                        Utility:Tween(Container.Main.PromptHolder, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                        Utility:Tween(Container.Main.Filler1, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                        Utility:Tween(Container.Main.Filler2, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.NamesBehind, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.Filler3, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.HubNameText, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.HubNameText, {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.GameNameText, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.GameNameText, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.SidebarLine1, {BackgroundColor3 = Theme.UIStrokeColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.SidebarLine2, {BackgroundColor3 = Theme.UIStrokeColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.TabButtonHolder, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.TabContainer, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                    else 
                        break
                    end
                end
            end
        end)
    end

    function ChangeThemeValue()
        task.spawn(function()
            ChangeTheme = true
            task.wait()
            ChangeTheme = false
        end)
    end

    function Library:ChangeTheme(NewTheme)
        if not ImprovePerformance then
            if type(NewTheme) == 'table' then
                Theme = NewTheme
                local NewTable = {}
                for Index, Value in next, Theme do
                    NewTable[Index] = Utility:SplitColor(Value)
                end
                writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                ChangeThemeValue()
            elseif type(NewTheme) == 'string' then
                NewTheme = NewTheme:lower()
                if NewTheme == 'custom' then
                    Theme = Themes['Custom']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'default' then
                    Theme = Themes['Default']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'lighter' then
                    Theme = Themes['Lighter']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'light' then
                    Theme = Themes['Light']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'light+' then
                    Theme = Themes['Light+']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'discord' then
                    Theme = Themes['Discord']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                end
            end
        end
    end
end

-- End of Visual UI Library | .gg/puxxCphTnK - Modified Version
