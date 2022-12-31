function Start()
    print("Mod Started")
    Sandbox.CreateItem(Sandbox.ModDirectory.."Example Mod/YouBastards.png", 312, 156)
    Sandbox.SpawnObject("Gun", 5, 0)
end
function Update(Keycodes)
    if Sandbox.KeyPressed(Keycodes.LeftControl) then
        Sandbox.Shoot("Gun")
    end
end
