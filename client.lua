function SetPedsToCalm(exists, handle, iter)
  if exists then
    SetBlockingOfNonTemporaryEvents(handle, true)
    SetPedFleeAttributes(handle, 0, 0)
    SetPedCombatAttributes(handle, 17, 1)
    local exists, handle = FindNextPed(iter)
    SetPedsToCalm(exists, handle, iter)
  else
    EndFindPed(iter)
  end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local player = PlayerId()
    SetEveryoneIgnorePlayer(player, true)
    SetPoliceIgnorePlayer(player, true)
    SetDispatchCopsForPlayer(player, false)
    EnableDispatchService(1, false)
    EnableDispatchService(2, false)
    EnableDispatchService(3, false)
    EnableDispatchService(5, false)
    EnableDispatchService(8, false)
    EnableDispatchService(9, false)
    EnableDispatchService(10, false)
    EnableDispatchService(11, false)
    SetPlayerCanBeHassledByGangs(player, false)
    SetIgnoreLowPriorityShockingEvents(player, true)
    SetPlayerWantedLevel(player, 0, false)
    SetPlayerWantedLevelNow(player, false)
    SetPlayerWantedLevel(player, 0, false)
    local iter, handle = FindFirstPed()
    SetPedsToCalm(true, handle, iter)
  end
end)