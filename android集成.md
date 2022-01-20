> 1. 在主项目android/app/下面建立libs文件 导入healthhut.aar包。
![img.png](img.png)
> 2.在主项目android/app/build.gradle 下面添加引入aar包
```java
    implementation fileTree(dir: 'libs', include: ['*.jar', '*.aar'])

```
![img_1.png](img_1.png)
>3.修改主项目android/app/src/main/AndroidManifest.xml文件application节点 添加主题android:theme
![img_2.png](img_2.png)
> 4.在主项目MainActivity中重写 configureFlutterEngine 方法 完全照搬我这种写法
![img_3.png](img_3.png)


* 具体代码是里可在插件example/android主项目中查看实例
