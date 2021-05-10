# sizeit

[![CI Status](https://img.shields.io/travis/Jaydeep/sizeit.svg?style=flat)](https://travis-ci.org/Jaydeep/sizeit)
[![Version](https://img.shields.io/cocoapods/v/sizeit.svg?style=flat)](https://cocoapods.org/pods/sizeit)
[![License](https://img.shields.io/cocoapods/l/sizeit.svg?style=flat)](https://cocoapods.org/pods/sizeit)
[![Platform](https://img.shields.io/cocoapods/p/sizeit.svg?style=flat)](https://cocoapods.org/pods/sizeit)

This library is helping me to find what is my current size for particular products like, Skirt, T-shirts, Tops, and others.

- At the first time it will take some input from users like Height(FT, CM), Weight(LBS, KG), Age, Stomach, and Hips.

- Call one API to get all the product sizes that available on our database and stored them into a locale for future uses.

- You will get all the product sizes by calling "SizeIt().getAllSizes()" function.

- You will get perticular product size by calling "SizeIt().getSizeByAttribute(attributeName:"x")" function. It will return X product size if it is available on locale storage otherwise it will return empty. X - product name.

- You will check the product sizes are available or not in the local storage by calling "SizeIt().hasSizes()" function. It will return True if sizes available on storage otherwise it will return false.

## Steps to implement library
To run the project, clone the repo, and run `pod install` from the SizeIt directory first.
```ruby
pod 'sizeit'
```
Great!!
You have successfully implemented library on your project. So, You can access all the library things into your project.


## More information about this library:
1. If you want to check the sizes are available on local storage or not then you get it through via the below function.
```ruby
/**
 * IF YOU WANT TO CHECK SIZES ARE AVAILABLE ON LOCALE OR NOT
 * THEN CALL THE "SizeIt().hasSizes()" FUNCTION.
 *
 * IT WILL RETURN TRUE IF IT IS AVAILABLE ELSE IT IS RETURN FALSE.
 */
 public func hashProductSizes() -> Bool {
    let isAvailable = SizeIt().hasSizes()
}
```
2. If you want to get a particular product size by product name (miqyas_fit), then you will get it via the below functions.
```ruby
/**
 * IF YOU WANT TO GET PARTICULAR PRODUCT SIZE BY PRODUCT NAME
 * THEN CALL THE "SizeIt().getSizeByAttribute(attributeName:"x")" FUNCTION.
 *
 * IT WILL RETURN PARTICULAR PRODUCT SIZE FROM LOCALE IF AVAILABLE.
 */
 public func getSizeByProductName() {
    SizeIt().getSizeByAttribute(attributeName:"x")
}
```
X - Add product miqyas_fit.

This function will return the product size of the user as per inputted information if available in local storage.

3. If you want to open user inputs screens like height, weight, age, etc.. then you can do it via the below code.
```ruby
let obj = SizeIt()
obj.openSizePopup(userId: "1", attributeName: "x",controller: self)
```
userId - You will need to add your current user id here.

attributeName - You will need to add your product name here.

controller - You will need to add your current viewcontroler

It will return the product attribute size into handlerUpdate function if it is available in local storage.
```ruby
let obj = SizeIt()
obj.handlerUpdate = {[weak self] size in
    print("Your size is \(size)")
}
```

Change language: English - true, Arabic - false
```ruby
let obj = SizeIt()
obj.setupLanguage(isEnglish: true)
```

## Author

miqyastech, abdulla@miqyas.net

## License

SizeIt is available under the MIT license. See the LICENSE file for more info.
