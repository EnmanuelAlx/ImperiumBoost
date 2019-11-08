<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMessagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mensajes_de_trabajo', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->text('message');
            $table->string('image')->nullable();
            $table->boolean('read')->default(false);
            $table->string('from')->nullable();
            $table->bigInteger('trabajo_id')->unsigned();
            $table->foreign('trabajo_id')->references('id')->on('trabajos');
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
        Schema::dropIfExists('mensajes_de_trabajo');
    }
}
