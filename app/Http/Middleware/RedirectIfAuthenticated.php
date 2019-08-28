<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (Auth::guard($guard)->check()) {
            switch (Auth::user()->role_id) {
                case 2:
                    return redirect()->route('Application.dashboard');
                    break;
                case 3:
                    return redirect()->route('worker.dashboard');
                    break;
                case 1:
                    return redirect()->route('voyager.dashboard');
                    break;
                default: 
                    return redirect()->route('home');
            }
        }

        return $next($request);
    }
}
