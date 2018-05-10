--[[]
     _____          _        _ _           
    |_   _|        | |      | | |          
      | | _ __  ___| |_ __ _| | | ___ _ __ 
      | || '_ \/ __| __/ _` | | |/ _ \ '__|
     _| || | | \__ \ || (_| | | |  __/ |   
     \___/_| |_|___/\__\__,_|_|_|\___|_|   
         ＦＲＡＭＥＷＯＲＫ   /   ᴍᴀᴅᴇ ʙʏ ᴄʀᴜɢɢ
]]


--> Functions / Framework
function resolveURL(sUrl)
        local ok, err = http.checkURL( sUrl )
        if not ok then
            print( "Failed." )
            if err then
                printError( err )
            end
            return nil
        end
    
        local response = http.get( sUrl )
        if not response then
            print( "Failed." )
            return nil
        end
    
        print( "Success." )
    
        local sResponse = response.readAll()
        response.close()
        return sResponse

end


function downloadURL(URL, Path)

    local sUrl = URL
    local sFile = Path
    local sPath = shell.resolve( sFile )
    
    if fs.exists( sPath ) then
        fs.delete(sPath)
    end
    
    local res = resolveURL( sUrl )
    local file = fs.open( sPath, "w" )
    file.write( res )
    file.close()
end

function message(Message)
    print(Message)
end

function mkdir(Directory)
    if not fs.exists(Directory) then
        fs.makeDir(Directory)
    end
end

--> Installer Code

---> Code your installer right here <---
