
describe('Jungle app', () => {
    beforeEach(() => {
        cy.visit('http://0.0.0.0:3000/')
    });
    
    it("Visits the webpage", () => {
        cy.visit('http://0.0.0.0:3000/')    
    });

    it("There is 12 products on the page", () => {
        cy.get(".products article").should("have.length", 12);
    });

});