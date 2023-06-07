*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Disabled Registration
    Open Browser    http://127.0.0.1:7000/    chrome    
    Set Window Size    974    1040
    Click Element    css=.hero__button
    Input Text    id=sign-up__first-name    Andrii
    Input Text    id=sign-up__last-name    Psarov
    Input Text    id=sign-up__password    gdfhderfh
    Click Element    css=.form__button
    ${feedback}    Get Text    css=.form__row:nth-child(4) > .form__feedback
    Should Be Equal As Strings    ${feedback}    Enter a valid email
    [Teardown]    Close Browser

Login
    Open Browser    http://127.0.0.1:7000/    chrome    
    Set Window Size    974    1040

    Wait Until Element Is Visible    link=Sign in
    Click Element    link=Sign in

    Wait Until Element Is Visible    id=sign-in__email
    Input Text    id=sign-in__email    psarevandrej325@gmail.com

    Wait Until Element Is Visible    id=sign-in__password
    Input Password    id=sign-in__password    Fylhtq2001!

    Wait Until Element Is Visible    css=.form__button
    Click Element    css=.form__button

    Wait Until Page Contains    Home | Universe

Successful Add Blog Post
    Open Browser    http://127.0.0.1:7000/    chrome
    Set Window Size    974    1040

    Wait Until Element Is Visible    link=Sign in
    Click Element    link=Sign in

    Wait Until Element Is Visible    id=sign-in__email
    Input Text    id=sign-in__email    psarevandrej325@gmail.com

    Wait Until Element Is Visible    id=sign-in__password
    Input Password    id=sign-in__password    Fylhtq2001!

    Wait Until Element Is Visible    css=.form__button
    Click Element    css=.form__button

    Wait Until Element Is Visible    link=Read more
    Click Element    link=Read more

    Wait Until Element Is Visible    css=.comment-form__textarea
    Input Text    css=.comment-form__textarea    new comment

    Wait Until Element Is Visible    css=.comment-form__button:nth-child(1)
    Click Element    css=.comment-form__button:nth-child(1)

Successful Add Comment
    Open Browser    http://127.0.0.1:7000/    chrome
    Set Window Size    974    1040

    Wait Until Page Contains Element    link=Sign in
    Click Element    link=Sign in

    Wait Until Page Contains Element    id=sign-in__email
    Input Text    id=sign-in__email    psarevandrej325@gmail.com

    Wait Until Page Contains Element    id=sign-in__password
    Input Password    id=sign-in__password    Fylhtq2001!

    Wait Until Page Contains Element    css=.form__button
    Click Element    css=.form__button

    Wait Until Page Contains Element    link=New post
    Click Element    link=New post



Successful Registration
    Open Browser    http://127.0.0.1:7000/    chrome
    Set Window Size    974    1040

    Click Element    css=.hero__button

    Input Text    id=sign-up__first-name    Andrei
    Input Text    id=sign-up__last-name    Psarev
    Input Text    id=sign-up__email    psarevandrej327@gmail.com

    Input Password    id=sign-up__password    Fylhtq2001!
    Input Password    id=sign-up__confirm-password    Fylhtq2001!

    Click Element    css=.form__button

    Click Element    css=.alert__button
