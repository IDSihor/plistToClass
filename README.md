# plistToClass
# simply makes class from plist(app settings for example) in build time, in xcode

### in `bin` folder there is ready script to run !!!

###### build source as command line application
###### add this util to xcode project dir

###### just if you have settings.plist file in project, simply create empty class,
###### for example Settings.h(m) 
### dont forget to add script to "build phases/run script" like 
### `./(util name) settings(plist file name) Settings(class name)`
###### anywere you need (app delegate for example), just create new instance `"Settings *globalSettings = [Settings new];"`
###### and now you can use your settings, any parameters as a class, autofilling inside xcode etc...
###### after building your project ))), `CMD + B`, and magic is here )
###### now you can access in code all your properties of plist file 
### like:
### `titleLabel.text =  globalSettings.fonts.mainScreenSettings.title;`
