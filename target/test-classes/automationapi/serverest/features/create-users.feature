Feature: Create User

  Background:
    * url baseUrl
    * def gen = read('classpath:automationapi/serverest/data/helpers/dataGenerator.js')
    * def nomeUsuario = gen.randomName()
  @create-test-01
  Scenario: Create User with email invalid
    * def body =
      """
      {
        "nome": "#(nomeUsuario)",
        "email": "aaaa@....com",
        "password": "1234",
        "administrador": "true"
      }
      """
    Given path 'usuarios'
    And request body
    When method post
    Then status 400
    And match response.email == "email deve ser um email válido"


  @create-test-02
  Scenario: Create User
    * def body =
      """
      {
        "nome": "#(nomeUsuario)",
        "email": "#(gen.randomEmail(nomeUsuario))",
        "password": "1234",
        "administrador": "true"
      }
      """
    Given path 'usuarios'
    And request body
    When method post
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"


