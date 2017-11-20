cat log1 | cut -f 1 | xargs -L 1 -J % date -j -f "%d.%m.%YN%H:%M:%S" % +"%s" | paste - log1 | cut -f 1,3
