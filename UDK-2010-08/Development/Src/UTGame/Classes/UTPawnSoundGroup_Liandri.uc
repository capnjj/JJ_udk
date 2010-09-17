/**
 *
 * Copyright 1998-2010 Epic Games, Inc. All Rights Reserved.
 */

class UTPawnSoundGroup_Liandri extends UTPawnSoundGroup;

defaultproperties
{
	DodgeSound=SoundCue'A_Character_CorruptEnigma_Cue.Mean_Efforts.A_Effort_EnigmaMean_Dodge_Cue'
	DoubleJumpSound=SoundCue'A_Character_CorruptEnigma_Cue.Mean_Efforts.A_Effort_EnigmaMean_DoubleJump_Cue'
	LandSound=SoundCue'A_Character_CorruptEnigma_Cue.Mean_Efforts.A_Effort_EnigmaMean_LandLight_Cue'
	DefaultFootStepSound=SoundCue'A_Character_Footsteps.Footsteps.A_Character_Footstep_DefaultCue'
	DyingSound=SoundCue'A_Character_CorruptEnigma_Cue.Mean_Efforts.A_Effort_EnigmaMean_Death_Cue'
	HitSounds[0]=SoundCue'A_Character_CorruptEnigma_Cue.Mean_Efforts.A_Effort_EnigmaMean_PainSmall_Cue'
	HitSounds[1]=SoundCue'A_Character_CorruptEnigma_Cue.Mean_Efforts.A_Effort_EnigmaMean_PainMedium_Cue'
	HitSounds[2]=SoundCue'A_Character_CorruptEnigma_Cue.Mean_Efforts.A_Effort_EnigmaMean_PainLarge_Cue'
	FallingDamageLandSound=SoundCue'A_Character_CorruptEnigma_Cue.Mean_Efforts.A_Effort_EnigmaMean_LandHeavy_Cue'
	GibSound=SoundCue'A_Character_CorruptEnigma_Cue.Mean_Efforts.A_Effort_EnigmaMean_DeathInstant_Cue'

	CrushedSound=SoundCue'A_Character_BodyImpacts.BodyImpacts.A_Character_RobotImpact_BodyExplosion_Cue'
	BodyExplosionSound=SoundCue'A_Character_BodyImpacts.BodyImpacts.A_Character_RobotImpact_BodyExplosion_Cue'
	InstaGibSound=SoundCue'A_Character_CorruptEnigma_Cue.Mean_Efforts.A_Effort_EnigmaMean_DeathInstant_Cue'
}


//Sniper headshot caused robot head to be decapitated from body
//A_Character_BodyImpacts.BodyImpacts.A_Character_RobotImpact_Headshot_Cue