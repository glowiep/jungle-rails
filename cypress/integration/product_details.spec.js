describe("Product Details", () => {
  it("should visit the home page", () => {
    cy.visit('/');
  });

  it("Opens the  product detail page after clicking on the product", () => {
    cy.contains('Scented Blade')
    .should('be.visible')
      .click({ force: true });
    
    cy.url()
      .should("include", "/products");
  });
});