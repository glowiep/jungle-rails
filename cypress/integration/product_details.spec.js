describe("Product Details", () => {
  it("should visit the home page", () => {
    cy.visit('/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Opens the  product detail page after clicking on the product", () => {
    cy.contains('Scented Blade')
      .should('be.visible')
      .click({ force: true });
    
    cy.url()
      .should("include", "/products");
  });
});