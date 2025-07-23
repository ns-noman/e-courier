<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('branches', function (Blueprint $table) {
            $table->bigInteger('parent_id')->default(0)->after('id');
            $table->enum('branch_type', ['branch', 'hub'])->default('branch')->after('parent_id');
        });
    }
    public function down()
    {
        Schema::table('branches', function (Blueprint $table) {
            //
        });
    }
};
