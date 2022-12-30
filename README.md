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
Creating custom objects is also just as easy! Let's create a simple physics object as thoose are the basic type of object.

Inside the start function we can call the CreateItem class to initlize our object in the game.
```lua
Sandbox.CreateItem(Sandbox.ModDirectory.."Example Mod/YouBastards.png", 312, 156)
```
This creates a simple Custom Item that you can spawn whenever you want. Do keep in mind you need you're own image with the width and height in the function.
also Sandbox.ModDirectory is the directory where the mods folder is, so you need to add you're mod name to the path using 
```lua
Sandbox.ModDirectory.."(your mod name)/(file name)"
```
One more thing, the image I am using is this one:

![YouBastards](https://user-images.githubusercontent.com/81382687/210035391-9ec50195-da93-44b3-8f4c-96fa22677432.png)

You can use it if you want too.

Now to spawn in your custom item, you can use the SpawnItem function. We can also modify our gun spawning program to spawn our custom item.

```lua
function Update(Keycodes)
    if Sandbox.KeyPressed(Keycodes.LeftControl) then
        Sandbox.SpawnItem("YouBastards", "Bastards", 0, 0, {ItemProperties.Physics})
    end
end
```
This creates our custom object at 0, 0 with a ItemProperty called Physics. This just makes it a physics object. You can also replace ItemProperties.Physics with 0.

But it is just better to use the ItemProperties enum. Also, in this function, we give the name of custom item as well as what you want the spawned item to be called.
The item name is just the image name without the file extension and the Scene Name is just what you want it to be called in the scene.

It is recommened that each Scene Name is different, here's how you can do this.

```lua
local Bastards = {}
function Update(Keycodes)
    if Sandbox.KeyPressed(Keycodes.LeftControl) then
        Sandbox.SpawnItem("YouBastards", "Bastards"..#Bastards, 0, 0, {ItemProperties.Physics})
        Bastards[#Bastards+1] = 0
    end
end
```
Here we make a list called Bastards which is just used to determine how many objects of the YouBastards item are in the scene. Then we name the items according to how
long it is.

One more thing that you can do with the SpawnItem function is make your custom item a gun. It is as simple as adding the Gun ItemProperty and some extra parameters
for the gun.
Here is how you can do this
```lua
Sandbox.SpawnItem("YouBastards", "Bastards"..#Bastards, 0, 0, {ItemProperties.Physics, ItemProperties.Gun}, {2, 0})
```
The extra properties are 2 and 0. 2 is the delay in which firing the gun has. Here are the delays for other guns in the game.
* Pistol: 0.3
* AK47: 0.1
* Shotgun: 0.6

It is good pratice to keep this value below 1, but you can make it higher than 1 if you want to.
Now the 0 property if it is a shotgun or not. This basically means, will it fire 2 bullets instead of one. If you set this to 0, it is a normal gun, if you set it to
1 it is a shotgun
# Custom Object Functions
Now one cool feature about custom objects, is that you can have custom functions for them!
To do this is simple. For a example, we will make it so if the player is holding our custom object, it will auto shoot for us.

```lua
Sandbox.CreateItem(Sandbox.ModDirectory.."Example Mod/YouBastards.png", 312, 156, function(this, playerHand)
  if playerHand == this then
    Sandbox.Shoot(this)
  end
end)
```
Here we create an anonymous function with the parameters of this and playerHand, you must include these parameters or else you're game will likly crash.
The script basically checks if the playerHand (which is the currentlyHolding GameObject in the code) is equal to this object.

If so, then start shooting. To make the gun shoot, we use Shoot function. This makes any object that is a gun shoot. Pretty simple.

# Conclusion
Overall, modding this game is pretty easy. There are even more functions that were not listed here, you can go into the Mods folder in this repo to find examples of them. Since I'm tired of documenting this already. Well, hope you have fun with modding!
