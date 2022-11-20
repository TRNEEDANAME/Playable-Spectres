class X2Character_PlayableSpectres extends X2Character config(GameData_CharacterStats);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateTemplate_Spectre());

	Templates.AddItem(CreateTemplate_ShadowbindUnit('ShadowbindUnit'));

	return Templates;
}

static function X2CharacterTemplate CreateTemplate_Spectre()
{
	local X2CharacterTemplate CharTemplate;
	local LootReference Loot;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'PA_Spectre');
	CharTemplate.CharacterGroupName = 'Spectre';
	CharTemplate.DefaultLoadout = 'SpectreM1_Loadout';
	CharTemplate.BehaviorClass = class'XGAIBehavior';
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_Spectre.ARC_GameUnit_Spectre");



	CharTemplate.UnitSize = 1;

	// Traversal Rules
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = false;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = false;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = false;
	CharTemplate.bCanUse_eTraversal_DropDown = false;
	CharTemplate.bCanUse_eTraversal_Launch = true;
	CharTemplate.bCanUse_eTraversal_Flying = true;
	CharTemplate.bCanUse_eTraversal_Land = true;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.strMatineePackages[0] = "CIN_XP_Spectre";
	CharTemplate.strIntroMatineeSlotPrefix = "CIN_Spectre_Reveal";
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;
	CharTemplate.bSetGenderAlways = true;
	CharTemplate.bCanTakeCover = true;
	CharTemplate.MaxFlightPitchDegrees = 0;

	CharTemplate.bIsAlien = false;
	CharTemplate.bIsHumanoid = true;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = true;
	CharTemplate.bIsRobotic = true;
	CharTemplate.bIsSoldier = true;
	CharTemplate.bWeakAgainstTechLikeRobot = true;

	CharTemplate.DefaultSoldierClass = 'AlienSpectreClass';
	CharTemplate.DefaultLoadout = 'PA_SpectreLoadout';
	CharTemplate.RequiredLoadout = 'PA_SpectreLoadout';

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = false;

	CharTemplate.Abilities.AddItem('SpectreMoveBegin');
	CharTemplate.Abilities.AddItem('PA_Horror');

	CharTemplate.Abilities.AddItem('Loot');
	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('Knockout');
	CharTemplate.Abilities.AddItem('KnockoutSelf');
	CharTemplate.Abilities.AddItem('Panicked');
	CharTemplate.Abilities.AddItem('Berserk');
	CharTemplate.Abilities.AddItem('Obsessed');
	CharTemplate.Abilities.AddItem('Shattered');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');
	CharTemplate.Abilities.AddItem('SpectreImmunities');
	CharTemplate.Abilities.AddItem('Interact_AtmosphereComputer');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');
	CharTemplate.Abilities.AddItem('Interact_DLC2Transmitter');
	CharTemplate.Abilities.AddItem('Interact_PlantBomb');
	CharTemplate.Abilities.AddItem('Interact_TakeVial');
	CharTemplate.Abilities.AddItem('Interact_StasisTube');
	CharTemplate.Abilities.AddItem('Interact_MarkSupplyCrate');
	CharTemplate.Abilities.AddItem('Interact_ActivateAscensionGate');
	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.Abilities.AddItem('Revive');


	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_Alien;

	return CharTemplate;
}	

static function X2CharacterTemplate CreateTemplate_ShadowbindUnit(name CharTemplateName)
{
	local X2CharacterTemplate CharTemplate;

	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, CharTemplateName);

	CharTemplate.CharacterGroupName = 'Shadowbind';
	CharTemplate.BehaviorClass = class'XGAIBehavior';
	CharTemplate.strBehaviorTree = "CXShadowbind::CharacterRoot";
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_ShadowBind.ARC_ShadowBindUnit_M");
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_ShadowBind.ARC_ShadowBindUnit_F");
	CharTemplate.bNeverShowFirstSighted = true;

	CharTemplate.UnitSize = 1;

	// Traversal Rules
	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = true;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = true;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = true;
	CharTemplate.bCanUse_eTraversal_BreakWindow = true;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;
	CharTemplate.bSetGenderAlways = true;
	CharTemplate.bCanTakeCover = true;

	CharTemplate.bIsAlien = true;
	CharTemplate.bIsAdvent = false;
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = false;
	CharTemplate.bIsSoldier = false;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = true;

	CharTemplate.strScamperBT = "ScamperRoot_NoShotChance";

	CharTemplate.Abilities.AddItem('DarkEventAbility_Barrier');
	CharTemplate.Abilities.AddItem('ShadowUnitInitialize');
	CharTemplate.Abilities.AddItem('SpectreImmunities');
	CharTemplate.Abilities.AddItem('ShadowUnitSplit');

	CharTemplate.Abilities.AddItem('Loot');
	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');
	CharTemplate.Abilities.AddItem('Interact_AtmosphereComputer');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');
	CharTemplate.Abilities.AddItem('Interact_DLC2Transmitter');
	CharTemplate.Abilities.AddItem('Interact_PlantBomb');
	CharTemplate.Abilities.AddItem('Interact_TakeVial');
	CharTemplate.Abilities.AddItem('Interact_StasisTube');
	CharTemplate.Abilities.AddItem('Interact_MarkSupplyCrate');
	CharTemplate.Abilities.AddItem('Interact_ActivateAscensionGate');
	CharTemplate.Abilities.AddItem('CarryUnit');
	CharTemplate.Abilities.AddItem('PutDownUnit');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('HunkerDown');
	CharTemplate.Abilities.AddItem('Revive');

	return CharTemplate;
}