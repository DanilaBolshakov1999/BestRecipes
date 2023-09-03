//
//  Contact.swift
//  CHALLENGE_2_Best_Recipes
//
//  Created by iOS - Developer on 27.08.2023.
//

import UIKit

enum Theme {
    
    //MARK: Images
    static let backgroundImageFirst = "firstImage"
    static let fishRecipeDetail = "fishRecipeDetail"
    static let videoScreen = "videoScreen"
    static let star = "star"
    static let favoritesActive = "FavoritesActive"
    
    //MARK: - cellIdentifier
    static let cellIdentifier = "MessageCell"
    static let cellId = "Cell"
    
    
    //MARK: - Color
    static let redColor = "redColor"
    static let brownColor = "brownColor"
    static let whiteColor = "whiteColor"
	static let primary20 = "primary20"
	static let primary50 = "primary50"
	static let neutral10 = "neutral10"
	static let neutral30 = "neutral30"
	static let neutral100 = "neutral100"
    
    //MARK: Font
    enum Fonts {
        static let appFont: String = "Poppins-Regular"
        static let blackFont: String = "Poppins-Black"
        static let blackItalicFont: String = "Poppins-BlackItalic"
        static let boldFont: String = "Poppins-Bold"
        static let boldItalicFont: String = "Poppins-BoldItalic"
        static let extraBoldFont: String = "Poppins-ExtraBold"
        static let extraBoldItalicFont: String = "Poppins-ExtraBoldItalic"
        static let extraLightFont: String = "Poppins-ExtraLight"
        static let extraLightItalicFont: String = "Poppins-ExtraLightItalic"
        static let italicFont: String = "Poppins-Italic"
        static let lightFont: String = "Poppins-Light"
        static let lightItalicFont: String = "Poppins-LightItalic"
        static let mediumFont: String = "Poppins-Medium"
        static let mediumItalicFont: String = "Poppins-MediumItalic"
        static let semiBoldFont: String = "Poppins-SemiBold"
        static let semiBoldItalicFont: String = "Poppins-SemiBoldItalic"
        static let thinFont: String = "Poppins-Thin"
        static let thinItalicFont: String = "Poppins-ThinItalic"
    }
    
    //MARK: TabBarIcons
    static let bell = "Bell"
    static let home = "Home"
    static let profile = "Profile"
    static let favorite = "Favorites"
    
    //MARK: Cell Identifier
    static let popular = "PopularCollectionViewCell"
    static let instructions = "InstructionsCollectionViewCell"
    static let ingredients = "IngredientsCollectionViewCell"
    static let header = "HeaderSupplementaryView"
    static let trending = "TrendingCollectionViewCell"
    static let savedDish = "SavedDishesCollectionView"
    
    //MARK:  UINavBar
    static let backSwipe = "backSwipe"
    static let moreSwipe = "moreSwipe"
    
    //MARK: Custom Text Filed
    static let textViewText = """
                        1. Place eggs in a saucepan and cover
                        with cold water. Bring water to a
                        boil andimmediately remove from heat.
                        Cover and let eggs stand in hot water
                        for 10 to 12 minutes. Remove from hot
                        water, cool, peel, and chop.
                        2. Place chopped eggs in a bowl.
                        3. Add chopped tomatoes, corns, lettuce,
                        and any other vegitable of your choice.
                        4. Stir in mayonnaise, green onion, and
                        mustard. Season with paprika, salt, and
                        pepper.
                        Stir and serve on your favorite bread or
                        crackers.
                        """
    
    static let mainView = """
                        How to make Tasty Fish
                        (point & Kill)
                        """
}
