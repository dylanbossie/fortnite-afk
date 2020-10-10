# fortnite-afk

Tool to automate afk'ing in Fortnite solo Creative lobbies through the use of AutoIt3. Also includes a tool to get a pixel area checksum for updating regions if the checksums change for any reason.

Tracks game states by checking unique pixel regions of different interfaces to reactively enter and exit solo Creative lobbies. The defined regions are set to values that work for my monitor/resolution, but likely need updating for any other use case.

This afk farming method relies on the passive XP gain from sitting in the Creative hub. Ticks of 6300 XP are given at storm countdown times of 3:39, 3:24, 3:09, 2:54 and 2:39. The tool will enter a lobby, wait for the appropriate amount of ticks, then restart indefinitely.
