# _A Cpp Template_

原仓库地址：
🌟[Github Repo](https://github.com/Codesire-Deng/TemplateRepoCxx)

## 改动内容

将原结构改为每个子文件夹都是一个小项目，更适合刷课
直接内置了`glfw`, `glad`, `glm`, 更适合各位图形学宝宝

## 使用方法

1. `git clone https://github.com/GraythornThanks/TemplateRepoCxx.git`
2. 删除 `.git` 文件夹
3. 开始愉快的编译之旅

如何添加一个子项目？

1. 直接复制demo1文件夹，更改新文件夹名
2. 在主 `CMakeLists.txt` 中使用 `add_subdirectory()` 添加新子文件夹
3. 修改子文件夹中的 `set_target_properties(main PROPERTIES TARGET_FILE_NAME "demo1")` 属性

