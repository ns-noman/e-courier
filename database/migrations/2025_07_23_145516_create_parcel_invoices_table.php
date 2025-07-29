<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('parcel_invoices', function (Blueprint $table) {
            $table->id();
            
            // Payment Information
            $table->string('invoice_no');        
            $table->double('total_price',20,2);
            $table->double('vat_tax',20,2)->nullable()->default(0.00);
            $table->tinyInteger('discount_method')->default(1)->comment('0=Percentage, 1=Solid');
            $table->double('discount_rate',20,2);
            $table->double('discount',20,2);
            $table->double('total_payable',20,2);
            $table->double('paid_amount',20,2);
            $table->string('reference_number')->nullable();
            $table->text('note')->nullable();

            //Shipment Information....
            $table->string('hawb_no')->comment('house air waybill no');
            $table->string('reference')->nullable();
            $table->integer('pieces');
            $table->integer('product_value')->nullable();
            $table->integer('billing_weight_kg');
            $table->integer('billing_weight_gm');
            $table->decimal('gross_weight_kg', 10,2)->nullable();
            $table->enum('payment_mode',['Prepaid', 'Collect']);
            $table->decimal('cod_amount', 10,2)->comment('Cash On Delivery');
            $table->enum('item_type',['SPX', 'DOCS']);
            $table->string('all_item_names')->nullable();
            $table->text('item_description')->nullable();

            $table->decimal('length', 10,2)->nullable()->comment('weight in cm');
            $table->decimal('height', 10,2)->nullable()->comment('weight in cm');
            $table->decimal('width', 10,2)->nullable()->comment('weight in cm');
            $table->decimal('weight', 10,2)->nullable()->comment('weight in kg');


            //Sender Receiber Information....
            $table->string('sender_name');
            $table->string('sender_company');
            $table->text('sender_address')->nullable();
            $table->string('sender_city')->nullable();
            $table->string('sender_zip')->nullable();
            $table->integer('sender_country_id');
            $table->string('sender_phone')->nullable();
            $table->string('sender_email')->nullable();

            $table->string('receiver_name');
            $table->string('receiver_company');
            $table->text('receiver_address')->nullable();
            $table->string('receiver_city');
            $table->string('receiver_zip');
            $table->integer('receiver_country_id');
            $table->string('receiver_phone');
            $table->string('receiver_email')->nullable();

            //Booking/Export Date
            $table->date('booking_date');
            $table->date('export_date');


            //Service Information
            $table->integer('created_branch_id');
            $table->integer('agent_id');
            $table->integer('current_branch_id');
            $table->integer('hub_id');
            $table->integer('flight_id');
            $table->integer('service_id');
            $table->enum('payment_type',['Cash', 'Due']);
            $table->string('usa_country_code')->nullable();


            //Others
            $table->string('picked_up_by');
            $table->timestamp('picked_up_date_time');
            $table->string('mawb_no')->nullable()->comment('Master Air Waybill');
            $table->string('remarks')->nullable();
            $table->integer('updated_by_id')->nullable();
            $table->integer('showing_weight_kgs')->nullable();
            $table->integer('showing_weight_gms')->nullable();
            $table->decimal('showing_weight_kgs_total', 10, 2)->default(0.00);
            $table->integer('created_by_id')->nullable();
            
            
            $table->tinyInteger('is_packed')->default(0)->comment('0=no, 1=yes');
            $table->enum('payment_status', ['unpaid', 'partial', 'paid'])->default('unpaid');
            $table->enum('parcel_status', ['pending','approve', 'in_transit', 'delivered', 'cancelled'])->default('pending');


            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('parcel_invoices');
    }
};
