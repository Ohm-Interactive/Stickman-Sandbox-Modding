function Start()
    print("Mod Started")
    Sandbox.SpawnObject("Gun", 5, 0)
end
function Update(Keycodes)
    if Sandbox.KeyPressed(Keycodes.LeftControl) then
        Sandbox.Shoot("Gun")
    end
end
