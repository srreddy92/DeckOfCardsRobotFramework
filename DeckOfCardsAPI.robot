*** Settings ***
Resource          Resource.txt

*** Variables ***
Set Suite Variable    ${responsecode}

*** Test Cases ***
Create new Deck
    ${d}=    Create Dictionary    jokers_enabled    true
    ${result}=    Http Get Robot    https://deckofcardsapi.com/api/deck/new    ${d}
    log    ${result}
    Http Get Status    200
    Http Responsebody Should Contain    'remaining': 54
    ${result2}=    Get Elements    ${result}    "deck_id"
    ${deckId}    Get From List    ${result2}    0
    Set Suite Variable    ${deckId}
    log    ${deckId}

Draw Cards
    ${result}=    Http Get Robot    https://deckofcardsapi.com/api/deck/${deckId}/draw/
    log    ${result}
    Http Get Status    200
    Http Responsebody Should Contain    'remaining': 53
    ${cards}=    Get Elements    ${result}    "cards"
    ${cardsresponse}    Get From List    ${cards}    0
    ${count}=    Get Length    ${cardsresponse}
    log    ${count}
    Should Be Equal As Strings    ${count}    1
    ###############draw multiple cards############################
    ${responseofmultiplecards}=    Http Get Robot    https://deckofcardsapi.com/api/deck/${deckId}/draw/?count=2
    log    ${responseofmultiplecards}
    Http Get Status    200
    Http Responsebody Should Contain    'remaining': 51
    ${result2}=    Get Elements    ${responseofmultiplecards}    "deck_id"
    ${Deck_id}    Get From List    ${result2}    0
    log    ${Deck_id}
    Should Be Equal As Strings    ${Deck_id}    ${deckId}
    ${multiplecards}=    Get Elements    ${responseofmultiplecards}    "cards"
    ${multiplecardsresponse}    Get From List    ${multiplecards}    0
    log    ${multiplecardsresponse}
    ${count1}=    Get Length    ${multiplecardsresponse}
    log    ${count}
    Should Be Equal As Strings    ${count1}    2

Create new Deck API sending jokers_enabled false
    ${d}=    Create Dictionary    jokers_enabled    false
    ${result}=    Http Get Robot    https://deckofcardsapi.com/api/deck/new    ${d}
    log    ${result}
    Http Get Status    200
    Http Responsebody Should Contain    'remaining': 52

Error Handling Draw cards api by sending invalid deck_id
    ${result}=    Http Get Robot    https://deckofcardsapi.com/api/deck/1234/draw
    log    ${result}
    Http Get Status    500
