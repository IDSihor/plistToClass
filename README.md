# plistToClass
# simply makes class from plist(app settings for example) in build time, in xcode

- purpose
###### everywere we always use .plist files, but anyway, we should use hardcoded keys to work with corresponding values in project. .plist to dictionary, and then `please give me the value by key`, so key should be constant saved anywere in project. no xcode autofilling, no value types, nothing!!! this work is very usefull for application settings for example saved in .plist file.

- how to get script
###### in `bin` folder there is ready script to run !!!
- how to customize
###### just open project and go
- how to setup inside xcode for the first usage
###### simply copy bin file to project folder (plistToClass)
###### create new class in project, like `GlobalSettings`.h(.m)
###### in "build phases/run script" add `./plistToClass <(plist file name, without extension)> <GlobalSettings>`
###### just build the project
###### that's all )
###### now You have a class for .plist file ), and can create an instance one ), and use it inside xcode )
###### class name will be `(plist file name, without extension)_class` !!!
- how to use
###### after updating .plist file, just build the project, after that, you can use all properties with autofilling in xcode
- example
###### we have `Settings.plist`
###### we created files `GlobalSettings.h` and `.m`
###### in "build phases/run script" we have `./plistToClass Settings GlobalSettings`
###### that's all
###### `CMD + B`
###### so let's go coding )


- TO DO 
###### global refactoring !!! 
###### it was very quick work
