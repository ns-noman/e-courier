<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('boxes', function (Blueprint $table) {
            $table->id();
            $table->string('box_name');
            $table->string('box_code');
            $table->enum('box_type', ['small', 'medium', 'large']);
            $table->decimal('weight', 10, 2)->nullable()->comment('Weight in kg');
            $table->string('dimensions')->nullable();
            $table->boolean('status')->default( 1);
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('boxes');
    }
};
