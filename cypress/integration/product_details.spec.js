
describe('example to-do app', () => {
    beforeEach(() => {
        cy.visit('http://0.0.0.0:3000/')
    });
    
    it("Visits the webpage", () => {
        cy.visit('http://0.0.0.0:3000/')    
    });

    it("There is 12 products on the page", () => {
        cy.get(".products article").should("have.length", 12);
    });

    it("Navigate directly to a product detail page", () => {
        cy.get(".products article").first()
        .click()
    })

});