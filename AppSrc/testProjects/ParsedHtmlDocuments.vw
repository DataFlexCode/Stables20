Use Windows.pkg
Use DFClient.pkg

Use cHtmlScraper.pkg
Use FileFunctions.pkg

Activate_View Activate_oParsedHtmlDocuments for oParsedHtmlDocuments
Object oParsedHtmlDocuments is a View
    
    On_Key kCancel Send close_panel

    Set Border_Style to Border_Thick
    Set Size to 200 371
    Set Location to 2 2
    Set Label to "Parsed documents"
    Set piMinSize to 200 371
    
    Property tHtmlDocument[] paDocuments

    Object oList is a List
        Set Size to 129 348
        Set Location to 18 9
        Set peAnchors to anAll
        Set Select_Mode to Auto_Select
        Procedure DoFillList
            Integer iMax iItem
            tHtmlDocument[] aDocuments
            Get paDocuments to aDocuments
            Move (SizeOfArray(aDocuments)) to iMax
            Decrement iMax
            Send Delete_Data
            For iItem from 0 to iMax
                Send Add_Item MSG_NONE aDocuments[iItem].sUrl
            Loop
        End_Procedure
        Function CurrentDocument tHtmlDocument ByRef stDoc Returns Boolean
            Integer iItem
            tHtmlDocument[] aDocuments
            If (Item_Count(Self)) Begin
                Get Current_Item to iItem
                Get paDocuments to aDocuments
                Move aDocuments[iItem] to stDoc
            End
            Function_Return (Item_Count(Self)<>0)
        End_Function
    End_Object
    
    Function TempFileName String sFileName Returns String
        Boolean bCreated
        String sFolder
        Get VdfFolderPath of oFileFunctions VDF_FILELIST to sFolder
        Get AppendPath of oFileFunctions sFolder "Temp" to sFolder
        If (FileExists(oFileFunctions,sFolder)=0) begin
            Get CreateFolderNew of oFileFunctions sFolder to bCreated
        End
        Function_Return (AppendPath(oFileFunctions,sFolder,sFileName))
    End_Function
    
    Object oButton1 is a Button
        Set Size to 14 57
        Set Location to 153 16
        Set Label to "View original"
        Set peAnchors to anBottomRight
        Procedure OnClick
            String sUrl
            tHtmlDocument stDoc
            If (CurrentDocument(oList,&stDoc)) Begin
                Move stDoc.sUrl to sUrl
                If (not(sUrl contains "//")) ;
                        Move ("http://"+sUrl) to sUrl
                Send ShellExecuteDocument of oFileFunctions sUrl
            End
        End_Procedure
    End_Object

    Object oButton2 is a Button
        Set Size to 14 57
        Set Location to 153 78
        Set Label to "View copy"        
        Set peAnchors to anBottomRight
        Procedure OnClick
            String sFile
            tHtmlDocument stDoc
            If (CurrentDocument(oList,&stDoc)) Begin
                Get TempFileName "viewcopy.htm" to sFile
                Send WriteDocument of oHtmlParserFunctions stDoc WDM_XHTML sFile
                Send ShellExecuteDocument of oFileFunctions sFile
            End
        End_Procedure
    End_Object

    Object oButton3 is a Button
        Set Size to 14 55
        Set Location to 153 140
        Set Label to "Text and links"
        Set peAnchors to anBottomRight
        Procedure OnClick
            Integer iChannel iMax iItm
            String sFile sLink sName sValue
            tHtmlDocument stDoc
            If (CurrentDocument(oList,&stDoc)) Begin 
                Get TempFileName "scrapedtest.txt" to sFile
                Get DirectOutput of oFileFunctions sFile to iChannel
                If (iChannel>=0) Begin
                    Writeln ("Title:"*stDoc.sTitle)
                    Writeln ""
                    Writeln stDoc.sTextValue
                    Writeln ""

                    Writeln "Headers:"
                    Move (SizeOfArray(stDoc.aHeaders)) to iMax
                    Decrement iMax
                    For iItm from 0 to iMax
                        Move stDoc.aHeaders[iItm].sName to sName
                        Move stDoc.aHeaders[iItm].sValue to sValue
                        Writeln (sName+": "+sValue)
                    Loop
                    
                    Writeln ""
                    Writeln "Links:"
                    Move (SizeOfArray(stDoc.aLinks)) to iMax
                    Decrement iMax
                    For iItm from 0 to iMax
                        Move stDoc.aLinks[iItm].sUrl to sLink
                        Get UrlCharacterDecode of oUrlFunctions sLink to sLink
                        Writeln sLink
                    Loop
                    
                    Send CloseOutput of oFileFunctions iChannel
                    Send NotePad of oFileFunctions sFile
                End
            End
        End_Procedure
    End_Object

    Object oButton4 is a Button
        Set Location to 153 199
        Set Label to "Structure"
        Set peAnchors to anBottomRight
        Procedure OnClick
            String sFile
            tHtmlDocument stDoc
            If (CurrentDocument(oList,&stDoc)) Begin
                Get TempFileName "elementstructure.txt" to sFile
                Send WriteDocument of oHtmlParserFunctions stDoc WDM_NO_CONTENT sFile
                Send NotePad of oFileFunctions sFile
            End
        End_Procedure
    End_Object

    Object oButton5 is a Button
        Set Location to 153 253
        Set Label to "Parse info"
        Set peAnchors to anBottomRight
        Procedure OnClick
            String sFile
            tHtmlDocument stDoc
            If (CurrentDocument(oList,&stDoc)) Begin 
                Get TempFileName "elementstructure.txt" to sFile
                Send WriteDocument of oHtmlParserFunctions stDoc WDM_PARSE_INFO sFile
                Send NotePad of oFileFunctions sFile
            End
        End_Procedure
    End_Object

    Object oButton6 is a Button
        Set Location to 153 307
        Set Label to "Clear list"
        Set peAnchors to anBottomRight
        Procedure OnClick
            tHtmlDocument[] aDocuments
            Set paDocuments to aDocuments
            Send DoFillList of oList
        End_Procedure
    End_Object
    
    Procedure Add_Document tHtmlDocument stDocument
        tHtmlDocument[] aDocuments
        Get paDocuments to aDocuments
        Move stDocument to aDocuments[SizeOfArray(aDocuments)]
        Set paDocuments to aDocuments
        Send DoFillList of oList
    End_Procedure

End_Object
