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
obj.openSizePopup(userId: "1", attributeName: "x",controller: self,key:"FVACX-SFSXZSDA")
```
userId - You will need to add your current user id here.

attributeName - You will need to add your product name here.

controller - You will need to add your current viewcontroler

key - You will need to pass API request key.

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

This function will return bool value like either true or false if size attribute is avilable or not
x - Attribute name like "Skirts-S,M,L,XL,XXL"
```ruby
let obj = SizeIt()
obj.isAttributeSizeAvailable(attributeName: "x")
```

## Facebook Events

You can track your user and product events. There are several functions that use to track user events.

- How many users are visits the application (With size, Without size).
- Which user visits which product (With size, Without size).
- Home many users add the product to his cart (With size, Without size).
- How many users buy the product (With size, Without size).
- How many users return the product (With size, Without size).
- Custom events (You can add your custom event if you want).

Now, You can add your events to Facebook by calling functions that are available in "SizeitUtils.swift" file in the library section.

Example to add an event:

1. Call this function when the user opens the app.

```ruby
/**
 * ADD USER INTO FB EVENT
 * userId :- CURRENT LOGGED IN USER ID.
 * hashSize :- PASS TRUE IF USER HAS SIZE.
 * data :- YOU CAN ADD OTHER STRING INFORMATION FOR FUTURE USE
 */
SizeitUtils().initUsers(userID: "1", hashSize: SizeIt().isAttributeSizeAvailable(attributeName: "x"), data: "user_event")
```

2. Call this function when the user opens the product details screen.

```ruby
/**
 * ADD VISIT PRODUCT EVENT
 * userId :- CURRENT LOGGED IN USER ID.
 * product_sku - PRODUCT NAME OF PRODUCT ID
 * hashSize :- PASS TRUE IF USER HAS SIZE.
 * data :- YOU CAN ADD OTHER STRING INFORMATION FOR FUTURE USE
 */
SizeitUtils().visitProduct(userID: "1", product_sku: "miqyas_fit", hashSize: SizeIt().isAttributeSizeAvailable(attributeName: "x"), data: "visit_product")
```

3. Call this function when the user adds the product to the cart.

```ruby
/**
 * ADD PRODUCT TO CART EVENT
 * userId :- CURRENT LOGGED IN USER ID.
 * product_sku - PRODUCT NAME OF PRODUCT ID
 * hashSize :- PASS TRUE IF USER HAS SIZE.
 * data :- YOU CAN ADD OTHER STRING INFORMATION FOR FUTURE USE
 */
SizeitUtils().addProductToCart(userID: "1", product_sku: "miqyas_fit", hashSize: SizeIt().isAttributeSizeAvailable(attributeName: "x"), data: "add_product_to_cart")
```

4. Call this function when the user buys the product.

```ruby
/**
 * BUY PRODUCT EVENT
 * userId :- CURRENT LOGGED IN USER ID.
 * product_sku - PRODUCT NAME OF PRODUCT ID
 * hashSize :- PASS TRUE IF USER HAS SIZE.
 * data :- YOU CAN ADD OTHER STRING INFORMATION FOR FUTURE USE
 */
SizeitUtils().buyProduct(userID: "1", product_sku: "miqyas_fit", hashSize: SizeIt().isAttributeSizeAvailable(attributeName: "x"), data: "buy_product")
```

5. Call this function when the user returns the product.

```ruby
/**
 * RETURN PRODUCT EVENT
 * userId :- CURRENT LOGGED IN USER ID.
 * product_sku - PRODUCT NAME OF PRODUCT ID
 * hashSize :- PASS TRUE IF USER HAS SIZE.
 * data :- YOU CAN ADD OTHER STRING INFORMATION FOR FUTURE USE
 */
SizeitUtils().returnProduct(userID: "1", product_sku: "miqyas_fit", hashSize: SizeIt().isAttributeSizeAvailable(attributeName: "x"), data: "return_product")
```

6. Call this function when you need to add custom event when ever you want.

```ruby
/**
 *  CUSTOM EVENT
 * userID   - CURRENT LOGGED IN USER ID.
 * param   - ADD CUSTOM PARAMS WHAT EVER YOU WANT.
 */
SizeitUtils().addCustomEvent(userID: "1", param: ["value":"5"])
```

## Author

miqyastech, abdulla@miqyas.net

## License

SizeIt is available under the MIT license. See the LICENSE file for more info.
