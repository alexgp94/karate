Feature: Update User

  Background:
    * url baseUrl
  @update-test-01
  Scenario: Update User existent
    * def nuevo = call read('classpath:automationapi/serverest/features/create-users.feature')
    * def id = nuevo.response._id
    * def gen = read('classpath:automationapi/serverest/data/helpers/dataGenerator.js')
    * def nomeUsuario = gen.randomName()

    * def body =
      """
      {
        "nome": "#(nomeUsuario)",
        "email": "#(gen.randomEmail(nomeUsuario))",
        "password": "123456",
        "administrador": "true"
      }
      """

    Given path 'usuarios/', id
    And request body
    When method put
    Then status 200
    And match response.message == "Registro alterado com sucesso"
