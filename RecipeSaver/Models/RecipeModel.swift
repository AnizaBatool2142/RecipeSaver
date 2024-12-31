//
//  RecipeModel.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/11/2024.
//

import Foundation
enum Category: String, CaseIterable , Identifiable {
    
    var id:String { self.rawValue }
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case wrap = "Wrap"
    case drink = "Drink"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let datePublished: String
    let url: String
}
extension  Recipe {
    
    static let all:[Recipe] = [
        
        Recipe(name: "Creamy Carrot Soup",
               image: "https://www.forksoverknives.com/uploads/Creamy-Carrot-Soup-for-Wordpress.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=367&dpr=2", //
               description: "This bold-hued soup is perfectly sweet and seriously comforting. Peeling the red bell pepper helps make this carrot soup extra silky. Dress…",
               ingredients: """
               ¼ cup cashews
              , 1 medium onion, cut into ½-inch dice (2 cups)
               1½ pounds carrots, cut into ½-inch dice (3½ cups)
               1 red bell pepper, peeled and cut into ½-inch dice (1 cup)
               1 sprig fresh rosemary
               1 sprig fresh thyme
               1 large fresh sage leaf
               4 cloves garlic, minced
               1 tablespoon lemon juice
               Sea salt and freshly ground black pepper or cayenne pepper, to taste
               ½ cup fresh pomegranate seeds
               2 tablespoons finely chopped fresh parsley
""",
               directions: "This bold-hued soup is perfectly sweet and seriously comforting. Peeling the red bell pepper helps make this carrot soup extra silky. Dress it up with a drizzle of rich cashew cream, pomegranate seeds, and chopped fresh parsley for a festive fall presentation. ",
               category: "Soup",
               datePublished: "2019-11-11",
               url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/creamy-carrot-soup/"),
        
        Recipe(name: "Creamy Carrot and Pea Soup",
               image: "https://www.forksoverknives.com/uploads/Creamy-Carrot-and-Pea-Soup-wordpress.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=367&dpr=2",
               description: "Fresh ginger, cinnamon, and coriander deliver unforgettable flavor in this creamy carrot soup. Instead of using dairy or oil to achieve its…",
               ingredients:"""
                2 cups chopped onion
               3 cloves garlic, minced
               3 cups chopped carrots
               1 tablespoon grated fresh ginger
               1 32-oz. package low-sodium vegetable broth
               3 cups chopped peeled Yukon gold potatoes
               1 teaspoon ground coriander
               Dash ground cinnamon
               2 15-oz. cans no-salt-added chickpeas, rinsed and drained (3 cups)
               2 cups unsweetened coconut milk beverage (do not use canned)
               2 tablespoons lime juice
               Sea salt, to taste
               Freshly ground black pepper, to taste
               2 cups fresh sugar snap peas, halved 
""",
               directions: "Fresh ginger, cinnamon, and coriander deliver unforgettable flavor in this creamy carrot soup. ",
               category: "Soup",
               datePublished: "2023-05-23",
               url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/creamy-carrot-and-pea-soup/") ,
        
        Recipe(name: "Carrot Ginger Soup with Orzo and Kale",
               image: "https://www.forksoverknives.com/uploads/2023/11/Carrot-Ginger-Soup-with-Orzo-and-Kale-wordpress.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=367&dpr=2",
               description: "This carrot ginger soup is equal parts refreshing and hearty, which makes it the ideal meal no matter the season. The slurpable…",
               ingredients: """
               6 cups chopped carrots
               1 cup chopped yellow onion
               1 cup chopped celery
               1 cup chopped peeled potato
               6 cloves garlic, minced
               1½ tablespoons grated fresh ginger
               ⅛ teaspoon crushed red pepper, or to taste
               4 cups low-sodium vegetable broth
               1 cup finely chopped kale leaves, stems removed
               2 tablespoons dry whole wheat orzo pasta
               1 tablespoon white wine vinegar
               1 tablespoon lemon juice
               Sea salt, to taste
               Freshly ground black pepper, to taste
               """,
               directions: "This carrot ginger soup is equal parts refreshing and hearty, which makes it the ideal meal no matter the season.",
               category: "Soup",
               datePublished: "2023-11-07",
               url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/carrot-ginger-soup-with-orzo-and-kale/") ,
        
        Recipe(name: "Potato and Artichoke Heart Pasta Salad",
               image: "https://www.forksoverknives.com/uploads/artichoke-heart-and-pasta-salad-wordpress-scaled.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=700&dpr=2",
               description: "A creamy tofu dressing, featuring artichoke hearts, hearts of palm, and white wine vinegar, peps things up, while scallions and cherry tomatoes add texture and another layer of flavor.",
               ingredients: """
               1½ pounds potatoes, any variety, scrubbed and cut into 1-inch chunks
               2 cups dry whole grain pasta, any variety
               1 15-ounce can artichoke hearts, rinsed, drained and quartered lengthwise
               4 ounces hearts of palm, sliced (½ cup)
               1 cup cherry tomatoes, cut into halves
               2 stalks scallions (green onions), thinly sliced
               2 tablespoons finely chopped fresh dill (or 1 tablespoon dried dill weed)
               1 12-ounce package silken tofu, drained
               2½ tablespoons white wine vinegar
               2 small cloves garlic
               1½ teaspoons yellow mustard
               Sea salt
               ¼ to ½ cup unsweetened, unflavored plant-based milk
               """,
               directions: "Potato and pasta soak up a creamy dressing in this meal-worthy pasta salad. Hearts of palm and artichoke hearts add a nutty richness. ",
               category: "Salad",
               datePublished: "2020-06-16",
               url: "https://www.forksoverknives.com/recipes/vegan-salads-sides/potato-artichoke-heart-pasta-salad/") ,
        
        Recipe(name: "Purple Potato and Kale Salad with Cilantro-Tahini Dressing",
               image: "https://www.forksoverknives.com/uploads/Purple-Potato-and-Kale-Salad-large.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=700&dpr=2",
               description: "Purple potatoes, kale, and tomato offer a plate-of-many-colors in this vibrant potato salad that satisfies the eyes as well as the stomach. ",
               ingredients: """
               5 to 6 small purple potatoes
               2 cups kale, chopped
               ½ cup tomatoes, chopped
               1¾ teaspoons lime juice
               1 cup chopped cilantro, plus more for garnish
               1 clove garlic, peeled and chopped
               ¼ cup plus 2 tablespoons tahini
               ½ teaspoon salt, or to taste
               ⅛ teaspoon cayenne pepper, or to taste
               """,
               directions: "This is a colorful and richly flavored salad that’s fun to serve—the purple potatoes really give the dish a surprising look.",
               category: "Salad",
               datePublished: "2012-11-06",
               url: "https://www.forksoverknives.com/recipes/vegan-salads-sides/purple-potato-and-kale-salad-with-cilantro-tahini-dressing/") ,
        
        Recipe(name: "Harissa-Roasted Potato Salad",
               image: "https://www.forksoverknives.com/uploads/Harissa-Roasted-Potato-Salad-wordpress.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=700&dpr=2",
               description: "In this warmly spiced potato salad, rich flavors are achieved by coating cubed sweet potatoes and white potatoes in a smoky, sweet harissa spice blend before roasting. ",
               ingredients: """
               4 tablespoons lemon juice
               1 tablespoon tahini
               1 tablespoon salt-free harissa seasoning (such as Frontier brand)
               1½ lb. sweet potatoes, peeled and cut into ½-inch cubes
               1½ lb. russet potatoes, peeled and cut into ½-inch cubes
               ½ cup chopped onion
               ½ cup chopped red bell pepper
               ½ cup chopped celery
               ¼ cup chopped dried apricots
               ¼ cup aquafaba
               ¼ cup chopped fresh cilantro
               ¼ cup chopped fresh parsley
               2 tablespoons white wine vinegar
               2 teaspoons Dijon mustard
               2 teaspoons pure maple syrup
               1 clove garlic, minced
               Sea salt, to taste
               Freshly ground black pepper, to taste
               ¼ cup slivered almonds, toasted
               """,
               directions: "Harissa seasoning may become your new favorite ingredient after you get a taste of this irresistible potato salad. The Tunisian spice blend is loaded with the smoky, savory flavors of paprika, cumin, and red pepper, while ground coriander adds a hint of sweetness that makes anything you sprinkle burst with complex aromas.",
               category: "Salad",
               datePublished: "2022-08-03",
               url: "https://www.forksoverknives.com/recipes/vegan-salads-sides/harissa-roasted-potato-salad/") ,
        
        Recipe(name: "Yuca and Kale Salad",
               image: "https://www.forksoverknives.com/uploads/Yuca-salad-for-wordpress-scaled.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=700&dpr=2",
               description: "This scrumptious yuca salad is like a potato-free potato salad! Yuca is a tropical starchy root veggie (sometimes called cassava, manioc, or tapioca) and can be found in many supermarkets.",
               ingredients: """
               1 teaspoon baking soda
               1 lb. yuca, peeled and cut into 1-inch pieces (3 cups)
               2 cups finely chopped fresh kale
               2 cups chopped peeled English cucumber
               1 cup cherry tomatoes, halved
               ½ cup thinly sliced scallions (green onions)
               ½ cup fresh parsley or cilantro, finely chopped
               ¼ cup lemon juice
               1 fresh jalapeño chile pepper, seeded and finely chopped
               ½ teaspoon sea salt
               """,
               directions: "The tropical root vegetable yuca (sometimes labeled as cassava) adds satisfying starchiness to this chopped salad. Jalapeño adds a touch of spiciness; to further dial up the heat, include some of the jalapeño seeds. ",
               category: "Salad",
               datePublished: "2020-02-03",
               url: "https://www.forksoverknives.com/recipes/vegan-salads-sides/yuca-salad/") ,
        
        Recipe(name: "Taco Lettuce Wraps with Melon Salsa",
               image: "https://www.forksoverknives.com/uploads/Taco-Lettuce-Wraps-with-Melon-Salsa-wordpress.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=367&dpr=2",
               description: "Fresh and filling, these taco lettuce wraps infuse chewy quinoa and hearty pinto beans with your favorite Mexican flavors to create a…",
               ingredients: """
               1½ cups dry tricolor quinoa
               1 cup fresh or frozen sweet corn kernels
               1 cup chopped red onion
               3 cloves garlic, minced
               2 tablespoons salt-free taco seasoning
               1 15-oz. can no-salt-added pinto beans, rinsed and drained (1½ cups)
               Sea salt, to taste
               Freshly ground black pepper, to taste
               2 cups chopped cantaloupe
               1 cup fresh salsa or pico de gallo
               1 fresh jalapeño chile, seeded and finely chopped
               2 tablespoons chopped fresh mint
               2 tablespoons lime juice
               12 to 16 green-leaf lettuce leaves
               1 avocado, halved, seeded, peeled, and thinly sliced
               """,
               directions: "Fresh and filling, these taco lettuce wraps infuse chewy quinoa and hearty pinto beans with your favorite Mexican flavors to create a delicious handheld meal.",
               category: "Wraps",
               datePublished: "2023-11-22",
               url: "https://www.forksoverknives.com/recipes/vegan-burgers-wraps/taco-lettuce-wraps-with-melon-salsa/") ,
        
        Recipe(name: "Curry Chickpea Lettuce Wraps",
               image: "https://www.forksoverknives.com/uploads/Curried-Chickpea-Salad-Wraps-wordpress.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=367&dpr=2",
               description: "Need a healthy, hunger-busting lunch recipe that will keep you full until dinnertime? These delightful chickpea wraps will do the trick. Each…",
               ingredients: """
               2 15-oz. cans no-salt-added chickpeas, drained and liquid (aquafaba) reserved
               ½ cup chopped celery
               ½ cup chopped red bell pepper
               ½ cup dried cranberries
               4 scallions, sliced
               Sea salt, to taste
               Freshly ground black pepper, to taste
               Red leaf or bibb lettuce leaves
               2 tablespoons chopped pecans, toasted
               Crispbread crackers (optional)
               """,
               directions: "Need a healthy, hunger-busting lunch recipe that will keep you full until dinnertime? These delightful chickpea wraps will do the trick.",
               category: "Wraps",
               datePublished: "2023-05-10",
               url: "https://www.forksoverknives.com/recipes/vegan-burgers-wraps/curry-chickpea-lettuce-wraps/"),
        
    ]
    
}
