<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCuentasCompradasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cuentas_compradas', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('cuenta_id')->unsigned();
            $table->bigInteger('metodo_id')->unsigned();
            $table->float('precio');
            $table->bigInteger('user')->nullable();
            $table->foreign('cuenta_id')->references('id')->on('cuentas');
            $table->foreign('metodo_id')->references('id')->on('metodo_pagos');

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
        Schema::dropIfExists('cuentas_compradas');
    }
}
