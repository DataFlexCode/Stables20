Use Windows.pkg
Use DFClient.pkg
Use cHttpTransfer.pkg
Use cTextEdit.pkg
Use UrlFunctions.pkg

Use TestProjects\ParsedHtmlDocuments.vw
Use cHtmlScraper.pkg

Activate_View Activate_oTestStandardHttpRequest for oTestStandardHttpRequest
Object oTestStandardHttpRequest is a View

    Set Border_Style to Border_Normal
    Set Size to 288 383
    Set Location to 1 2
    Set Label to "HTML parser (HtmlParserFunctions.pkg)"
    Set piMinSize to 288 383
    On_Key kCancel Send close_panel

    Object opsRemoteHost is a Form
        Set Size to 14 98
        Set Location to 20 27
        Set Label to "psRemoteHost:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
        On_Key KEnter Send DoParse
    End_Object

    Object opbShowErrorDialog is a CheckBox
        Set Size to 14 50
        Set Location to 250 37
        Set Label to "pbShowErrorDialog"
    End_Object

    Object opsAcceptTypes is a Form
        Set Size to 14 100
        Set Location to 73 27
        Set Label to "psAcceptTypes:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
    End_Object

    Object opsProtocolVersion is a Form
        Set Size to 14 100
        Set Location to 73 135
        Set Label to "psProtocolVersion:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
    End_Object

    Object opsSaveAsFile is a Form
        Set Size to 14 100
        Set Location to 73 244
        Set Label to "psSaveAsFile:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
    End_Object

    Object opiRemotePort is a Form
        Set Size to 14 79
        Set Location to 45 27
        Set Label to "piRemotePort:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
    End_Object

    Object opsPassword is a Form
        Set Size to 14 100
        Set Location to 46 244
        Set Label to "psPassword:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
    End_Object
    Object opsUserName is a Form
        Set Size to 14 100
        Set Location to 46 135
        Set Label to "psUserName:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
    End_Object

    Object opsProxy is a Form
        Set Size to 14 100
        Set Location to 100 135
        Set Label to "psProxy:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
    End_Object
    Object opsAgent is a Form
        Set Size to 14 100
        Set Location to 100 27
        Set Label to "psAgent:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
    End_Object

    Object opiBufferSize is a Form
        Set Size to 14 100
        Set Location to 100 244
        Set Label to "piBufferSize:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
    End_Object

    Object oTransferFlags is a Group
        Set Size to 121 321
        Set Location to 122 28
        Set Label to "peTransferFlags:"

        Object oFlag01 is a CheckBox
            Set Size to 14 50
            Set Location to 104 9
            Set Label to "ifReload"
            Property Integer piContribution ifReload
        End_Object
        Object oFlag02 is a CheckBox
            Set Size to 14 50
            Set Location to 89 9
            Set Label to "ifNoCacheWrite"
            Property Integer piContribution ifNoCacheWrite
        End_Object
        Object oFlag03 is a CheckBox
            Set Size to 14 50
            Set Location to 73 9
            Set Label to "ifMakePersistent"
            Property Integer piContribution ifMakePersistent
        End_Object
        Object oFlag04 is a CheckBox
            Set Size to 14 50
            Set Location to 27 9
            Set Label to "ifFromCache"
            Property Integer piContribution ifFromCache
        End_Object
        Object oFlag05 is a CheckBox
            Set Size to 14 50
            Set Location to 42 9
            Set Label to "ifSecure"
            Property Integer piContribution ifSecure
        End_Object
        Object oFlag06 is a CheckBox
            Set Size to 14 50
            Set Location to 58 9
            Set Label to "ifKeepConnection"
            Property Integer piContribution ifKeepConnection
        End_Object
        Object oFlag07 is a CheckBox
            Set Size to 14 50
            Set Location to 12 9
            Set Label to "ifNoAutoRedirect"
            Property Integer piContribution ifNoAutoRedirect
        End_Object
        Object oFlag08 is a CheckBox
            Set Size to 14 50
            Set Location to 104 89
            Set Label to "ifReadPrefetch"
            Property Integer piContribution ifReadPrefetch
        End_Object
        Object oFlag09 is a CheckBox
            Set Size to 14 50
            Set Location to 89 89
            Set Label to "ifNoCookies"
            Property Integer piContribution ifNoCookies
        End_Object
        Object oFlag10 is a CheckBox
            Set Size to 14 50
            Set Location to 73 89
            Set Label to "ifNoAuth"
            Property Integer piContribution ifNoAuth
        End_Object
        Object oFlag11 is a CheckBox
            Set Size to 14 50
            Set Location to 58 89
            Set Label to "ifCacheIfNetFail"
            Property Integer piContribution ifCacheIfNetFail
        End_Object
        Object oFlag12 is a CheckBox
            Set Size to 14 50
            Set Location to 42 89
            Set Label to "ifIgnoreRedirectToHttp"
            Property Integer piContribution ifIgnoreRedirectToHttp
        End_Object
        Object oFlag13 is a CheckBox
            Set Size to 14 50
            Set Location to 27 89
            Set Label to "IfIgnoreRedirectToHttps"
            Property Integer piContribution IfIgnoreRedirectToHttps
        End_Object
        Object oFlag14 is a CheckBox
            Set Size to 14 50
            Set Location to 12 89
            Set Label to "IfIgnoreCertDateInvalid"
            Property Integer piContribution IfIgnoreCertDateInvalid
        End_Object
        Object oFlag15 is a CheckBox
            Set Size to 14 50
            Set Location to 104 193
            Set Label to "IfIgnoreCertCnInvalid"
            Property Integer piContribution IfIgnoreCertCnInvalid
        End_Object
        Object oFlag16 is a CheckBox
            Set Size to 14 50
            Set Location to 89 193
            Set Label to "ifResynchronize"
            Property Integer piContribution ifResynchronize
        End_Object
        Object oFlag17 is a CheckBox
            Set Size to 14 50
            Set Location to 73 193
            Set Label to "ifHyperlink"
            Property Integer piContribution ifHyperlink
        End_Object
        Object oFlag18 is a CheckBox
            Set Size to 14 50
            Set Location to 58 193
            Set Label to "ifNoUi"
            Property Integer piContribution ifNoUi
        End_Object
        Object oFlag19 is a CheckBox
            Set Size to 14 50
            Set Location to 42 193
            Set Label to "ifPragmaNocache"
            Property Integer piContribution ifPragmaNocache
        End_Object
        Object oFlag20 is a CheckBox
            Set Size to 14 50
            Set Location to 27 193
            Set Label to "ifCacheAsync"
            Property Integer piContribution ifCacheAsync
        End_Object
        Object oFlag21 is a CheckBox
            Set Size to 14 50
            Set Location to 12 193
            Set Label to "ifFormsSubmit"
            Property Integer piContribution ifFormsSubmit
        End_Object
        Object oFlag22 is a CheckBox
            Set Size to 14 50
            Set Location to 12 265
            Set Label to "ifNeedFile"
            Property Integer piContribution ifNeedFile
        End_Object
        Function Combined_Value returns integer
            Integer iRval
            If (checked_state(oFlag01)) ;
                            Move (iRval+piContribution(oFlag01)) to iRval
            If (checked_state(oFlag02)) ;
                            Move (iRval+piContribution(oFlag02)) to iRval
            If (checked_state(oFlag03)) ;
                            Move (iRval+piContribution(oFlag03)) to iRval
            If (checked_state(oFlag04)) ;
                            Move (iRval+piContribution(oFlag04)) to iRval
            If (checked_state(oFlag05)) ;
                            Move (iRval+piContribution(oFlag05)) to iRval
            If (checked_state(oFlag06)) ;
                            Move (iRval+piContribution(oFlag06)) to iRval
            If (checked_state(oFlag07)) ;
                            Move (iRval+piContribution(oFlag07)) to iRval
            If (checked_state(oFlag08)) ;
                            Move (iRval+piContribution(oFlag08)) to iRval
            If (checked_state(oFlag09)) ;
                            Move (iRval+piContribution(oFlag09)) to iRval
            If (checked_state(oFlag10)) ;
                            Move (iRval+piContribution(oFlag10)) to iRval
            If (checked_state(oFlag11)) ;
                            Move (iRval+piContribution(oFlag11)) to iRval
            If (checked_state(oFlag12)) ;
                            Move (iRval+piContribution(oFlag12)) to iRval
            If (checked_state(oFlag13)) ;
                            Move (iRval+piContribution(oFlag13)) to iRval
            If (checked_state(oFlag14)) ;
                            Move (iRval+piContribution(oFlag14)) to iRval
            If (checked_state(oFlag15)) ;
                            Move (iRval+piContribution(oFlag15)) to iRval
            If (checked_state(oFlag16)) ;
                            Move (iRval+piContribution(oFlag16)) to iRval
            If (checked_state(oFlag17)) ;
                            Move (iRval+piContribution(oFlag17)) to iRval
            If (checked_state(oFlag18)) ;
                            Move (iRval+piContribution(oFlag18)) to iRval
            If (checked_state(oFlag19)) ;
                            Move (iRval+piContribution(oFlag19)) to iRval
            If (checked_state(oFlag20)) ;
                            Move (iRval+piContribution(oFlag20)) to iRval
            If (checked_state(oFlag21)) ;
                            Move (iRval+piContribution(oFlag21)) to iRval
            If (checked_state(oFlag22)) ;
                            Move (iRval+piContribution(oFlag22)) to iRval
            Function_Return iRval
        End_Function
        Procedure set Combined_Value integer iValue
          Set Checked_State of oFlag01 to (piContribution(oFlag01) IAND iValue)
          Set Checked_State of oFlag02 to (piContribution(oFlag02) IAND iValue)
          Set Checked_State of oFlag03 to (piContribution(oFlag03) IAND iValue)
          Set Checked_State of oFlag04 to (piContribution(oFlag04) IAND iValue)
          Set Checked_State of oFlag05 to (piContribution(oFlag05) IAND iValue)
          Set Checked_State of oFlag06 to (piContribution(oFlag06) IAND iValue)
          Set Checked_State of oFlag07 to (piContribution(oFlag07) IAND iValue)
          Set Checked_State of oFlag08 to (piContribution(oFlag08) IAND iValue)
          Set Checked_State of oFlag09 to (piContribution(oFlag09) IAND iValue)
          Set Checked_State of oFlag10 to (piContribution(oFlag10) IAND iValue)
          Set Checked_State of oFlag11 to (piContribution(oFlag11) IAND iValue)
          Set Checked_State of oFlag12 to (piContribution(oFlag12) IAND iValue)
          Set Checked_State of oFlag13 to (piContribution(oFlag13) IAND iValue)
          Set Checked_State of oFlag14 to (piContribution(oFlag14) IAND iValue)
          Set Checked_State of oFlag15 to (piContribution(oFlag15) IAND iValue)
          Set Checked_State of oFlag16 to (piContribution(oFlag16) IAND iValue)
          Set Checked_State of oFlag17 to (piContribution(oFlag17) IAND iValue)
          Set Checked_State of oFlag18 to (piContribution(oFlag18) IAND iValue)
          Set Checked_State of oFlag19 to (piContribution(oFlag19) IAND iValue)
          Set Checked_State of oFlag20 to (piContribution(oFlag20) IAND iValue)
          Set Checked_State of oFlag21 to (piContribution(oFlag21) IAND iValue)
          Set Checked_State of oFlag22 to (piContribution(oFlag22) IAND iValue)
        End_Procedure
    End_Object

    Object oSubmitBtn is a Button
        Set Size to 14 73
        Set Location to 248 275
        Set Label to "Request and parse"
        
        Object oTest is a cHtmlParserFunctions
        End_Object
        
        Procedure ShowHeaders
            Integer iItem iMax
            String sValue
            Move (SizeOfArray(aMsResponseHeaders)) to iMax
            Decrement iMax
            For iItem from 0 to iMax
                Get ResponseHeader of oHttpTransfer aMsResponseHeaders[iItem].sTag 0 to sValue
                If (sValue<>"") Begin
                    Showln aMsResponseHeaders[iItem].sTag " - " aMsResponseHeaders[iItem].sDescription 
                    Showln sValue
                    Showln ""
                End
            Loop
        End_Procedure

        // fires when the button is clicked
        Procedure OnClick
            Integer bOk iChannel
            String sFilePath sLink
            String sTextValue
            tUrl stUrl
            tHtmlDocument stDoc
            Send SetProperties
            If (psSaveAsFile(oHttpTransfer)="") ;
                    Send Info_Box "psSaveAsFile is empty. Therefore text-response will be written to a window (instead of a file, which is probably what you wanted)." "Oh no! Not again"
            Get Value of oFilePath to sFilePath
            Get HTTPGetRequest of oHttpTransfer sFilePath to bOk
            If bOk Begin
                Send ShowHeaders
                Get value of opsRemoteHost to stUrl.sHost
                Get value of oFilePath     to stUrl.sPath
                Get value of opiRemotePort to stUrl.sPort
                Get value of opsPassword   to stUrl.sPassword
                Get value of opsUserName   to stUrl.sUser
                Get ParseDocumentFromFile of oTest (psSaveAsFile(oHttpTransfer)) to stDoc
                Get Compose of oUrlFunctions stUrl to stDoc.sUrl
                Send Add_Document of oParsedHtmlDocuments stDoc
                Send Activate_oParsedHtmlDocuments
            End
            Else ;
                    Send Info_Box ("LastErrorCode: "+String(LastErrorCode(oHttpTransfer))) "Error"
        End_Procedure

    End_Object

    Object oHttpTransfer is a cHttpTransfer
        Procedure OnDataReceived String sContentType String sData
            // You can abort file transfer here with 'Send CancelTransfer'
            Showln "sContentType:" 
            Showln sContentType
            Showln "sData:"
            Showln sData
        End_Procedure
    End_Object

    Object oFilePath is a Form
        Set Size to 14 210
        Set Location to 20 135
        Set Label to "FilePath:"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
    End_Object

    Procedure DisplayProperties
        set value of opsRemoteHost      to (psRemoteHost(oHttpTransfer))
        set checked_state of opbShowErrorDialog to (pbShowErrorDialog(oHttpTransfer))
        set value of opsAcceptTypes     to (psAcceptTypes(oHttpTransfer))
        set value of opsProtocolVersion to (psProtocolVersion(oHttpTransfer))
        set value of opsSaveAsFile      to (psSaveAsFile(oHttpTransfer))
        set value of opiRemotePort      to (piRemotePort(oHttpTransfer))
        set value of opsPassword        to (psPassword(oHttpTransfer))
        set value of opsUserName        to (psUserName(oHttpTransfer))
        set value of opsProxy           to (psProxy(oHttpTransfer))
        set value of opsAgent           to (psAgent(oHttpTransfer))
        set value of opiBufferSize      to (piBufferSize(oHttpTransfer))
        set Combined_Value of oTransferFlags to (peTransferFlags(oHttpTransfer))
    End_Procedure

    Procedure SetProperties
        set psRemoteHost      of oHttpTransfer to (value(opsRemoteHost))
        set pbShowErrorDialog of oHttpTransfer to (checked_state(opbShowErrorDialog))
        set psAcceptTypes     of oHttpTransfer to (value(opsAcceptTypes))
        set psProtocolVersion of oHttpTransfer to (value(opsProtocolVersion))
        set psSaveAsFile      of oHttpTransfer to (value(opsSaveAsFile))
        set piRemotePort      of oHttpTransfer to (value(opiRemotePort))
        set psPassword        of oHttpTransfer to (value(opsPassword))
        set psUserName        of oHttpTransfer to (value(opsUserName))
        set psProxy           of oHttpTransfer to (value(opsProxy))
        set psAgent           of oHttpTransfer to (value(opsAgent))
        set piBufferSize      of oHttpTransfer to (value(opiBufferSize))
        set peTransferFlags   of oHttpTransfer to (Combined_Value(oTransferFlags))
    End_Procedure
    
    Procedure AdoptUrl tUrl sUrl
        Set value of opsRemoteHost to sUrl.sHost
        Set value of oFilePath     to sUrl.sPath
        Set value of opiRemotePort to sUrl.sPort 
        Set value of opsPassword   to sUrl.sPassword 
        Set value of opsUserName   to sUrl.sUser 
        Set value of opsSaveAsFile to "c:\x.htm"
    End_Procedure
    
    Send DisplayProperties
End_Object

Procedure Activate_oTestStandardHttpRequest_URL tUrl sUrl
    Send Activate_oTestStandardHttpRequest
    Send AdoptUrl of oTestStandardHttpRequest sUrl
End_Procedure
