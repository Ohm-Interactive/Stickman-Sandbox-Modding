# Stickman Sandbox Modding documentation
Ever wanted to mod Stickman Sandbox, well, with this documentation, you will learn how!

So let's started!

# Basics
To start off with the basics, you need to create mod first. To do this make a folder in %AppData%/LocalLow/Ohm Interactive/Stickman Sandbox/Mods.

The name of the folder is the name of your mod. Then inside the folder, make a file called Main.lua. This is your actual mod.

Inside, make two functions called Start and Update like this:
```lua
function Start()
  print("Mod Started") -- Won't be displayed, for now...
end
function Update(Keycodes)
  print("Update")
end
```
This setups up your mod. Now if you run, nothing happens, so let's make this mod do something. One note, you must provide the Keycodes parameter in the update function.
You're game will probably crash if you don't do that.

Now inside the start function we can just spawn a object, like this.
```lua
function Start()
  print("Mod Started")
  Sandbox.SpawnObject("Gun", 0, 0)
end
```
This just spawns a gun at 0, 0. The SpawnObject function only works with objects the player can spawn in the spawn menu (with a few exceptions) for now.
You must also type the name of the object you want to spawn correctly, captials included.

Here is a list of objects you can use:
* Gun
* Enemy
* Box
* DamageSquare (Portable Lava)
* Parachute
* AK47
* Shotgun
* Bomb
* Hoverboard
* Comiclly Large Spoon
* EnemySpawner
* Bullet (only thing you can't spawn in the spawn menu)

Now let's make something more cooler. One note, to access most functions and variables within the API, you must use the Sandbox prefix before you use the function/variable as this is the API class.

Inside the Update function we can detect a simple keypress and spawn the object when that happens.
```lua
function Update(Keycodes)
  if Sandbox.KeyPressed(Keycodes.LeftControl) then
    Sandbox.SpawnObject("Gun", 0, 0)
  end
end
```
Now whenever you press the left control key, a gun spawns. The keycodes are the same as Unity's keycodes, so if you worked with Unity before, this should be easy.

#  Custom objects
