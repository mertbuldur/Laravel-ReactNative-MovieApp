<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Movie;
use Illuminate\Http\Request;
use \App\Http\Controllers\BaseController as BaseController;
class CategoryController extends BaseController
{
    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(){
        $categories = Category::all();
        return $this->success("Kategori Listelendi", $categories);
    }

    /**
     * @param $categoryId
     * @return \Illuminate\Http\JsonResponse
     */
    public function detail($categoryId){
        //if(Category::where('id',$categoryId)->count() == 0) return $this->error('Kategori Bulunamadı');
        $category = Category::findOrFail($categoryId);
        $movies = Movie::with('images')->whereRaw('categoryIds REGEXP "(^|,)('.$categoryId.')(,|$)"')->get()->map(function($item){
            $item['categories'] = Category::whereRaw('id REGEXP "(^|,)('.str_replace(',','|',$item->categoryIds).')(,|$)"')->get();
            return $item;
        });
        return $this->success("Kategori Listelendi", [
            'category'=>$category,
            'movies'=>$movies
        ]);
    }
}
