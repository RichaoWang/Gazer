# src文件夹说明

## 代码说明

* 该文件夹为程序关键部分，包括ui和逻辑，代码采用前后端分离设计，详情请看 **文件树**
* 文件编码格式请用utf-8不带bom，代码中最好不要含有中文（包括注释），中文可能会改变文件格式导致编译失败，还会出现乱码，显示中文请用国际化，c++中用tr函数，qml中用qsTr函数

## 文件树

```
│CS2_External_Core
│  ├─Dumper
│  ├─Features
│  │  ├─Aimbot
│  │  └─SkinChanger
│  ├─Font
│  ├─OS-ImGui
│  │  ├─imgui
│  │  └─stb
│  ├─Resources
│  └─Utils
│      ├─cpp-httplib
│      ├─Initial
│      └─json
├─qml
└─resource
```

### 脚本说明

* **Script-DeployRelease** 执行Qt的windeployqt或macdeployqt命令，这个脚本只在windows与macos才有，linux不支持
