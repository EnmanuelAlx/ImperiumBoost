<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddNotaCancelacionToTrabajoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('trabajos', function (Blueprint $table) {
            $table->string('nota_cancelacion', 250)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('trabajos', function (Blueprint $table) {
            $table->dropColumn('nota_cancelacion');
        });
    }
}
