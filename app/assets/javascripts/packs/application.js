import Rails from "@rails/ujs";
import "bootstrap";

import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";
//= require cocoon


document.addEventListener("DOMContentLoaded", () => {
  Rails.start();

  // Handle click on item details link
  document.querySelectorAll(".item-details-link").forEach(link => {
    link.addEventListener("ajax:success", (event) => {
      const [data, status, xhr] = event.detail;
      document.getElementById("itemDetailsContent").innerHTML = xhr.response;
      document.getElementById("itemDetailPanel").classList.add("show");
    });

    link.addEventListener("ajax:error", (event) => {
      console.error("Error fetching item details");
      // Handle error if needed
    });
  });

  // Close panel button
  document.getElementById("closePanel").addEventListener("click", () => {
    document.getElementById("itemDetailPanel").classList.remove("show");
  });
});
