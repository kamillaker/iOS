//
//  README.md
//  Lab 3
//
//  Created by Kamilla Kerimbayeva on 11.10.2025.
//

I used a class for ShoppingCart because it needs to change and keep the same data everywhere in the program. When I add or remove an item, I want it to update in the same cart. If I used a struct, every copy would have its own data, and the changes would not be visible. The class helps to keep one cart that can be shared and changed in different places.

I used structs for Product and Order because they are simple data types. A product has a name, price and description, and it does not need to be shared or changed everywhere. An order also should not change after it is created. When I copy a struct, it makes a new value, and that is useful for things that must stay separate and not be linked to each other.

An example where reference type is important is when I call a function that takes my ShoppingCart and adds a new item. Even if I pass the cart into the function, it still changes the original one, because it is the same object in memory. This shows how reference works and why I used a class.

An example where value type is important is when I copy a CartItem or Product. When I change the new copy, the old one stays the same. This shows that structs work with their own data and do not affect other copies. It helps to keep the data safe and not change it by accident.

At first everything felt a bit difficult because there were many parts to write, then it became clear what to do and how to do it.
