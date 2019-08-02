@echo off
mkdir "%USERPROFILE%\Downloads\downloadedAudio"
:check
set Cond=
set /p Url=What is the address of the audio file/playlist you want me to download? Link: 
echo Alright!
youtube-dl -f bestaudio/best "%Url%" -x -o "%USERPROFILE%\Downloads\downloadedAudio\%%(title)s.%%(ext)s"
set /p Cond=Press o to download something else:
IF "%Cond%"=="o" (goto :check)
echo ####################Converting your files to mp3!####################
for %%A IN (%USERPROFILE%\Downloads\downloadedAudio\*) DO ffmpeg -i "%%A" -vn -ar 44100 -ac 2 -ab 128k -f mp3 "%%A.mp3"
for %%K in (%USERPROFILE%\Downloads\downloadedAudio\*) do if not %%~xK==.mp3 del "%%K"
PAUSE