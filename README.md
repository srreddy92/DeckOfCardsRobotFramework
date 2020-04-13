DeckOfCards API automation
An API to simulate a deck of cards

The docs are on http://deckofcardsapi.com

Install
-------
This project requires Python 3.x and the following Python libraries installed:
```
Install latest version of Python
pip3 install –r Requirements.txt
```
Code
-----
Template code is provided in DeckOfCardsAPI.robot. You need to include ComFinra library(which is already packaged) to the resource file to use http methods GET/POST. 
Run
-----
In a terminal or command window, navigate to the top-level project directory DeckOfCards(that contains this README) and run one of the following commands:
```
robot -T DeckOfCardsAPI.robot 
```
This will execute the test cases and report will be generated.
Open log.html to view the results.



