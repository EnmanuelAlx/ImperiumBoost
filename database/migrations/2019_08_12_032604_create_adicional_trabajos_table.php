<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdicionalTrabajosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('adicional_trabajos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('adicional_id')->nullable()->unsigned();
            $table->bigInteger('trabajo_id')->nullable()->unsigned();
            $table->foreign('adicional_id')->references('id')->on('adicionales')->onDelete('cascade');
            $table->foreign('trabajo_id')->references('id')->on('trabajos')->onDelete('cascade');
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
        Schema::dropIfExists('adicional_trabajos');
    }
}
