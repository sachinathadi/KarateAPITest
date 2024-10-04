Feature: Json Server crud test

Background: api end point url
    * url 'http://localhost:3000/posts'
    #baseUrl value is coming from karate-config.js file added under class path.These variable values
    #added under this config file can be used across feature files in the project.
    #* url baseUrl # * catch all symbol which is Given/then/when. Given/then/when/And has same functionality, using it to make more readable  

@ignore
Scenario: create a new post

 Given url "http://localhost:3000/posts"
 And request {"title": "post method","views": 1000}
 When method post
 Then status 201
 
 #this can be changed to as URL is already mentioned in Background
 #Given request {"title": "post method,"views": 1000}
 #When method post
 #Then status 201
 
@ignore
Scenario: get created post details
     #Hitting post request
    Given url 'http://localhost:3000/posts'
    And request {"title": "post and get","views": 1000}
    When method post
    Then status 201
    
     #Printing response of post request
    And print 'response is:', response
    
     #Defining variable postId and storing value of id from response in it
    And def postId = response.id
    
     #Hitting get request
    Given url 'http://localhost:3000/posts'
    
     #using variable postId as path parameter
    And path postId
    When method get
    Then status 200
    
     #Printing response of get request
    And print 'response is:', response
    
#Scenario: update created post details
    #Given url 'http://localhost:3000/posts'
    #Given request {"title": "put request","views": 500}
    #When method post
    #Then status 201
    #And print 'response is:', response
    #And def postId = response.id
    #Given url 'http://localhost:3000/posts'
    #And path postId
    #And request {"title": "updated put request,"author": "views changed to author"}
    #When method put  #update data
    #Then status 200
    #And print 'response is:', response
    
    
 #Scenario: partial update of created post details
    #Given url 'http://localhost:3000/posts'
    #Given request {"title": "patch req","view": 200}
    #When method post
    #Then status 201
    #And print 'response is:', response
    #And def postId = response.id
    #Given url 'http://localhost:3000/posts'
    #And path postId
    #And request {"title": "patch req","view": 400}
    #When method patch # updating post details by passing payload with partial change
    #Then status 200
    #And print 'response is:', response

    
Scenario: deleting created post details
    #Given url 'http://localhost:3000/posts'
    When request {"title": "delete req","author": "sac"}
    When method post
    Then status 201
    And print 'response is:', response
    And def postId = response.id
    Given url 'http://localhost:3000/posts'
    And path postId
    When method delete     # removing created post details using delete method
    Then status 200