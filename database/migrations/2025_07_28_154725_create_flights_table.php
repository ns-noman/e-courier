<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('flights', function (Blueprint $table) {
            $table->id();
            $table->string('hub_id');
            $table->string('flight_name');
            $table->integer('flight_code');
            $table->tinyInteger('status')->default(0);
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('flights');
    }
};
