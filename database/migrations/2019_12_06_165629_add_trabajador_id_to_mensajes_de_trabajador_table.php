<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddTrabajadorIdToMensajesDeTrabajadorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('mensajes_de_trabajo', function (Blueprint $table) {
            $table->bigInteger('trabajador_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('mensajes_de_trabajo', function (Blueprint $table) {
            $table->dropColumn('trabajador_id');
        });
    }
}
