<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class NotificationEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;   
    public $message;
    public $user;
    public $trabajo;
    public $to;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($user, $message, $trabajo, $to)
    {
        $this->user = $user;
        $this->message = $message;
        $this->trabajo = $trabajo;
        $this->to = $to;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new Channel('notification.'.$this->to);
    }

    public function broadcastAs()
    {
        return 'notification';
    }
}
