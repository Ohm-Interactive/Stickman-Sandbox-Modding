function Start()
    print("Mod Started")
end
function Update(Keycodes)
    if Sandbox.IsMouseDown(MouseButtons.Left) then
        Sandbox.SpawnObject("Gun", 5, 0)
    end
end
