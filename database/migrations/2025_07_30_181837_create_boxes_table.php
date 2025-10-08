<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    
    public function up(): void
    {
        Schema::create('boxes', function (Blueprint $table) {
            $table->id();
            $table->string('box_name', 255);
            $table->string('box_code', 255);
            $table->enum('box_type', ['Domestic', 'International'])->default('International');
            $table->decimal('height_cm', 10, 2)->default(0.00);
            $table->decimal('width_cm', 10, 2)->default(0.00)->nullable();
            $table->decimal('length_cm', 10, 2)->default(0.00);
            $table->decimal('volume_weight', 10, 2)->default(0.00)->nullable();
            $table->decimal('box_weight', 10, 2)->default(0.00)->nullable()->comment('Weight in kg');
            $table->decimal('total_weight', 10, 2)->default(0.00)->nullable();
            $table->decimal('cbm', 10, 4)->default(0.0000)->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('boxes');
    }
};
