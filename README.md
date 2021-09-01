# work

Для запуска, нужно поставить `libglfw3-dev`, `xorg-dev`. Далее, подтянуть
сабмодули и собрать через 
`mkdir build && cd build && cmake ../ && cmake --build . -j16`

## src/listener

ROS слушатель.

## src/main

Последний эксперимент с IMGUI

# misc

## shell.nix

Для пакетного менеджера nix и быстрого создания рабочего окружения с помощью команды
`nix-shell`

На данный момент только для ROS подходит. В случае когда нужен openGL, GLFW3 - беда печаль.
