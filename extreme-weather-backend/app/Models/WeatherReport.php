<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WeatherReport extends Model
{
    protected $fillable = [
        'title',
        'description',
        'location_id',
        'reported_date',
        'weather_image',
        'temperature',
        'humidity',
        'wind_speed',
        'condition_type'
    ];

    protected $hidden = [];
}
