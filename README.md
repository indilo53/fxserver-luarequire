# FXServer LUA require

* add **luarequire** to your resources directory
* create a resource with a **__lib** folder in it
* Include **luarequire** in your resource with client_script / server_script **@luarequire/shared.lua**
* You can now require() packages in **__lib** folder
* See luarequire_example to see how it works (this is a resource using luarequire with some generic libs included in it)