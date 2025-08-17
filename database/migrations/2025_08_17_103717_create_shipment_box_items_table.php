<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('shipment_box_items', function (Blueprint $table) {
            $table->id();
            $table->integer('box_shipment_id');
            $table->unsignedBigInteger('invoice_id');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('shipment_box_items');
    }
};
