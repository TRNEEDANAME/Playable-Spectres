class X2Item_PASpectre_Weapons extends X2Item config(GameData_WeaponsData);

var config WeaponDamageValue PA_SpectreGun_BaseDamage;
var config array<WeaponDamageValue> PA_SpectrePsiAmp_ExtraDamage;
var config array<int> PA_SpectreGun_RangeAccuracy;

var config bool PA_SpectreGun_InfiniteAmmo;

var config int PA_SpectreGun_Aim;
var config int PA_SpectreGun_CritChance;
var config int PA_SpectreGun_ClipSize;
var config int PA_SpectreGun_SoundRange;
var config int PA_SpectreGun_EnvironmentDamage;
var config int PA_SpectreGun_IdealRange;
var config int PA_SpectreGun_NumUpgradeSlots;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	// Spectres Weapon

	Weapons.AddItem(CreateTemplate_PA_SpectreGun());
	Weapons.AddItem(CreateTemplate_PA_SpectrePsiAmp());

	return Weapons;
}

static function X2DataTemplate CreateTemplate_PA_SpectreGun()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_SpectreGun');

	Template.WeaponPanelImage = "_MagneticRifle";
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_SpectreGunCat';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.ViperRifle";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);

	Template.RangeAccuracy = default.PA_SpectreGun_RangeAccuracy;
	Template.BaseDamage = default.PA_SpectreGun_BaseDamage;
	Template.Aim = default.PA_SpectreGun_Aim;
	Template.CritChance = default.PA_SpectreGun_CritChance;
	Template.iClipSize = default.PA_SpectreGun_ClipSize;
	Template.iSoundRange = default.PA_SpectreGun_SoundRange;
	Template.iEnvironmentDamage = default.PA_SpectreGun_EnvironmentDamage;
	Template.iIdealRange = default.PA_SpectreGun_IdealRange;

	Template.NumUpgradeSlots = default.PA_SpectreGun_NumUpgradeSlots;

	Template.DamageTypeTemplateName = 'Heavy';

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.GameArchetype = "WP_SpectreRifle.WP_SpectreRifle";
	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;
	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.InfiniteAmmo = default.PA_SpectreGun_InfiniteAmmo;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateTemplate_PA_SpectrePsiAmp()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_SpectrePsiAmp');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_SpectrePsiCat';
	Template.WeaponTech = 'alien';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Psi_Amp";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.ExtraDamage = default.PA_SpectrePsiAmp_ExtraDamage;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Psi';

	Template.Abilities.AddItem('PA_Horror');
	Template.Abilities.AddItem('Horror');

	return Template;
}