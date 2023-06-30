# Martial Arts Mobile iOS App

Created for the World Tang Soo Do Association to provide standardized syllabus and journal to track class attendance, practice sessions, and tournament information. 

## Login Page
* Uses SceneDelegate to change root view controller in displaying login page (ensures no unnecessary stacking and memory usage)
* Scaffolding for sign in validation and create account functionality (not yet implemented)

## Home Page 
* Filters content based on user's rank, stored via UserDefaults class
* Dynamic tableView (static content) with custom tableViewCell

## Journal Page 
* Dynamic tableView with sections (divided by date) and custom tableViewCell
* Add, remove, and filter functionality that persists 
* Uses Core Data framework to persist entries and associated notes entered by user 

## Profile Page 
* Static tableView displaying user information, stored via UserDefaults class
* Editable profile information that persists

## Other
* Universal app theme in Theme.swift file to standardize app color scheme 
* Class extentions to views, buttons, textFields, etc. to standardize objects appearance
* Thorough user input validation with custom, informative alerts and visual indicators 
