class X2Item_PAS_Armors extends X2Item config (PAS_ArmorCost);

var config int Plated_Spectre_Black_V;
var config array<name> Plated_Spectre_R_Tech;
var config array<name> Plated_Spectre_Buid_Cost_Type;
var config array<int> Plated_Spectre_Build_Cost_Quan;
var config int Plated_Spectre_Inge_Score;

var config int Powered_Spectre_Black_V;
var config array<name> Powered_Spectre_R_Tech;
var config array<name> Powered_Spectre_Buid_Cost_Type;
var config array<int> Powered_Spectre_Build_Cost_Quan;
var config int Powered_Spectre_Inge_Score;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Armors;

    Armors.AddItem(CreateSpectreArmor());
	Armors.AddItem(CreatePlatedSpectreArmor());
	Armors.AddItem(CreatePoweredSpectreArmor());

	return Armors;
}

static function X2DataTemplate CreateSpectreArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'SpectreArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorConv";
	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.ArmorTechCat = 'conventional';
	Template.ArmorCat = 'Spectre_ArmorCat';
	Template.Tier = 0;
	Template.AkAudioSoldierArmorSwitch = 'Conventional';
	Template.EquipSound = "StrategyUI_Armor_Equip_Conventional";

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 0, true);

	return Template;
}


static function X2DataTemplate CreatePlatedSpectreArmor()
{
	local X2ArmorTemplate Template;
	local ArtifactCost	Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PlatedSpectreArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorPlat";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 20;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('MediumPlatedArmorStats');
	Template.ArmorTechCat = 'plated';
	Template.ArmorCat = 'Spectre_ArmorCat';
	Template.Tier = 150;
	Template.AkAudioSoldierArmorSwitch = 'Predator';
	//Template.EquipNarrative = "X2NarrativeMoments.Strategy.CIN_ArmorIntro_PlatedMedium";
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.MEDIUM_PLATED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, 1);

	if (default.Plated_Spectre_Inge_Score > 0) Template.Requirements.RequiredEngineeringScore = default.Plated_Spectre_Inge_Score;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.Plated_Spectre_Black_V;

	Template.Requirements.RequiredSoldierClass = 'SpectreClass';
	Template.Requirements.RequiredTechs = default.Plated_Spectre_R_Tech;


			for (i = 0; i < default.Plated_Spectre_Buid_Cost_Type.Length; i++)
			{
				if (default.Plated_Spectre_Build_Cost_Quan[i] > 0)
				{
	Resources.ItemTemplateName = default.Plated_Spectre_Build_Type[i];
	Resources.Quantity = default.Plated_Spectre_Build_Cost_Quan[i];
	Template.Cost.ResourceCosts.AddItem(Resources);
				}
			}

	return Template;
}

static function X2DataTemplate CreatePoweredSpectreArmor()
{
	local X2ArmorTemplate Template;
	local ArtifactCost	Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PoweredSpectreArmor');
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_HORArmorPowr";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 60;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('MediumPoweredArmorStats');
	Template.ArmorTechCat = 'powered';
	Template.ArmorCat = 'Spectre_ArmorCat';
	Template.Tier = 160;
	Template.AkAudioSoldierArmorSwitch = 'Warden';
	//Template.EquipNarrative = "X2NarrativeMoments.Strategy.CIN_ArmorIntro_PoweredMedium";
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered";
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.Powered_Spectre_Black_V;

	if (default.Powered_Spectre_Inge_Score > 0) Template.Requirements.RequiredEngineeringScore = default.Powered_Spectre_Inge_Score;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.MEDIUM_POWERED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_ItemGrantedAbilitySet'.default.MEDIUM_POWERED_MITIGATION_AMOUNT);

	Template.Requirements.RequiredSoldierClass = 'SectoidClass';
	Template.Requirements.RequiredTechs = default.Powered_Spectre_R_Tech;

			for (i = 0; i < default.Powered_Spectre_Buid_Cost_Type.Length; i++)
			{
				if (default.Powered_Spectre_Build_Cost_Quan[i] > 0)
				{
	Resources.ItemTemplateName = default.Powered_Spectre_Build_Type[i];
	Resources.Quantity = default.Powered_Spectre_Build_Cost_Quan[i];
	Template.Cost.ResourceCosts.AddItem(Resources);
				}
			}

	return Template;
}