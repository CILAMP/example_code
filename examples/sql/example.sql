 -- Input to CILamp API
DECLARE @Color VARCHAR(10) = '#0000FF' -- RRGGBB
DECLARE @MyId VARCHAR(400) = 'my-system-id' -- system id 1-80 long; letters, digits, underscore and minus sign allowed

-- Temporary variables
DECLARE @Object AS INT
DECLARE @ResponseText AS VARCHAR(8000)
DECLARE @Status INT
DECLARE @Url VARCHAR(4000)
DECLARE @Body AS VARCHAR(8000) = 'color=' + @Color

SELECT @Url = 'https://api.cilamp.se/v1/' + @MyId

EXEC Sp_oacreate 'MSXML2.ServerXMLHTTP', @Object OUT
EXEC Sp_oamethod @Object, 'open', NULL, 'post', @Url, 'false'
EXEC Sp_oamethod @Object, 'setRequestHeader', NULL, 'Content-Type', 'application/x-www-form-urlencoded'
EXEC Sp_oamethod @Object, 'send', NULL, @body
EXEC Sp_oagetproperty @Object, 'status', @Status OUT
EXEC Sp_oamethod @Object, 'responseText', @ResponseText output

-- Return of routine is full URL, HTTP status code and content of response
SELECT @Status
SELECT @ResponseText

-- Clean up
EXEC Sp_oadestroy @Object  
