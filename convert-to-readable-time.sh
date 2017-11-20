cat people.data.txt | cut -d ' ' -f 1 | xargs -J % -L 1 date -r % +"%d.%m.%Y%N%H:%M:%S"
