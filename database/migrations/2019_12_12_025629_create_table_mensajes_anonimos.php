<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableMensajesAnonimos extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mensajes_anonimos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('email', 150)->nullable();
            $table->string('name', 100)->nullable()->default('Anonimo');
            $table->string('mensaje', 250)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mensajes_anonimos');
    }
}
