<?php

namespace App\Jobs;

use App\Mail\Appoiment;
use App\Mail\AppoimentDelete;
use App\Mail\AppoimentStatus;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use App\Mail\ForgotPassword;

class SendEmailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $details;

    public function __construct($details)
    {
        $this->details = $details;
    }

    public function handle()
    {
        if($this->details['mail_type'] == 'forgot_password')
        {
            $data = new ForgotPassword($this->details);
            Mail::to($this->details['email'])->send($data);
        }

        if($this->details['mail_type'] == 'appoiment')
        {
            $data = new Appoiment($this->details);
            Mail::to($this->details['email'])->send($data);
        }

        if($this->details['mail_type'] == 'appoiment_remove')
        {
            $data = new AppoimentDelete($this->details);
            Mail::to($this->details['email'])->send($data);
        }

        if($this->details['mail_type'] == 'appoiment_status')
        {
            $data = new AppoimentStatus($this->details);
            Mail::to($this->details['email'])->send($data);
        }
    }
}
