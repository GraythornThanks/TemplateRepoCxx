#!/bin/bash

# 检查输入参数
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <folder_name>"
    exit 1
fi

FOLDER_NAME=$1

# 格式化
clang-format -i `find $FOLDER_NAME/include/ -type f \( -name "*.h" -o -name "*.hpp" \)`
clang-format -i `find $FOLDER_NAME/src/ $FOLDER_NAME/example/ $FOLDER_NAME/test/ -type f \( -name "*.c" -o -name "*.cc" -o -name "*.cpp" \)`

# 统计代码行数
cloc --git `git branch --show-current`
