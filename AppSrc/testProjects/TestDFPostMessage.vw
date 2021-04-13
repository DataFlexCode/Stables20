Use DfAllEnt.pkg
Use DFPostMessage.pkg

Object oDFPostMessageTestView is a ModalPanel
    Set Size to 56 166
    Set Location to 12 6
    Set Label to "Test DFPostMessage method DFPostMessage.pkg"
    Set Border_Style to Border_Thick

    Object oButton1 is a Button
        Set Size to 14 148
        Set Location to 15 10
        Set Label to 'work work work'
    
        Procedure OnClick
            Send Close_Panel
        End_Procedure
    
    End_Object
    On_Key kCancel Send close_panel

    Procedure HelloWork
        Send Info_Box "Hello work"
    End_Procedure

    Procedure Activate_Scope
      Forward Send Activate_Scope
    End_Procedure
End_Object

Procedure Activate_oDFPostMessageTestView
    Send DFPostMessage (RefProc(HelloWork)) oDFPostMessageTestView
    Send Popup of oDFPostMessageTestView
End_Procedure