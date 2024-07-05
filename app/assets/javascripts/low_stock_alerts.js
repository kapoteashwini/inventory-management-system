document.addEventListener("DOMContentLoaded", function() {
  function fetchLowStockProducts() {
    fetch('/products/low_stock')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        if (data.length > 0) {
          showLowStockAlerts(data);
        }
      })
      .catch(error => {
        console.error('Error fetching low stock products:', error);
        // Optionally, display an error message to the user in the UI
      });
  }

  function showLowStockAlerts(products) {
    const alertContainer = document.getElementById('low-stock-alerts');
    alertContainer.innerHTML = '';

    products.forEach(product => {
      const alertMessage = `<div class="alert alert-warning" role="alert">
                              Low stock alert for ${product.name}. Quantity: ${product.quantity}
                            </div>`;
      alertContainer.innerHTML += alertMessage;
    });
  }

  fetchLowStockProducts();
  setInterval(fetchLowStockProducts, 300000); // Fetch every 5 minutes
});
