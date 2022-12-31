function Start()
    print("Mod Started")
    Sandbox.CreateItem(Sandbox.ModDirectory.."Example Mod/YouBastards.png", 312, 156)
    Sandbox.SpawnItem("YouBastards", "Bastards", 20, 0, {ItemProperties.Physics})
end
function Update(Keycodes)
    if Sandbox.KeyPressed(Keycodes.LeftControl) then
        Sandbox.SetPosition("Bastards", 0, 0)
    end
end
