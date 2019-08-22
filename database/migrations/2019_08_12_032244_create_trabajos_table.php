<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTrabajosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trabajos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->longText('nota')->nullable();
            $table->float('monto');
            $table->bigInteger('servicio_id')->unsigned();
            $table->bigInteger('user_id')->unsigned();
            $table->bigInteger('trabajador_id')->unsigned()->nullable();
            $table->bigInteger('cupon_id')->unsigned()->nullable();
            $table->boolean('status')->nullable()->default(false);
            $table->string('cuenta',100)->nullable();
            $table->string('contraseña_cuenta', 100)->nullable();
            $table->foreign('servicio_id')->references('id')->on('servicios')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('trabajador_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('cupon_id')->references('id')->on('cupones')->onDelete('cascade');
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
        Schema::dropIfExists('trabajos');
    }
}
