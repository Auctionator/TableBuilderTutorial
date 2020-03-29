TableBuilderTutorialMixin = {}

function TableBuilderTutorialMixin:OnLoad()
  -- Initialize ScrollFrame (HybridScrollFrame.lua#11)
  HybridScrollFrame_OnLoad(self.ScrollFrame)
  -- Add buttons to the scroll frame using our template (HybridScrollFrame.lua#201)
  HybridScrollFrame_CreateButtons(self.ScrollFrame, "TBTTableRowTemplate")
  -- Keey scroll bar visible (HybridScrollFrame.lua#255)
  HybridScrollFrame_SetDoNotHideScrollBar(self.ScrollFrame, true)

  -- Create an instance of table builder - note that the ScrollFrame we reference
  -- mixes a TableBuilder implementation in
  self.tableBuilder = CreateTableBuilder(HybridScrollFrame_GetButtons(self.ScrollFrame))
  -- Set the frame that will be used for header columns for this tableBuilder
  self.tableBuilder:SetHeaderContainer(self.HeaderContainer)

  self:InitializeTable()
end

function TableBuilderTutorialMixin:OnShow()
  self:UpdateTable()
end

-- TODO I can't figure out where the magic is that causes this to be invoked...
-- I think its in one of the HybridScrollFrame_ methods that SetScript(OnUpdate...)?
function TableBuilderTutorialMixin:OnUpdate()
  self:UpdateTable()
end

local function dataProvider(index)
  return TableBuilderTutorial.Data[index]
end

function TableBuilderTutorialMixin:InitializeTable()
  print(
    LIGHTBLUE_FONT_COLOR:WrapTextInColorCode("TBT: InitializeTable()")
  )

  -- TableBuilder.lua#310
  self.tableBuilder:Reset()
  self.tableBuilder:SetDataProvider(dataProvider)
  self.tableBuilder:SetTableMargins(5)

  -- TableBuilder.lua#355 - Creates an instance of a TableBuildColumnMixin, inserts into its column set,
  -- and returns that column instance
  local column = self.tableBuilder:AddColumn()

  -- TableBuilder.lua#67 (templateType, templateName, ...[init parameters if needed]), then calls
  -- TableBuilder.lua#283 (table's version of ConstructHeader)
  column:ConstructHeader("BUTTON", "TBTColumnHeaderTemplate", "Animal", "a", "b", "c")
  -- TODO See what happens without doing this
  -- TableBuilder.lua#135
  column:ConstrainToHeader()
  -- TableBuilder.lua#77 (templateType, template, ...); ... provided to cell's Init method if it exists
  column:ConstructCells("FRAME", "TBTAnimalCellTemplate")

  -- TableBuilder.lua#301
  self.tableBuilder:Arrange()
end

function TableBuilderTutorialMixin:UpdateTable()
  local buttons = HybridScrollFrame_GetButtons(self.ScrollFrame)
  local buttonCount = #buttons
  local displayCount = #TableBuilderTutorial.Data
  local buttonHeight = buttons[1]:GetHeight()
  local visibleElementHeight = displayCount * buttonHeight

  local offset = HybridScrollFrame_GetOffset(self.ScrollFrame)
  local populateCount = math.min(buttonCount, displayCount)
  self.tableBuilder:Populate(offset, populateCount)

  for i = 1, buttonCount do
    local visible = i <= displayCount
    buttons[i]:SetShown(visible)
  end

  local regionHeight = self.ScrollFrame:GetHeight()
  HybridScrollFrame_Update(self.ScrollFrame, visibleElementHeight, regionHeight)
end