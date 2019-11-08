<?php

namespace App\Http\Controllers;

use App\Message;
use App\Trabajo;
use Illuminate\Http\Request;
use App\Events\MessageSentEvent;
use Illuminate\Support\Facades\Auth;

class MessageController extends Controller
{


    const PATH_ARCHIVOS = "ARCHIVOS";

    public function index(){
        return view('Application.chat');
    }

    public function fetch(Trabajo $id)
    {
        if($id->user_id == Auth::user()->id || Auth::user()->id == 1){
            $messages = Message::where('trabajo_id', $id->id)->get();
            foreach ($messages as $key => $value) {
                $value->user;
                $value->read = 1;
                $value->save();
            }
            return response()->json($messages, 200);
        }
        return response()->json('No tienes permiso para esto', 500);
    }

    public function sentMessage(Request $request)
    {

        $user = Auth::user();
        $message = Message::create([
            'message' => $request->message,
            'trabajo_id' => $request->trabajo['id'],
            'from' => $user->id,
        ]);
        $message->trabajo;
        $message->trabajo->usuario;
        $message->user;
        event(new MessageSentEvent($user, $message, $message->trabajo->id));
        return response()->json($message, 200);
    }

    public function sentMessageAdmin(Request $request)
    {

        $user = Auth::user();
        $message = Message::create([
            'message' => $request->message,
            'trabajo_id' => $request->trabajo['id'],
            'from' => $user->id,
        ]);
        $message->trabajo;
        $message->trabajo->usuario;
        $message->user;
        event(new MessageSentEvent($user, $message, $message->trabajo->usuario->id));
        return response()->json($message, 200);
    }

    public function sentFiles(Request $request){        
        $user = Auth::user();
        $message = Message::create([
            'message' => '',
            'image' => $request->file('files')->store(self::PATH_ARCHIVOS, 'public'),
            'trabajo_id' => $request->trabajo,
            'from' => $user->id,
        ]);
        $message->trabajo;
        $message->trabajo->usuario;
        $message->user;
        event(new MessageSentEvent($user, $message, $message->trabajo->id));        
        return response()->json($message, 200);
    }

    public function sentFilesAdmin(Request $request){        
        $user = Auth::user();
        $message = Message::create([
            'message' => '',
            'image' => $request->file('files')->store(self::PATH_ARCHIVOS, 'public'),
            'trabajo_id' => $request->trabajo,
            'from' => $user->id,
        ]);
        $message->trabajo;
        $message->trabajo->usuario;
        $message->user;
        event(new MessageSentEvent($user, $message, $message->trabajo->usuario->id));
            
        return response()->json($message, 200);
    }


    
}
