function b
set SRC_FILE "Doliv.cpp"
if test (count $argv) -eq 1
set SRC_FILE $argv[1]
end
set EXE_FILE "e"(basename $SRC_FILE .cpp)
set CMD "g++ $SRC_FILE -o $EXE_FILE -Wall -Wextra -D_GLIBCXX_ASSERTIONS -fsanitize=address,undefined && ./$EXE_FILE"
echo $CMD
eval $CMD
end

