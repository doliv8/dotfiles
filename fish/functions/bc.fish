function bc
if test (count $argv) -eq 1
set SRC_FILE $argv[1]
set EXE_FILE (basename $SRC_FILE .c)
set CMD "gcc $SRC_FILE -o $EXE_FILE -Wall -Wextra && ./$EXE_FILE"
echo $CMD
eval $CMD
end
end
