import "@stripe/stripe-js";

const buttons = document.querySelectorAll(".stripe");
buttons.forEach((button) => {
  button.addEventListener("click", (e) => {
    const id = e.target.dataset.id
    fetch(`/payments?id=${id}`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((res) => {
        return res.json();
      })
      .then((data) => {
        const stripe = Stripe(
          "pk_test_51Hh0orKL4jTADfFod2j1PRBdOLlGRr1wbGgfGgs1KnC7VjNJxAJOIEbUC47trUphJw8VsAZ5N4kSNdfKA8FvgaVy00CkIT0WN8"
        );
        stripe.redirectToCheckout({
          sessionId: data.id,
        });
      })
      .catch((err) => {
        console.log(err.message);
      });
  });
});