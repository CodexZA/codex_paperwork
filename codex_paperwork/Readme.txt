Inside any robbery or system that checks for active police count, change this:


if job.name == "police" then
    policeCount += 1
end





to this:





local isPaperwork = exports['qb-paperwork']:IsPaperworkMode(playerId)
if job.name == "police" and not isPaperwork then
    policeCount += 1
end