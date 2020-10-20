<?php

namespace App\Exports;

use App\host_clientes;
use Maatwebsite\Excel\Concerns\FromCollection;

class host_clientesExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return host_clientes::all();
    }
}
