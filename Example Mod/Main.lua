local Bastards = {}
function Start()
    print("Mod Started")
    Sandbox.CreateItem(Sandbox.ModDirectory.."Test/YouBastards.png", 312, 156, function(this, playerHand)
        if playerHand == this then
            Sandbox.Shoot(this)
        end
    end)
    math.randomseed(os.time())
end
function Update(Keycodes)
    if Sandbox.KeyPressed(Keycodes.LeftControl) then
        Sandbox.SpawnItem("YouBastards", "Bastards"..#Bastards, math.random(0, 5), 0, {ItemProperties.Physics, ItemProperties.Gun}, {2, 0})
        Bastards[#Bastards+1] = 0
    end
end