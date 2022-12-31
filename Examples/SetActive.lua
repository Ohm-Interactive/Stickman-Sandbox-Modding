function Start()
    print("Mod Started")
end
function Update(Keycodes)
    if Sandbox.KeyPressed(Keycodes.LeftControl) then
        Sandbox.SetActive("Gun", false)
    end
end
