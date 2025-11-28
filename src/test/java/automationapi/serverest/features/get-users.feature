Feature: Get Users

  Background: :
    * url baseUrl
    * def schemaUsuario = read('classpath:automationapi/serverest/data/schemas/usuario-schema.json')

  @get-test-01
  Scenario: Get All users
    Given print 'rul:', baseUrl
    Given path '/usuarios'
    When method get
    Then status 200
    And match each response.usuarios == schemaUsuario