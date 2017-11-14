<?php class Partner_contact extends AbstractData {

    public $id;
    public $name;
    public $first_name;
    public $last_name;
    public $middle_name;
    public $feor_id;
    public $partner_id;
    public $phone;
    public $mobile_phone;
    public $fax;
    public $email;
    public $commnt;
    public $password;
    public $country_id;
    public $default_bill;

    public static function name($last, $first, $middle){
        $name = $last . " " . $first . " " . $middle;
        return $name;
    }

}

?>