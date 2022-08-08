while task.wait(0.1) do
    workspace:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("MAIN"):FireServer("a",tostring(tick()):rep(100))
    workspace:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("MAIN"):FireServer("b",tostring(tick()):rep(100))
end
