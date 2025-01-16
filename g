    <script>
        function updateCharges() {
            const amountInput = document.getElementById('amount');
            const processingCharge = document.getElementById('processing-charge');
            const totalAmount = document.getElementById('total-amount');
            const errorMessage = document.getElementById('error-message');

            let amount = parseFloat(amountInput.value) || 0;

            if (amount < 30) {
                errorMessage.textContent = "Minimum deposit is $30.";
                processingCharge.textContent = "$0.00";
                totalAmount.textContent = "$0.00";
                return;
            } else if (amount > 1000) {
                errorMessage.textContent = "Maximum deposit is $1000.";
                processingCharge.textContent = "$0.00";
                totalAmount.textContent = "$0.00";
                return;
            }

            errorMessage.textContent = "";
            let charges = (amount * 0.02).toFixed(2); // 2% charges
            let total = (amount - charges).toFixed(2);

            processingCharge.textContent = `$${charges}`;
            totalAmount.textContent = `$${total}`;
        }

        function handlePaymentOptionChange(event) {
            const paymentOptions = document.querySelectorAll('.payment-option');
            paymentOptions.forEach(option => {
                option.classList.remove('crypto');
            });

            const selectedOption = event.target.closest('.payment-option');
            if (selectedOption) {
                const labelText = selectedOption.querySelector('label').textContent.toLowerCase();
                if (labelText.includes('btc') || labelText.includes('binance') || labelText.includes('blockchain') || labelText.includes('btcpay')) {
                    selectedOption.classList.add('crypto');
                }
               
            }
        }

        window.addEventListener('DOMContentLoaded', () => {
            const paymentOptions = document.querySelectorAll('.payment-option input');
            paymentOptions.forEach(option => {
                option.addEventListener('change', handlePaymentOptionChange);
            });
        });
    </script>