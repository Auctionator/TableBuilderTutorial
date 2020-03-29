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

function TableBuilderTutorialMixin:InitializeTable()

end