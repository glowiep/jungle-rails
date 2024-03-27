describe("Add to cart", () => {
  it("should visit the home page", () => {
    cy.visit('/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should be able to click 'Add to Cart' button", () => {
    cy.get('.products article')
      .first()
      .find('.btn')
      .should("be.visible")
      .click({ force: true })
  });

  it("should increase the cart item count by 1", () => {
    cy.contains('My Cart (1)')
      .should("be.visible")
  });
});