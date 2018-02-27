^!Left::Send   {Media_Prev}
^!Down::Send   {Media_Play_Pause}
^!Right::Send  {Media_Next}
+^!Left::Send  {Volume_Down}
+^!Down::Send  {Volume_Mute}
+^!Right::Send {Volume_Up}

^!F11::
    Run, mmsys.cpl
    WinWait,Sound
    ControlSend,SysListView321,{Down 2}
    ControlClick,&Set Default
    ControlClick,OK
    return
^!F12::
    Run, mmsys.cpl
    WinWait,Sound
    ControlSend,SysListView321,{Down}
    ControlClick,&Set Default
    ControlClick,OK
    return