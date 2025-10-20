## QSQLCIPHER

SQLCipher/sqlite plugin for Qt6 projects.
Based on original CMakeLists.txt`s from Qt 6.7.3 srcs (from sqldrivers and sqlite3 folders) with minimal changes/additions. Checked on Visual Studio 2022 projects. Project uses OpenSSL x64 static libraries built for Visual Studio. If you need another libraries you should change CMakeLists.txt

### Prerequisites

1. [SQLCipher/sqlite amalgamation] уже предоставленны в проекте
2. OpenSSL скомпилированные статические библиотеки также представлены в проекте, 
вы можете создать свои амалагмации и скомпилировать OpenSSL если желаете


### Building debug and release plugins
1. Open the Visual Studio Command Prompt (Tools -> Command Line -> Developer Command Prompt)
2. cd to Projects folder
3. Clone this project
```
> git clone 
```
5. cd to project folder and create .build folder and cd to it
```
> cd qsqlcipher
> mkdir .build
> cd .build
```
6. Configure the project (use your paths and keywords instead of example). Make sure all paths use '/' slash
```
> cmake .. -G "Ninja" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../.install -DQt6_DIR=c:/Qt/6.7.3/msvc2022_64/lib/cmake/Qt6
также можно указать любой другой тип сборки, Debug, minsizerelease или типо того
```
7. Build and install
```
> cmake --build .
> cmake --install .
```
### Usage

In .install folder you will find release and debug version of plugin. Just copy these files to sqldrivers folder of Qt6 installation and/or your project.
So, now you can use your plugin

```cpp
  auto db{QSqlDatabase::addDatabase("QSQLCIPHER")};
  db.setDatabaseName("encrypted.db");
	
  if (!db.open())
    return {};

  QSqlQuery query(db);

  //Use the safer way to enter password 
  query.exec("PRAGMA key = 'yourpassword';");
  
  ...
```




