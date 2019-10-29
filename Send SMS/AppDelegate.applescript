--
--  AppDelegate.applescript
--  Send SMS
--
--  Created by Thomas Verschoren on 09/03/16.
--  Copyright © 2016 Thomas Verschoren. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property theWindow : missing value
    property phoneNumber: missing value
    property klantNummer: missing value
    property daveReference: missing value
    property resultMessage: missing value
    property radioTypeService: missing value
    property radioTypeRetail: missing value
    property radioNoorderlaan: missing value
    property radioGent: missing value
    property radioLatem: missing value
    property radioHasselt: missing value
    property radioGenk: missing value
    property radioLier: missing value
    property radioOostende: missing value
    property radioTheater: missing value
    property radioWaasland: missing value
    property radioWijnegem: missing value

on buttonClicked_(Sender)
    #Set Type Value
    set typeString to ""

    #Service
    set serviceValue to ""
    set serviceValue to radioTypeService's stringValue as string
    if serviceValue = "1"
        set typeString to "herstelling"
    end
    #Retail
    set retailValue to ""
    set retailValue to radioTypeRetail's stringValue as string
    if retailValue = "1"
        set typeString to "bestelling"
    end

    #Set Location Toggle
    set location to ""

    #Genk
    set genkValue to ""
    set genkValue to radioGenk's stringValue as string
    if genkValue = "1"
        set location to "Genk"
    end

    #Gent
    set gentValue to ""
    set gentValue to radioGent's stringValue as string
    if gentValue = "1"
        set location to "Gent"
    end

    #hasselt
    set hasseltValue to ""
    set hasseltValue to radioHasselt's stringValue as string
    if hasseltValue = "1"
        set location to "Hasselt"
    end

    #latem
    set latemValue to ""
    set latemValue to radioLatem's stringValue as string
    if latemValue = "1"
        set location to "Latem"
    end

    #lier
    set lierValue to ""
    set lierValue to radioLier's stringValue as string
    if lierValue = "1"
        set location to "Lier"
    end

    #noorderlaan
    set noorderlaanValue to ""
    set noorderlaanValue to radioNoorderlaan's stringValue as string
    if noorderlaanValue = "1"
        set location to "Noorderlaan"
    end

    #oostende
    set oostendeValue to ""
    set oostendeValue to radioOostende's stringValue as string
    if oostendeValue = "1"
        set location to "Oostende"
    end

    #theater
    set theaterValue to ""
    set theaterValue to radioTheater's stringValue as string
    if theaterValue = "1"
        set location to "Theater"
    end

    #wijnegem
    set wijnegemValue to ""
    set wijnegemValue to radioWijnegem's stringValue as string
    if wijnegemValue = "1"
        set location to "Wijnegem"
    end

    #waasland
    set waaslandValue to ""
    set waaslandValue to radioWaasland's stringValue as string
    if waaslandValue = "1"
        set location to "Waasland"
    end

    #SetXML
    --
    if serviceValue is "1" then
        set theXMLString to "{\"key\": \"your-mandrillkey\",\"template_name\": \"your-template_name\",\"template_content\": [],\"message\": {\"to\": [{\"email\": \"" & (stringValue() of phoneNumber) & "\"}],\"auto_text\": true,\"inline_css\": true,\"merge\": true,\"merge_language\": \"handlebars\",\"merge_vars\": [{\"rcpt\": \"" & (stringValue() of phoneNumber) & "\",\"vars\":[{\"name\": \"referentie\",\"content\": \"" & (stringValue() of daveReference) & "\"},{\"name\": \"model\",\"content\": \"iPhone SE\"},{\"name\": \"filiaal\",\"content\": \"" & location & "\"},{\"name\": \"klantnaam\",\"content\": \"" & (stringValue() of klantNummer) & "\"}]}]}}"
    else
        set theXMLString to "{\"key\": \"your-mandrillkey\",\"template_name\": \"your-template_name\",\"template_content\": [],\"message\": {\"to\": [{\"email\": \"" & (stringValue() of phoneNumber) & "\"}],\"auto_text\": true,\"inline_css\": true,\"merge\": true,\"merge_language\": \"handlebars\",\"merge_vars\": [{\"rcpt\": \"" & (stringValue() of phoneNumber) & "\",\"vars\":[{\"name\": \"referentie\",\"content\": \"" & (stringValue() of daveReference) & "\"},{\"name\": \"model\",\"content\": \"bestelling\"},{\"name\": \"filiaal\",\"content\": \"" & location & "\"},{\"name\": \"klantnaam\",\"content\": \"" & (stringValue() of klantNummer) & "\"}]}]}}"
    end if

    set curl_command to "curl -A 'Mandrill-Curl/1.0' -d '" & theXMLString & "' 'https://mandrillapp.com/api/1.0/messages/send-template.json'"
    try
        #display dialog theXMLString
        do shell script curl_command
        set textFieldValue to "Je bericht werd succesvol verzonden."
        on error error_message
             set textFieldValue to "Er liep iets mis: " & error_message
    end try

    resultMessage's setString_(textFieldValue)
        delay 5
    set resetFieldValue to ""
    resultMessage's setString_(resetFieldValue)

end buttonClicked_

    on radioClicked_(Sender)
    end radioClicked_

    on radioTypeClicked_(Sender)
    end radioTypeClicked_

	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script