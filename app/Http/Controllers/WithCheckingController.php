<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Validator;
use App\Support\Mevitsu;

abstract class WithCheckingController extends Controller
{
	//rules for form validation
	protected array $rules=array();
	
	//custom attributes for form validation
	protected array $attributes=array();
	
	//success messages for form validation
	protected array $successMessages=array();
	
	//for custom messages for validation- not recommended to use
	protected $customMessages=array();
	
	//variable to store a validator
	protected $validator;
	
	//variable to store messages from validator
	protected array $messages;
	
	/*
	 * Checks one field and return http response
	 * 
	 * @param Request $request
	 * @param string name
	 * @return Response
	 * */
    public function check(Request $request,$name){
		$this->validator=Validator::make(
			$request->only($name),
			array($name=>$this->rules[$name]),
			$customMessages=$this->customMessages,
			$customAttributes=$this->attributes
		);
			
		$this->messages=mevitsu::validatorToArray(
			$this->validator,
			array($name=>$this->successMessages[$name]),
			__('auth.valid_universal')
		);
		
		return response()->mevitsu(
			$this->messages,
			$this->messages[$name]['code'],
			$this->messages[$name]['message']
		);
	}
	
	/*
	 * Checks whole form. Return null if everything's OK or reponse if not
	 * 
	 * @param Request $request
	 * @return null|Response
	 * */
	protected function checkForm(Request $request){
		$this->validator=Validator::make(
			$request->all(),
			$this->rules,
			$customMessages=$this->customMessages,
			$customAttributes=$this->attributes
		);
		
		$this->messages=mevitsu::validatorToArray(
			$this->validator,
			$this->successMessages,
			__('auth.valid_universal')
		);
		
		if($this->validator->fails()){
			$messages=$this->validator->getMessageBag()->getMessages();
			$message=$messages[array_keys($messages)[0]][0];
			return response()->mevitsu($this->messages,422,$message);
		}
		else
			return null;
	}
}
