Config = {}

Config.AmbulanceBag = "ems_bag_object"

Config.AnimationScenario = "CODE_HUMAN_MEDIC_TEND_TO_DEAD"

Config.useTarget = true -- if you don't use qb or ox target then set this to false

-- !!! Just edit the keys if you don't use a target system and use other keys https://docs.fivem.net/docs/game-references/controls/
Config.OpenMenuKey = 38 -- E
Config.OpenMenuKeyString = 'INPUT_PICKUP'
Config.TakeKey = 23 -- F
Config.TakeKeyString = 'INPUT_ENTER'

Config.allowedJobs = {
    ["ambulance"] = 0
}

Config.Stash = {
	maxweight = 80000,
	slots = 25,
}

Config.progressBarType = 'default' -- set this to 'ox' if you want to use the ox progress ciclye instead of esx progressbar

-- !!!! "Open Bag Inventory" button already in the menu! still add here items what you want add to inventory if player click on it 
Config.MenuItems = {
	{
		item ='blood500ml',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-tint',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='blood250ml',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-tint',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='saline500ml',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-flask',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item = 'saline250ml',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-flask',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='revivekit',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-heartbeat',
		iconColor = '#800000',
		add_amount = 1
	},
	{
		item ='tourniquet',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-bandage',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='ifak',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-first-aid',
		iconColor = '#800000',
		add_amount = 1
	},
	{
		item ='elastic_bandage',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-ribbon',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='quick_clot',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-pills',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='packing_bandage',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-first-aid',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='field_dressing',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-first-aid',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='sewing_kit',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-kit-medical',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='epinephrine',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-syringe',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='morphine',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-syringe',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='painkillers',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-capsules',
		iconColor = '#800000',
		add_amount = 5
	},
	{
		item ='bodybag',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-skull',
		iconColor = '#800000',
		add_amount = 1
	},
	{
		item ='radio',
		description = false, -- set string for own value or left false for default locale string for "take itemlabel" string
		icon = 'fa-solid fa-radio',
		iconColor = '#800000',
		add_amount = 1
	},
}
