<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Image;
class Movie extends Model
{
    use HasFactory;

    public function images(){
        return $this->hasMany(Image::class);
    }

    public function casts(){
        return $this->hasMany(MovieCast::class);
    }
}
