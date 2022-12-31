function Start()
    print("Mod Started")
end
function Update(Keycodes)
    if Sandbox.IsMouseDown(MouseButtons.Left) then
        Sandbox.SpawnObject("Gun", Sandbox.GetPlayerX() + 2, Sandbox.GetPlayerY())
    end
end
