$(document).ready(function() {
	
	$('#order_quantity').focusout(calculateTotal)
})

function calculateTotal()
{
	var qty = $(this).val();
	qty = Math.floor(qty);
	$(this).val(qty);
	var total = price * qty;
	$('#order_total').text("$" + total.toFixed(2));

}
