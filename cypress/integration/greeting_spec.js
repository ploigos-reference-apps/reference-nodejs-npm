describe('Home Page', () => {
  it('Says Hello', () => {
    cy.visit('/')

    cy.get('#name').type('Everyone')

    cy.get('#invoke').click()

    cy.get('#greeting-result').should('contain', 'Hello, Everyone')
  })
})

