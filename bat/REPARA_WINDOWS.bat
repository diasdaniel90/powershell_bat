chkdsk /r /f c:

sfc /scannow
Dism /Online /cleanup-image /spsuperseded
Dism /Online /Cleanup-Image /scanhealth
Dism /Online /Cleanup-Image /CheckHealth
Dism /Online /Cleanup-Image /RestoreHealth
Dism /Online /Cleanup-Image /AnalyzeComponentStore
Dism /online /Cleanup-Image /StartComponentCleanup
Dism /online /Cleanup-Image /StartComponentCleanup /ResetBase
Dism /online /Cleanup-Image /SPSuperseded
Dism /online /cleanup-image /revertpendingactions
schtasks.exe /Run /TN "\Microsoft\Windows\Servicing\StartComponentCleanup"

PAUSE
