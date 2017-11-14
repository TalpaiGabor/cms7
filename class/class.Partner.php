<?php class Partner extends AbstractData {

    public $id;
    public $name;
    public $is_customer;
    public $is_supplier;
    public $phone;
    public $email;
    public $web;
    public $fax;
    public $pay_mode;
    public $discount;
    public $late_charges;
    public $is_deleted;
    public $delete_time;
    public $delete_user;
    public $company_registration_number;
    public $id_card_number;
    public $mothers_name;
    public $birth_city;
    public $birth_date;
    public $recipient;
    public $recipient_tax;
    public $bill_email;
    public $commnt;

	/*public static function createHtml($id)
	{
		ob_start();
		try{
			$partner = new Partner(array("id" => $id));
			
			?>
			<div>Ez egy ajax tartalom <?php echo $partner->phone;?></div>
			<?php
			
		}catch(Exception $e){
		    throw $e;
		}
		
		$content = ob_get_contents();
		ob_end_clean();
		return $content;
		
	}*/


}

?>