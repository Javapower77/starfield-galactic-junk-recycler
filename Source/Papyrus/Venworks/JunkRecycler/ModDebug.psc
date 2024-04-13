ScriptName Venworks:JunkRecycler:ModDebug Extends ScriptObject

;;
;; MAJOR NOTE: ALL FUNCTIONS MUST BE GLOBAL WITHOUT CREATION KIT
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions
;;;
;; Call using: CGF "Venworks:JunkRecycler:VJR_Debug.FeatureFlags" 
Function FeatureFlags() Global
  Actor player = Game.GetPlayer()
  Perk VJR_PERK_Activator = Game.GetFormFromFile(0x00000800, "VenworksJunkRecycler.esm") as Perk

  String output = "Current Feature Flag Settings (1-On, 0=Off)\n\n"
  output += " Activator Perk = " + player.HasPerk(VJR_PERK_Activator) + "\n"

  Debug.MessageBox(output)
  Debug.Trace(output, 2)
EndFunction

;; Call using: CGF "Venworks:JunkRecycler:VJR_Debug.CheckFixPerk" 
Function CheckFixPerk() Global
  Perk VJR_PERK_Activator = Game.GetFormFromFile(0x00000800, "VenworksJunkRecycler.esm") as Perk
  Actor player = Game.GetPlayer()
  If (player.HasPerk(VJR_PERK_Activator))
    Debug.MessageBox("You already have the perk assigned if the workbenches are not showing the recycler please join and ask for help on the Venworks Discord Community.")
  Else
    player.AddPerk(VJR_PERK_Activator, True)
  EndIf
EndFunction

;; Call using: CGF "Venworks:JunkRecycler:VJR_Debug.ResetSettings" 
Function ResetSettings() Global
  CheckFixPerk()

  GlobalVariable VJR_BreakdownQuantity_TierA = Game.GetFormFromFile(0x00000807, "VenworksJunkRecycler.esm") as GlobalVariable
  GlobalVariable VJR_BreakdownQuantity_TierB = Game.GetFormFromFile(0x00000808, "VenworksJunkRecycler.esm") as GlobalVariable
  GlobalVariable VJR_BreakdownQuantity_TierC = Game.GetFormFromFile(0x00000809, "VenworksJunkRecycler.esm") as GlobalVariable
  GlobalVariable VJR_BreakdownQuantity_TierD = Game.GetFormFromFile(0x0000080A, "VenworksJunkRecycler.esm") as GlobalVariable

  VJR_BreakdownQuantity_TierA.SetValueInt(4)
  VJR_BreakdownQuantity_TierB.SetValueInt(2)
  VJR_BreakdownQuantity_TierC.SetValueInt(2)
  VJR_BreakdownQuantity_TierD.SetValueInt(1)

  GlobalVariable VJR_BreakdownChance_TierA = Game.GetFormFromFile(0x0000094f, "VenworksJunkRecycler.esm") as GlobalVariable
  GlobalVariable VJR_BreakdownChance_TierB = Game.GetFormFromFile(0x00000950, "VenworksJunkRecycler.esm") as GlobalVariable
  GlobalVariable VJR_BreakdownChance_TierC = Game.GetFormFromFile(0x00000951, "VenworksJunkRecycler.esm") as GlobalVariable
  GlobalVariable VJR_BreakdownChance_TierD = Game.GetFormFromFile(0x00000952, "VenworksJunkRecycler.esm") as GlobalVariable

  VJR_BreakdownChance_TierA.SetValueInt(25)
  VJR_BreakdownChance_TierB.SetValueInt(50)
  VJR_BreakdownChance_TierC.SetValueInt(80)
  VJR_BreakdownChance_TierD.SetValueInt(95)
EndFunction
