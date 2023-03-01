class PA_SpectreTech extends X2StrategyElement config(PlayableAdvent);

var config int SpectreTech_Days;
var config int SpectreTech_SupplyCost;
var config int SpectreTech_CorpseCost;
var config int SpectreTech_CoreCost;
var config array<name> SpectreTech_RequiredTech;
var config name SpectreTech_RequiredCorpse;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	Techs.AddItem(CreatePA_Spectre_TechTemplate());
	
	return Techs;
}

static function X2DataTemplate CreatePA_Spectre_TechTemplate()
{

	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'PA_Spectre_Tech');
	Template.bProvingGround = true;
	Template.bRepeatable = true;
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Corpse_Spectre"; 
	Template.SortingTier = 1;
	Template.ResearchCompletedFn = ResearchCompleted;
	Template.PointsToComplete = class'X2StrategyElement_DefaultTechs'.static.StafferXDays(1, default.SpectreTech_Days);
	Template.Requirements.RequiredTechs.AddItem('AutopsySpectre');
	return Template;
}

function ResearchCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Unit UnitState;

	History = `XCOMHISTORY;
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	NewGameState.AddStateObject(XComHQ);
	UnitState = CreateUnit(NewGameState);
	NewGameState.AddStateObject(UnitState);
	XComHQ.AddToCrew(NewGameState, UnitState);
	UnitState.SetHQLocation(eSoldierLoc_Barracks);
	XcomHQ.HandlePowerOrStaffingChange(NewGameState);
}


static function XComGameState_Unit CreateUnit(XComGameState NewGameState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Unit UnitState;
	local X2CharacterTemplateManager CharTemplateManager;
	local X2CharacterTemplate CharTemplate;
	local XGCharacterGenerator CharGen;
	local string strFirst, strLast;

	History = `XCOMHISTORY;
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	CharTemplateManager = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();

	CharTemplate = CharTemplateManager.FindCharacterTemplate('PA_Spectre');
	UnitState = CharTemplate.CreateInstanceFromTemplate(NewGameState);
	
	CharGen = `XCOMGAME.spawn( class 'XGCharacterGenerator_PlayableSpectre' );
	CharGen.GenerateName(0, 'Country_Spark', strFirst, strLast);
	UnitState.SetCharacterName(strFirst, strLast, "");
	UnitState.SetCountry('Country_Spark');
	NewGameState.AddStateObject(UnitState);
	UnitState.kAppearance.iGender = 1;
	UnitState.StoreAppearance();
	return UnitState;
}
