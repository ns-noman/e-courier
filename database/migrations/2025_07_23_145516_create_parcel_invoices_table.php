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
            $table->integer('created_branch_id')->nullable();
            $table->integer('agent_id')->nullable();
            $table->integer('current_branch_id')->nullable();
            
            $table->string('invoice_no');
            $table->date('date');
            $table->double('total_price',20,2);
            $table->double('vat_tax',20,2)->nullable()->default(0.00);
            $table->tinyInteger('discount_method')->default(1)->comment('0=Percentage, 1=Solid');
            $table->double('discount_rate',20,2);
            $table->double('discount',20,2);
            $table->double('total_payable',20,2);
            $table->double('paid_amount',20,2);
            $table->string('reference_number')->nullable();
            $table->text('note')->nullable();
    
            $table->string('sender_name')->nullable();
            $table->string('sender_phone')->nullable();
            $table->string('sender_post_code')->nullable();
            $table->string('sender_address')->nullable();

            $table->string('receiver_name')->nullable();
            $table->string('receiver_phone')->nullable();
            $table->string('receiver_post_code')->nullable();
            $table->string('receiver_address')->nullable();
            $table->integer('receiver_country_id')->nullable();

            $table->integer('created_by_id')->nullable();
            $table->integer('updated_by_id')->nullable();
            
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
