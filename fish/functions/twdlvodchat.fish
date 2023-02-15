function twdlvodchat --description "download twitch vod, chat to folder.first arg vod, second arg folder"
    echo "$argv[1] is vod"
    echo "$argv[2] is suggested folder"
    set __twdlvodchat_vod_number $argv[1]
    set __twdlvodchat_download_location "$HOME/"
    if test -d $twdlvodchat_download_location
        set __twdlvodchat_download_location $twdlvodchat_download_location
    end
    # make output location
    set __twdlvodchat_output_location (string join "" $twdlvodchat_download_location $argv[2] "/")
    set __twdlvodchat_output_location_vod (string join "" $twdlvodchat_download_location $argv[2] "/" "video.mp4")
    set __twdlvodchat_output_location_chat (string join "" $twdlvodchat_download_location $argv[2] "/" "chat.json")

    echo "resolved folder location is $__twdlvodchat_output_location"
    mkdir -p $__twdlvodchat_output_location

    if test -e $__twdlvodchat_output_location_vod -o -e $__twdlvodchat_output_location_chat
        echo "files already exist? check $__twdlvodchat_output_location for video.mp4 or chat.json"
        return 1
    else
        echo about to download
        echo $__twdlvodchat_vod_number > $__twdlvodchat_output_location/$__twdlvodchat_vod_number
        TwitchDownloaderCLI videodownload -o $__twdlvodchat_output_location_vod -u $__twdlvodchat_vod_number --temp-path $__twdlvodchat_output_location
        
        TwitchDownloaderCLI chatdownload -o $__twdlvodchat_output_location_chat -u $__twdlvodchat_vod_number --temp-path $__twdlvodchat_output_location

    end
        
end
