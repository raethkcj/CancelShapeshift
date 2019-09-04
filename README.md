# CancelShapeshift

A WoW Classic Addon to automatically cancel Druid forms and Shaman Ghost Wolf.

When in any form, just:
* Talk to an NPC
* Use an item
* Use an ability (disabled by default, see options to enable)

Options:
```
Use /cancelshapeshift or /cs
/cancelshapeshift onability -- Cancels shapeshift when using an ability (Default: false)
```
Instead of using this addon to cancel your form for abilities, I recommend making a macro like the following:
```
#showtooltip
/cancelform
/cast Flame Shock
```
Relying on the addon to cancel your form takes two button presses, while the macro will cancel your form and use the ability in one press. The addon is intended for convenience when talking to NPCs and using inventory items, not for using abilities in combat.

## Note: Remember to remove "-master" from the folder name when extracting to your Addons folder.
