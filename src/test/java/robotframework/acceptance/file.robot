*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Disabled Registration
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary    first_name=Andrii    last_name=Psarov    password=gdfhderfh
    ${response}=    Post Request    http://127.0.0.1:7000/register    headers=${headers}    json=${payload}
    Should Be Equal    ${response.status_code}    200
    ${json_response}=    Get Json Value    ${response.content}    as_dict=True
    Should Be Equal As Strings    ${json_response.error}    "Enter a valid email"

Login
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary    email=psarevandrej325@gmail.com    password=Fylhtq2001!
    ${response}=    Post Request    http://127.0.0.1:7000/login    headers=${headers}    json=${payload}
    Should Be Equal    ${response.status_code}    200
    ${json_response}=    Get Json Value    ${response.content}    as_dict=True
    Should Be Equal As Strings    ${json_response.message}    "Login successful"

Successful Add Blog Post
    ${headers}=    Create Dictionary    Content-Type=application/json    
    ${payload}=    Create Dictionary    title=My Blog Post    content=Lorem ipsum dolor sit amet
    ${response}=    Post Request    http://127.0.0.1:7000/posts    headers=${headers}    json=${payload}
    Should Be Equal    ${response.status_code}    201
    ${json_response}=    Get Json Value    ${response.content}    as_dict=True
    Should Be Equal As Strings    ${json_response.title}    "My Blog Post"

Successful Add Comment
    ${headers}=    Create Dictionary    Content-Type=application/json    
    ${payload}=    Create Dictionary    post_id=123    comment=This is my comment
    ${response}=    Post Request    http://127.0.0.1:7000/comments    headers=${headers}    json=${payload}
    Should Be Equal    ${response.status_code}    201
    ${json_response}=    Get Json Value    ${response.content}    as_dict=True
    Should Be Equal As Strings    ${json_response.comment}    "This is my comment"

Successful Registration
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary    first_name=Andrei    last_name=Psarev    email=psarevandrej327@gmail.com    password=Fylhtq2001!
    ${response}=    Post Request    http://127.0.0.1:7000/register    headers=${headers}    json=${payload}
    Should Be Equal    ${response.status_code}    200
    ${json_response}=    Get Json Value    ${response.content}    as_dict=True
    Should Be Equal As Strings    ${json_response.message}    "Registration successful"
