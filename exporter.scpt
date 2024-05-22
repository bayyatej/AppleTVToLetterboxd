tell application "TV"
	set myTVLibrary to tracks
	set exportCSVText to "Title,Year,Directors" & return
	repeat with purchase in myTVLibrary
		set mediaKindText to media kind of purchase as text
		set itsNameText to name of purchase
		
		if mediaKindText = "movie" then
			set itsNameText to name of purchase
			set itsYearText to year of purchase
			set itsDirectorText to director of purchase
			set exportCSVText to exportCSVText & itsNameText & "," & itsYearText & "," & itsDirectorText & return
		end if
	end repeat
	set exportFilePathText to my createExportFile(exportCSVText)
end tell

-- A handler to write the text contents of the AppleTV export to a CSV file

to createExportFile(fileContentsText)
	tell application "Finder"
		set exportFilePathText to ((path to desktop as text) & "appleTVLetterboxdExport.csv")
		if (exists file exportFilePathText) then
			set SHOULD_DELETE_FILE_OPTION_TEXT to "Yes"
			set overwriteFileChoice to button returned of (display dialog "Replace existing file " & exportFilePathText buttons {SHOULD_DELETE_FILE_OPTION_TEXT, "No"} default button 2)
			
			if overwriteFileChoice = SHOULD_DELETE_FILE_OPTION_TEXT then
				delete file exportFilePathText
			end if
		end if
	end tell
	
	try
		set exportFile to (open for access exportFilePathText with write permission)
		write fileContentsText to exportFile
		close access exportFile
	on error errorMsg
		close access exportFile
		display dialog "Failed to create the file due to error" & (errorMsg as text) buttons {"Cancel"}
		return
	end try
	display dialog "exportCSVText file created at " & exportFilePathText
end createExportFile
