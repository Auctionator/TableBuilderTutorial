TableBuilderTutorial = {
  Data = { }
}

local ANIMALS = { "Paradoxure", "Painted stork", "Ring-necked pheasant", "Phalarope, red", "Southern white-crowned shrike", "Duck, blue", "Madagascar hawk owl", "African clawless otter", "Crested bunting", "Squirrel, smith's bush", "Albatross, waved", "Hen, sage", "Nubian bee-eater", "American black bear", "Squirrel, malabar", "Bear, grizzly", "Flicker, field", "Bee-eater, nubian", "Lion, steller sea", "Sacred ibis", "Hottentot teal", "Long-necked turtle", "Duck, blue", "Sloth, hoffman's", "African black crake", "Salmon pink bird eater tarantula", "Russian dragonfly", "Cobra, cape", "Eastern box turtle", "Eagle, crowned" }
local SCIENTIFIC = { "Paradoxurus hermaphroditus", "Mycteria leucocephala", "Phasianus colchicus", "Phalaropus fulicarius", "Eurocephalus anguitimens", "Hymenolaimus malacorhynchus", "Ninox superciliaris", "Aonyx capensis", "Melophus lathami", "Paraxerus cepapi", "Diomedea irrorata", "Centrocercus urophasianus", "Merops nubicus", "Ursus americanus", "Ratufa indica", "Ursus arctos", "Colaptes campestroides", "Merops nubicus", "Eumetopias jubatus", "Threskionis aethiopicus", "Anas punctata", "Chelodina longicollis", "Hymenolaimus malacorhynchus", "Choloepus hoffmani", "Limnocorax flavirostra", "Lasiodora parahybana", "Libellula quadrimaculata", "Naja nivea", "Terrapene carolina", "Spizaetus coronatus", }
local BUZZWORD = { "Polarised", "Programmable", "Multi-channelled", "interactive", "zero tolerance", "open system", "Assimilated", "Versatile", "initiative", "6th generation", "multimedia", "matrices", "Upgradable", "incremental", "policy", "flexibility", "eco-centric", "systematic", "Reduced", "stable", "6th generation", "alliance", "initiative", "adapter", "secured line", "Self-enabling", "heuristic", "projection", "zero administration", "attitude", }

for index, value in ipairs(ANIMALS) do
  TableBuilderTutorial.Data[index] = {
    value,
    SCIENTIFIC[index],
    BUZZWORD[index]
  }
end


