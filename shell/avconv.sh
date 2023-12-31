for i in `ls *.*|grep -v "mp3"|grep -v grep`; do avconv -i $i  -vn -b:a 192k $i.mp3; done

