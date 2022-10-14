<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

use App\Http\Controllers\WithCheckingController;

class RegisteredUserController extends WithCheckingController
{
	//Construction method
	public function __construct(){
		//rules for validation
		$this->rules=[
				'name' => ['required', 'string', 'max:255'],
				'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
				'password' => ['required', 'confirmed', Rules\Password::defaults()],
			];
		
		//attributes for form validation
		$this->attributes=[
				'name' => __('auth.name_name'),
				'email' => __('auth.name_email'),
				'password' => __('auth.name_password'),
			];
		
		//success messages for form validation
		$this->successMessages=[
				'name' => __('auth.valid_name'),
				'email' => __('auth.valid_email'),
				'password' => __('auth.valid_password'),
			];
	}
    /**
     * Display the registration view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {/*
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);
*/
		
		if(($badResponse=$this->checkForm($request))!==null)
			return $badResponse;
			
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        event(new Registered($user));

        // Auth::login($user);

        return response()->mevitsu(null,201,__('auth.register_success'));
    }
    
}
