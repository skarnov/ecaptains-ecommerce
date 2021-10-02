<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            body{
                margin: 0;
                padding: 0;
            }
            .container{
                width: 595px;
                height: 842px;
                margin:0 auto;
            }
            .address{
                width: 230px;
                position: absolute;
                top: 20px;
                left: 420px;
            }
            .title{
                text-align: center;
            }
            td,th{
                padding:7px;
                font-size: 12px;
            }
            footer{
                font-size: 13px;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <header>
                <div class="logo">
                    <img src="<?php echo base_url(); ?>media_library/images/website/logo.png"/>
                </div>
                <div class="address">
                    <p>
                        <strong>Contact:</strong> 01707725101, 01707725101<br/>
                        <strong>Website:</strong> www.ecaptains.com<br/>
                        <strong>Date:</strong> <?php echo date("jS F, Y", strtotime($order_info->created_at)); ?>
                    </p>
                </div>
            </header>
            <div class="main">
                <h1 class="title">Invoice - C<?php echo date('Y') . $order_info->pk_order_id; ?></h1>
                <div class="customer">
                    <h3>Client Details</h3>
                    <p>
                        <strong>Name of Client:</strong> <?php echo $order_info->user_fullname; ?><br>
                        <strong>Address:</strong> <?php echo $order_info->user_address; ?><br>
                        <strong>Phone:</strong> <?php echo $order_info->user_mobile; ?><br/>
                        <strong>Email:</strong> <?php echo $order_info->user_email; ?>
                    </p>
                </div>
                <div class="customer">
                    <h3>Shipping Details</h3>
                    <p>
                        <strong>Name:</strong> <?php echo $order_info->delivery_name; ?><br>
                        <strong>Address:</strong> <?php echo $order_info->delivery_address; ?><br>
                        <strong>Phone:</strong> <?php echo $order_info->delivery_mobile; ?><br/>
                        <strong>Email:</strong> <?php echo $order_info->delivery_email; ?>
                    </p>
                </div>
                <div class="customer">
                    <h3>Billing Details</h3>
                    <p>
                        <strong>Name:</strong> <?php echo $order_info->billing_name; ?><br>
                        <strong>Address:</strong> <?php echo $order_info->billing_address; ?><br>
                        <strong>Phone:</strong> <?php echo $order_info->billing_mobile; ?><br/>
                        <strong>Email:</strong> <?php echo $order_info->billing_email; ?>
                    </p>
                </div>
                <br/><br/>
                <table  border="1" style="border-collapse: collapse;">
                    <tr>
                        <th>SL</th>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total Price</th>
                    </tr>
                    <?php
                    $contents = $this->cart->contents();
                    $i = 1;
                    foreach ($contents as $values) {
                        ?>
                        <tr>
                            <td><?php echo $i; ?></td>
                            <td><?php echo $values['name']; ?></td>
                            <td><?php echo $values['qty']; ?></td>
                            <td><?php echo $values['price']; ?></td>
                            <td><?php echo $values['qty'] * $values['price']; ?></td>
                        </tr>
                        <?php
                        $i++;
                    }
                    $order_total = $order_info->order_total;
                    $discount = $this->session->userdata('discount');
                    ?>
                    <tr>
                        <td colspan="7"><span style="margin-left:400px;">Total: <span style="font-weight: bolder;"> </span><?php echo $order_total; ?></span> BDT</td>
                    </tr>
                    <?php if ($discount) :?>
                    <tr>
                        <td colspan="7"><span style="margin-left:400px;">Discount: <span style="font-weight: bolder;"> </span><?php echo $discount; ?></span> BDT</td>
                    </tr>
                    <?php endif; ?>
                    <tr>
                        <td colspan="7">
                            <span style="margin-left:400px;">Grand Total: 
                                <strong>
                                    <?php echo $order_total - $discount; ?> BDT
                                    <span style="color:red">(Unpaid)</span>
                                </strong>
                            </span>
                        </td>
                    </tr>
                </table>
                <?php
                function convert_number_to_words($number) {
                    $hyphen = '-';
                    $conjunction = ' And ';
                    $separator = ', ';
                    $negative = 'Negative ';
                    $decimal = ' Point ';
                    $dictionary = array(
                        0 => 'Zero',
                        1 => 'One',
                        2 => 'Two',
                        3 => 'Three',
                        4 => 'Four',
                        5 => 'Five',
                        6 => 'Six',
                        7 => 'Seven',
                        8 => 'Eight',
                        9 => 'Nine',
                        10 => 'Ten',
                        11 => 'Eleven',
                        12 => 'Twelve',
                        13 => 'Thirteen',
                        14 => 'Fourteen',
                        15 => 'Fifteen',
                        16 => 'Sixteen',
                        17 => 'Seventeen',
                        18 => 'Eighteen',
                        19 => 'Nineteen',
                        20 => 'Twenty',
                        30 => 'Thirty',
                        40 => 'Fourty',
                        50 => 'Fifty',
                        60 => 'Sixty',
                        70 => 'Seventy',
                        80 => 'Eighty',
                        90 => 'Ninety',
                        100 => 'Hundred',
                        1000 => 'Thousand',
                        1000000 => 'Million',
                        1000000000 => 'Billion',
                        1000000000000 => 'Trillion',
                        1000000000000000 => 'Quadrillion',
                        1000000000000000000 => 'Quintillion'
                    );
                    if (!is_numeric($number)) {
                        return false;
                    }
                    if (($number >= 0 && (int) $number < 0) || (int) $number < 0 - PHP_INT_MAX) {
                        trigger_error(
                                'convert_number_to_words only accepts numbers between -' . PHP_INT_MAX . ' and ' . PHP_INT_MAX, E_USER_WARNING
                        );
                        return false;
                    }
                    if ($number < 0) {
                        return $negative . convert_number_to_words(abs($number));
                    }
                    $string = $fraction = null;
                    if (strpos($number, '.') !== false) {
                        list($number, $fraction) = explode('.', $number);
                    }
                    switch (true) {
                        case $number < 21:
                            $string = $dictionary[$number];
                            break;
                        case $number < 100:
                            $tens = ((int) ($number / 10)) * 10;
                            $units = $number % 10;
                            $string = $dictionary[$tens];
                            if ($units) {
                                $string .= $hyphen . $dictionary[$units];
                            }
                            break;
                        case $number < 1000:
                            $hundreds = $number / 100;
                            $remainder = $number % 100;
                            $string = $dictionary[$hundreds] . ' ' . $dictionary[100];
                            if ($remainder) {
                                $string .= $conjunction . convert_number_to_words($remainder);
                            }
                            break;
                        default:
                            $baseUnit = pow(1000, floor(log($number, 1000)));
                            $numBaseUnits = (int) ($number / $baseUnit);
                            $remainder = $number % $baseUnit;
                            $string = convert_number_to_words($numBaseUnits) . ' ' . $dictionary[$baseUnit];
                            if ($remainder) {
                                $string .= $remainder < 100 ? $conjunction : $separator;
                                $string .= convert_number_to_words($remainder);
                            }
                            break;
                    }
                    if (null !== $fraction && is_numeric($fraction)) {
                        $string .= $decimal;
                        $words = array();
                        foreach (str_split((string) $fraction) as $number) {
                            $words[] = $dictionary[$number];
                        }
                        $string .= implode(' ', $words);
                    }
                    return $string;
                }
                ?>
                <p><b>Total In Word:</b> <?php echo convert_number_to_words($order_total) . ' Taka Only.'; ?></p><br>
            </div><br/><br/>
            <footer>
                <hr>
                <address>
                    Received the above in good condition & found No discrepancy
                </address>
            </footer>
        </div>
    </body>
</html>