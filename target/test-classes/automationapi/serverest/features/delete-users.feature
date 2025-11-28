Feature: Delete User

  Background:
    * url baseUrl

  @delete-test-01
  Scenario: Delete User Success
    * def nuevo = call read('classpath:automationapi/serverest/features/create-users.feature')
    * def id = nuevo.response._id

    Given path 'usuarios/', id
    When method delete
    Then status 200
    And match response.message == "Registro excluído com sucesso"
