# StockMarketSimulationIOS
Simple WIP iOS application for trading fake money in the real stock exchange.

## Goals
### The Problem
The stock market has gained a large popularity due to popular trading applications such as Robinhood or Webull.
However, many first time investors know little when it comes to investing basics. This leads to people risking
thousands of real dollars in learning the basics. This is essentially gambling because no clear alternatives
are marketed to them.

## The Solution
This application allows users to trade in the stock market with fake money. While this is already a thing
in many other apps, it fails to utilize real-time market trading. This application hopes to allow
buying, selling, short-selling, advanced statistics, and in-depth analytics of a users profile. 
With these functionalities, this app hopes to allow users the same experience as other services, but without
the glamorous riches that comes with real money.

## Problems
- The main issue with this program is the backend API Rate Limiting. If you want to explore this issue more, please see the backend hosted repo below.
- UI is quite ugly. The searching stocks page needs a UI overhaul.
- If stock price is not waited for and updated appropriately, the total price of purchasing a stock will be off. While it will not effect the actual purchase price, the visual price will be off.
- Registration should be more strict in validation purposes. Such as increasing the password strength needed. 
- Viewing all stocks searched is handled on a background thread and is not properly dispatched to the main thread. This needs to be fixed. 

## To-Do
- Make UI better looking across all pages.
- Add in depth charts of portfolio, stocks, and history of exchanges.
- Add function to start with whatever amount of money the user wants.
- Add news section.
- Add reset option.
- Add password changing functionality.
- Add contact us functionality.
- Add profile viewing functionality.

## Pre Requisites
- Basic knowledge of HTTP requests and bearer tokens.
- Experience with Swift-UI/Swift
- Determination :)

## Set Up
1. Open the Terminal app on your Mac.
2. Navigate to the directory where you want to save the project using the cd command.
3. Clone the project repository using the git clone command followed by the URL of the remote repository. For example, You can type git clone https://github.com/mikerasch/StockMarketSimulationIOS for this repository.
4. Enter your GitHub username and password if prompted.
5. Once the project is cloned, you should see a new directory with the project name in your current directory.
6. Open the project in Xcode by double-clicking on the .xcodeproj file.

Additionally, you can clone the project VIA XCode or a 3rd party git platform such as GitKraken.

Regardless of what you do, you will need the spring boot backend server which can be located here: https://github.com/mikerasch/StockMarketGameSimulation

## Technologiese Used
- Swift UI

## Resources
- [Apple Website](https://developer.apple.com/xcode/swiftui)
- [Swift UI Learning - Free](https://developer.apple.com/tutorials/swiftui)
- [Swift UI Learning - Paid](https://www.kodeco.com/)
