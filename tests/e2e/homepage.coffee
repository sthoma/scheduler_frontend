describe 'mainController', ->

  it 'the dom initially has a greeting', ->
    browser.get 'http://localhost:8888/'
    expect(element(By.id('hello-word')).getText()).toEqual 'Hello World!'
