# plistToClass
# simply makes class from plist(app settings for example) in build time, in xcode

1. Purpose
###### We always use `.plist` files in our projects, but anyway, we should use hardcoded keys to work with corresponding values in project. 
###### `.plist` to dictionary, and then we have to ask dictionary :`please give me the value by key`
###### so key should be constant and saved anywere in project. 
###### No xcode autofilling, no value types!!! 
###### This work is usefull for application settings for example saved in `.plist` file.

2. How to get script
###### in `bin` folder there is ready script to run !!!

3. How to setup inside xcode for the first usage
###### simply copy bin file to project folder `plistToClass`
###### create new class in project, like `GlobalSettings`.h(.m)
###### in "build phases/run script" add :
###### `./plistToClass <(plist file name, without extension)> <GlobalSettings>`
###### Build the project
###### That's all )
###### Now You have a class for `.plist` file ), and can create an instance one ), and use it inside xcode )
###### class name will be **`(plist file name, without extension)_class`** !!!

4. How to use
###### after updating `.plist` file, just build the project, 
###### after that, you can use all properties with autofilling in xCode

5. Example
###### we have `Settings.plist`
###### we created files `GlobalSettings.h` and `.m`
###### in **"build phases/run script"** we have `./plistToClass Settings GlobalSettings`
###### that's all
###### `CMD + B`, building the project.
###### Now we can get our `.plist` file like **`Settings_class *settings = [Settings_class new];`**
###### **so let's go coding )**


