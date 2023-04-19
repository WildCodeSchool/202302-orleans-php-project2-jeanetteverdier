// * BURGER *

const hamburgerButton = document.querySelector(".nav-toggler");
const navigation = document.querySelector("nav");

hamburgerButton.addEventListener("click", toggleNav);

function toggleNav() {
    hamburgerButton.classList.toggle("active");
}

// * NAVBAR LIST *

function toggleMenu() {
    const navbar = document.querySelector(".navbar-list");
    const burger = document.querySelector(".btn-burger");
    burger.addEventListener("click", () => {
        navbar.classList.toggle("show-nav");
    });
}
toggleMenu();
