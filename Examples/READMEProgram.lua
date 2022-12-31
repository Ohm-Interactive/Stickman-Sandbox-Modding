function Start()
    print("Mod Started")
    Sandbox.CreateItem(Sandbox.ModDirectory.."Example Mod/YouBastards.png", 312, 156, function(this, playerHand)
        if playerHand == this then
          Sandbox.Shoot(this)
        end
    end)
end
local Bastards = {}
function Update(Keycodes)
    if Sandbox.KeyPressed(Keycodes.LeftControl) then
        Sandbox.SpawnItem("YouBastards", "Bastards"..#Bastards, 0, 0, {ItemProperties.Physics, ItemProperties.Gun}, {2, 0})
        Bastards[#Bastards+1] = 0
    end
end
