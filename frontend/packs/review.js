class addReview {
  constructor() {
    this.reviewResult = document.querySelector("#review_result");
    this.stars        = document.querySelectorAll(".stars i");
    this.postButton   = document.getElementById("post_review");
    this.csrfToken    = document.querySelector("[name='csrf-token']").content;
    this.iterateClickHandlers();
  }

  postReview(recipeId, rating) {
    fetch("/reviews", {
      method: "POST",
      headers: {
        'content-type': 'application/json',
        'X-CSRF-Token': this.csrfToken
      },
      body: JSON.stringify({
        recipe_id: recipeId,
        rating: rating
      })
    }).then(response => {
      if (!response.ok) { throw response; }
      return response.json()
    }).then((data) => {
      console.log(data)
      this.reviewResult.textContent = data;
    }).catch(error => {
      console.error("error", error)
    })
  }

  startReview(element, recipeId) {
    const reviewCount       = document.querySelector("#review_count");
    const postButton        = document.getElementById("post_review");
    const starClassActive   = "bi-star-fill";
    const starClassUnactive = "bi-star";
    let count               = Array.from(this.stars).indexOf(element) + 1;
    let rating              = this.reviewResult.dataset.rating;
    sessionStorage.star     = count;

    this.stars.forEach((star, index) => {
      if (index < count) {
          star.classList.replace(starClassUnactive, starClassActive)
      } else {
          star.classList.replace(starClassActive, starClassUnactive)
      }
    })

    rating = count;
    postButton.classList.remove('disabled');

    postButton.addEventListener("click", (event) => {
      event.preventDefault();

      this.postReview(recipeId, rating);
      reviewCount.dataset.reviewCount = parseInt(reviewCount.dataset.reviewCount) + 1;
      reviewCount.textContent = `(${reviewCount.dataset.reviewCount} Bewertungen)`
      sessionStorage.setItem('ReviewOnce','true');
      sessionStorage.setItem('RecipeId', recipeId);
      this.postButton.remove()
    })
  }

  iterateClickHandlers() {
    if (!this.reviewResult) {return}

    const recipeId = this.reviewResult.dataset.recipeId;

    if (sessionStorage.getItem('ReviewOnce') === 'true' && sessionStorage.getItem('RecipeId') === recipeId) {
      this.postButton.remove()
      return
    }

    this.stars.forEach((element) => {
      element.addEventListener("click", (event) => {
        event.preventDefault();

        this.startReview(element, recipeId)
      })
    })
  }
}

window.addEventListener("turbolinks:load", () => new addReview);
