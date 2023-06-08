*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login
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
    Click Element    css=.hero__button

    Input Text    id=sign-up__first-name    Andrei
    Input Text    id=sign-up__last-name    Psarev
    Input Text    id=sign-up__email    psarevandrej327@gmail.com

    Input Password    id=sign-up__password    Fylhtq2001!
    Input Password    id=sign-up__confirm-password    Fylhtq2001!

    Click Element    css=.form__button

    Click Element    css=.alert__button
