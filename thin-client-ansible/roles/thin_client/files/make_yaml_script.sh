#!/usr/bin/env bash
if [ "$#" -ne 2 ]; then
    echo "Usage:\n$0 <in_path> <out_file>"
fi

IN_PATH="$1"
OUT_FILE="$2"

# dla każdego pliku w lokalizacji uruchomienia skryptu 
for mac in "$IN_PATH/"*.xml; do
    macdir=`dirname "$mac"`

    # MAC wskasuje na name, więc pobieramy treść linka mac
    name=`readlink "$mac"`
    name="$macdir/$name"
    namedir=`dirname "$name"`
    name=`basename "$name"`

    # name wskazuje na template, więc powieramy treść linka name
    template=`readlink "$namedir/$name"`

    mac=`basename "$mac"`
    template=`basename "$template"`

    printf -- "- mac: \"%s\"\n  name: \"%s\"\n  template: \"%s\"\n" "$mac" "$name" "$template" >> "$OUT_FILE"
done
