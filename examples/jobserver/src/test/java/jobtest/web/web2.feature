Feature: web 2

Scenario: try to login to github
    and then do a google search

  Given driver 'https://github.com/login'
  And input('#login_field', 'dummy')
  And input('#password', 'world')
  When submit().click("input[name=commit]")
  Then match html('.flash-error') contains 'Incorrect username or password.'
  
  Given driver 'https://google.com'
  And input("textarea[name=q]", 'karate dsl')
  When submit().click("input[name=btnI]")
  Then waitForUrl('https://github.com/karatelabs/karate')
