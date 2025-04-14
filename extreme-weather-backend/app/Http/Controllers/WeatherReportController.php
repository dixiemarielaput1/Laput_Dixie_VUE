<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\WeatherReport;

class WeatherReportController extends Controller
{
    public function getAll() {
        $reports = WeatherReport::join('locations', 'location_id', '=', 'locations.id')
            ->select(
                'weather_reports.id',
                'title',
                'reported_date',
                'name as location',
                'region',
                'latitude',
                'longitude',
                'temperature',
                'humidity',
                'wind_speed',
                'condition_type'
            )
            ->orderBy('reported_date', 'desc')
            ->get();
    
        return response()->json($reports);
    }

    public function getOne($id) {
        $report = WeatherReport::join('locations', 'location_id', '=', 'locations.id')
            ->select(
                'weather_reports.id',
                'title',
                'description',
                'reported_date',
                'weather_image',
                'name as location',
                'region',
                'latitude',
                'longitude',
                'temperature',
                'humidity',
                'wind_speed',
                'condition_type'
            )
            ->where('weather_reports.id', '=', $id)
            ->first();
    
        return response()->json($report);
    }

    public function save(Request $request) {
        $this->validate($request, [
            'title' => 'required',
            'description' => 'required',
            'location_id' => 'required',
            'reported_date' => 'required|date',
            'weather_image' => 'required',
            'temperature' => 'nullable|string',
            'humidity' => 'nullable|string',
            'wind_speed' => 'nullable|string',
            'condition_type' => 'nullable|string'
        ]);

        $report = WeatherReport::create($request->all());
        return response()->json($report, 201);
    }

    public function update(Request $request, $id) {
        $report = WeatherReport::findOrFail($id);

        $this->validate($request, [
            'title' => 'required',
            'description' => 'required',
            'location_id' => 'required',
            'reported_date' => 'required|date',
            'weather_image' => 'required',
            'temperature' => 'nullable|string',
            'humidity' => 'nullable|string',
            'wind_speed' => 'nullable|string',
            'condition_type' => 'nullable|string'
        ]);

        $report->update($request->all());
        return response()->json($report);
    }

    public function delete($id) {
        $report = WeatherReport::findOrFail($id);
        $report->delete();
        return response()->json(null, 204);
    }
}
