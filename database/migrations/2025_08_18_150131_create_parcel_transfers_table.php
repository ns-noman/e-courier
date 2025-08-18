<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('parcel_transfers', function (Blueprint $table) {
            $table->id();
            $table->string('transfer_no')->unique()->comment('Unique transfer number');
            $table->integer('from_branch_id');
            $table->integer('to_branch_id');
            $table->date('transfer_date');
            $table->enum('status', ['pending', 'in_transit', 'delivered', 'cancelled'])->default('pending');
            $table->text('note')->nullable();
            $table->integer('created_by_id');
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('parcel_transfers');
    }
};
