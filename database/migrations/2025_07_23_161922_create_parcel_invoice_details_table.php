<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('parcel_invoice_details', function (Blueprint $table) {
            $table->id();
            $table->integer('sale_id');
            $table->string('item_name');
            $table->double('quantity',20,2);
            $table->double('unit_price',20,2);
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('parcel_invoice_details');
    }
};
