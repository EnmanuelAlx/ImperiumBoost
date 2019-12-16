<?php

namespace App\Http\Controllers;

use App\User;
use App\Message;
use App\Trabajo;
use App\MensajeAnonimo;
use Illuminate\Http\Request;
use App\Events\MessageSentEvent;
use App\Events\NotificationEvent;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Collection;

class MessageController extends Controller
{


    const PATH_ARCHIVOS = "ARCHIVOS";

    public function index(){
        return view('Application.chat');
    }

    public function getChatsAnonimos(){
        $anonimos = MensajeAnonimo::all()->groupBy('email');
        // $anonimos_collection = collect($anonimos);
        return response()->json($anonimos, 200);
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
    
    public function fetchWorkerMessage()
    {
        $id = Auth::user();
        $messages = Message::where('trabajador_id', $id->id)->get();
        foreach ($messages as $key => $value) {
            $value->user;
            $value->read = 1;
            $value->save();
        }
        return response()->json($messages, 200);
        
    }

    public function fetchWorkerMessageToAdmin(User $id)
    {
        $messages = Message::where('trabajador_id', $id->id)->get();
        foreach ($messages as $key => $value) {
            $value->user;
            $value->read = 1;
            $value->save();
        }
        return response()->json($messages, 200);
    }

    public function fetchAnonimusMessageToAdmin($email){
        $anonimos = MensajeAnonimo::where('email', $email)->get();
        return response()->json($anonimos, 200);
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
        $message->trabajo->servicio;
        $message->trabajo->usuario;
        $message->user;
        event(new MessageSentEvent($user, $message, $message->trabajo->id));
        event(new NotificationEvent($user, $message, $message->trabajo, 1));
        
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
        $message->trabajo->servicio;
        $message->user;
        event(new MessageSentEvent($user, $message, $message->trabajo->usuario->id));
        event(new NotificationEvent($user, $message, $message->trabajo, $message->trabajo->usuario->id));
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

    public function sentMessageAdminToTrabajador(Request $request){
        $user = Auth::user();
        $message = Message::create([
            'message' => $request->message,
            'from' => $user->id,
            'trabajador_id' => $request->usuario['id']
        ]);
        $message->trabajo;
        $message->user;
        event(new MessageSentEvent($user, $message, $message->trabajador_id));
        event(new NotificationEvent($user, $message, $message, $message->trabajador_id));
        return response()->json($message, 200);
    }


    public function messagesToAdminFromWorker(Request $request){
        $user = Auth::user();
        $message = Message::create([
            'message' => $request->message,
            'from' => $user->id,
            'trabajador_id' => $user->id
        ]);
        $message->user;
        event(new MessageSentEvent($user, $message, $user->id));
        event(new NotificationEvent($user, $message, $message->trabajo, 1));
        return response()->json($message, 200);
    }

    public function guestMessageToAdmin(Request $request){
        // dd($request->all());
        $message = MensajeAnonimo::create($request->all());
        event(new NotificationEvent($request->name, $message, '', 1));
        return response()->json($message, 200);
    }

    public function sentMessageAdminToAnonimo(Request $request){
        $mensaje = MensajeAnonimo::create([
            'email' => $request->email,
            'mensaje' => $request->message,
            'name' => Auth::user()->name,
            'admin' => 1,
        ]);
        return response()->json($mensaje, 200);
    }
    
}
