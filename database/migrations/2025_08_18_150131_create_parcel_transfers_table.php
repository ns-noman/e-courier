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
            $table->string('parcel_transfer_no')->unique();
            $table->unsignedBigInteger('from_branch_id');
            $table->unsignedBigInteger('to_branch_id');
            $table->date('transfer_date');
            $table->enum('status', ['pending', 'approved', 'in_transit', 'delivered', 'cancelled'])->default('pending');
            $table->boolean('is_received')->default(false);
            $table->text('note')->nullable();
            $table->unsignedBigInteger('created_by_id')->nullable();
            $table->unsignedBigInteger('received_by_id')->nullable();
            $table->timestamps();
        });

    }
    public function down()
    {
        Schema::dropIfExists('parcel_transfers');
    }
};
