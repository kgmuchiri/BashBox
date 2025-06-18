MUSIC_DIR="${1:-.}"

cd "$MUSIC_DIR" || exit

for dir in *" - "*; do
    #Skip if not a directory
    [ -d "$dir" ] || continue
    #Get string before "-" (artsits name)
    artist="${dir%% - *}"
    #make artist directory- if it doesn't exist
    mkdir -p "$artist"
    #move to directory
    mv "$dir" "$artist/"
done