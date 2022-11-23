
describe('Jungle app', () => {
    beforeEach(() => {
        cy.visit('http://0.0.0.0:3000/')
    });
    
    it("Visits the webpage", () => {
        cy.visit('http://0.0.0.0:3000/')    
    });

    it("There is 2 products on the page", () => {
        cy.get(".products article").should("have.length", 2);
    });

    it("Increase the count of the cart button when adding products to it", () => {

        cy.contains('My Cart (0)').should('exist')
        
        cy.get(".products article")
            .first()
            .contains("Add")
            .click({ force: true })
        

        cy.contains('My Cart (1)').should('exist')
        
    })

});