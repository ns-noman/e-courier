<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('parcel_transfer_details', function (Blueprint $table) {
            $table->id();
            $table->integer('parcel_transfer_id');
            $table->integer('parcel_id');
            $table->integer('invoice_id')->nullable();
            $table->integer('quantity')->default(1);
            $table->text('note')->nullable();
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('parcel_transfer_details');
    }
};
