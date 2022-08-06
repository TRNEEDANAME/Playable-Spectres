class X2EventListener_PA_Horror extends X2EventListener config(GameData_PASpectreAbility)

var const localized string HorrorActivated;
var protected const config WillEventRollData HorrorM1WillRollData;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	// Spectre Horror Listener
	Templates.AddItem(CreatePA_HorrorActivatedTemplate());

	return Templates;
}

static function X2EventListenerTemplate CreatePA_HorrorActivatedTemplate()
{
	local X2EventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EventListenerTemplate', Template, 'PA_HorrorActivated');

	Template.RegisterInTactical = true;
	Template.AddEvent('PA_HorrorActivated', OnHorrorActivated);

	return Template;
}

static protected function EventListenerReturn OnHorrorActivated(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateHistory History;
	local XComGameStateContext_WillRoll WillRollContext;
	local XComGameState_Unit TargetUnit;
	local XComGameStateContext_Ability AbilityContext;

	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if (AbilityContext != none && class'XComGameStateContext_Ability'.static.IsHitResultHit(AbilityContext.ResultContext.HitResult))
	{
		History = `XCOMHISTORY;

		TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));
		`assert(TargetUnit != none);

		if( class'XComGameStateContext_WillRoll'.static.ShouldPerformWillRoll(default.HorrorM1WillRollData, TargetUnit) )
		{
			WillRollContext = class'XComGameStateContext_WillRoll'.static.CreateWillRollContext(TargetUnit, 'PA_HorrorActivated', default.HorrorActivated, false);
			WillRollContext.DoWillRoll(default.HorrorM1WillRollData);
			WillRollContext.Submit();
		}
	}

	return ELR_NoInterrupt;
}