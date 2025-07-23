<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('branches', function (Blueprint $table) {
            $table->double('commission_percentage', 20,2)->default(0.00)->after('is_main_branch');
        });
    }
    public function down()
    {
        Schema::table('branches', function (Blueprint $table) {
            //
        });
    }
};
