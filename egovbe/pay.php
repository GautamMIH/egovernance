<?php 
if(isset($GET['bid']){
    $billId = $GET['bid'];
    include('dbconnet.php');

    echo '
						</form>
						<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
							<input type="hidden" name="cmd" value="_cart">
							<input type="hidden" name="business" value="sb-frrxr26161974@business.example.com">
							<input type="hidden" name="upload" value="1">';
							  
							$x=0;
							$sql = "SELECT Bamount FROM bill WHERE bid = '$billId'";
							$query = mysqli_query($conn,$sql);
							while($row=mysqli_fetch_array($query)){
								$x++;
								echo  	
									'<input type="hidden" name="Bamount'.$x.'" value="'.$row["Bamount"].'">
								}';
							  
							echo   
								'<input type="hidden" name="return" value="http://localhost/egovbe/payment_success.php"/>
					                <input type="hidden" name="notify_url" value="http://localhost/egovbe/payment_success.php">
									<input type="hidden" name="cancel_return" value="http://localhost/egovbe/cancel.php"/>
									<input type="hidden" name="currency_code" value="USD"/>
									<input style="float:right;margin-right:80px;" type="image" name="submit"
										src="https://www.paypalobjects.com/webstatic/en_US/i/btn/png/blue-rect-paypalcheckout-60px.png" alt="PayPal Checkout"
										alt="PayPal - The safer, easier way to pay online">
								</form>';
})
}


?>