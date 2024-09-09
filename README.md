## BudgetBuddy 💰

BudgetBuddy is a simple SwiftUI application designed to help users manage their budget categories and track transactions within each category.

## Features ✨

-   **Budget Category Management:**
    
    -   Create new budget categories with a title and a total budget amount.
    -   View a list of existing budget categories with their total budgets and remaining/overspent amounts.
    -   Edit existing budget categories.
    -   Delete budget categories.
-   **Transaction Tracking:**
    
    -   Within each budget category, add transactions with a title and an amount.
    -   View a list of transactions for each budget category.
    -   Delete transactions.
-   **Budget Summary:**
    
    -   See a summary of the remaining or overspent amount for each budget category.
    -   Visual indicators (green for remaining, red for overspent) provide quick feedback on budget status.

## Skills and Techniques Demonstrated 🧠

-   **SwiftUI:** The entire app's user interface is built using SwiftUI, showcasing the declarative and composable nature of SwiftUI development.
    
-   **Core Data:** The app utilizes Core Data for persistent data storage. It demonstrates:
    
    -   Creating and managing Core Data entities (`BudgetCategory` and `Transaction`).
    -   Establishing relationships between entities (one-to-many relationship between `BudgetCategory` and `Transaction`).
    -   Fetching data from Core Data using `@FetchRequest` and `NSFetchRequest`.
    -   Saving and deleting data in Core Data.
-   **Navigation:** The app uses `NavigationStack` and `NavigationLink` to enable navigation between views, allowing users to drill down into budget category details and add/edit transactions.
    
-   **State Management:** `@State` and `@ObservedObject` are used to manage the app's UI state and react to changes in data.
    
-   **Data Validation:** The app includes basic form validation to ensure that users enter valid data when creating or editing budget categories and transactions.
    
-   **Custom Extensions:** The codebase demonstrates the use of custom extensions to enhance existing types (e.g., `NumberFormatter` extension for currency formatting).
    
-   **Error Handling:** The app includes basic error handling with `do-catch` blocks to gracefully handle potential Core Data errors.
    

## Potential Enhancements 🧩

-   **More Robust Error Handling:** Implement more comprehensive error handling and user feedback for potential issues like Core Data save failures or invalid user input.
-   **Charts and Visualizations:** Add charts or graphs to visualize budget data and spending patterns over time.
-   **Cloud Syncing:** Integrate with iCloud or other cloud services to enable data synchronization across multiple devices.
-   **Notifications and Reminders:** Implement notifications or reminders to help users stay on top of their budgets.
-   **Customizable Categories and Icons:** Allow users to customize budget category names and associate icons with them.

