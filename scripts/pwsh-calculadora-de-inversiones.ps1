<# pwsh-calculadora-de-inversiones.ps1

.SYNOPSIS
    Calcula el valor futuro de una inversión con aporte inicial y aportaciones mensuales,
    aplicando la fórmula de interés compuesto.

.DESCRIPTION
    El cálculo se realiza considerando:
    - Capital inicial invertido una sola vez.
    - Aportes periódicos (mensuales) durante todo el plazo.
    - Tasa de rendimiento anual.
    - Capitalización mensual (o ajustable con el parámetro Frecuencia).

    Fórmula utilizada:
        VF = P * (1 + r/n)^(n*t) + PMT * [ ((1 + r/n)^(n*t) - 1) / (r/n) ]

        Donde:
        VF  = Valor Futuro
        P   = Inversión inicial
        PMT = Aporte mensual
        r   = Tasa anual en decimal
        n   = Número de capitalizaciones por año (12 si es mensual)
        t   = Número de años

.PARAMETER InversionInicial
    Capital inicial invertido (USD).

.PARAMETER AporteMensual
    Aporte mensual constante (USD).

.PARAMETER TasaAnual
    Tasa anual de interés o rendimiento (%).

.PARAMETER Years
    Número de años que durará la inversión.

.PARAMETER Frecuencia
    Número de capitalizaciones por año (por defecto = 12 para mensual).


.PARAMETER Anticipada
    Indica si los aportes se realizan al inicio del período (por defecto es al final).

.PARAMETER RutaExcel
    Ruta donde se exportará el archivo Excel con los datos de crecimiento (por defecto es ".\Crecimiento.xlsx").
.EXAMPLE
    Calcular-ValorFuturo -InversionInicial 1000 -AporteMensual 500 -TasaAnual 7.31 -Anos 5

    Calcula el valor futuro de una inversión de $1000 inicial más $500 mensuales durante 5 años,
    con una tasa de 7.31% anual capitalizada mensualmente.

Ejemplo de uso
$inversionInicial = 10000 # Inversión inicial de $10,000
$aporteMensual = 200      # Aporte mensual de $200
$tasaAnual = 7.31         # Tasa anual del 7.31%
$years = 10               # Horizonte de inversión de 10 años
$frecuencia = 12          # Capitalización mensual
$anticipada = $false      # Aportes al final del período 

CalcularValorFuturo -InversionInicial 10000 -AporteMensual 500 -TasaAnual 7.31 -Years 10 -RutaExcel "C:\Temp\Crecimiento.xlsx"

.NOTES
    Autor: Paul Chen Charter
    Fecha: Julio 2025
    Versión: 1.0
    Requiere el módulo ImportExcel para exportar a Excel.
    Asegúrate de tener instalado el módulo ImportExcel antes de ejecutar este script.
#>

#region modulos
# Importar módulo necesario para exportar a Excel
# Si no está instalado, se puede instalar con: Install-Module ImportExcel -Scope Current
Import-Module ImportExcel -ErrorAction Stop
#endregion      

#region funciones
function CalcularValorFuturo {
    param (
        [double]$InversionInicial,
        [double]$AporteMensual,
        [double]$TasaAnual,      # Ej: 7.31
        [int]$Years,
        [int]$Frecuencia = 12,   # Capitalización mensual
        [switch]$Anticipada,     # Aportes al inicio del período
        [string]$RutaExcel = ".\Crecimiento.xlsx"
    )

    # Conversión de parámetros financieros
    $r = $TasaAnual / 100
    $n = $Frecuencia
    $t = $Years
    $i = $r / $n
    $m = $n * $t

    # Cálculo de crecimiento de inversión inicial
    $VF_inicial = $InversionInicial * [math]::Pow((1 + $i), $m)

    # Cálculo de crecimiento de aportes
    $VF_aportes = $AporteMensual * (([math]::Pow((1 + $i), $m) - 1) / $i)
    if ($Anticipada) {
        $VF_aportes *= (1 + $i)
    }

    $VF_total = [math]::Round($VF_inicial + $VF_aportes, 2)

    # Tabla de crecimiento mensual
    $Saldo = $InversionInicial
    $Datos = @()

    for ($mes = 1; $mes -le $m; $mes++) {
        $SaldoInicial = $Saldo

        if ($Anticipada) {
            $Saldo += $AporteMensual
        }

        $Interes = [math]::Round($Saldo * $i, 2)
        $Saldo += $Interes

        if (-not $Anticipada) {
            $Saldo += $AporteMensual
        }

        $Datos += [PSCustomObject]@{
            Mes           = $mes
            SaldoInicial  = [math]::Round($SaldoInicial, 2)
            InteresGanado = $Interes
            Aporte        = $AporteMensual
            SaldoFinal    = [math]::Round($Saldo, 2)
        }
    }

    # Exportar a Excel
    #$Datos | Export-Excel -Path $RutaExcel -BoldTopRow -FreezeTopRow -WorksheetName "Crecimiento"

    # Mostrar resumen
    Write-Host "-----------------------------"
    Write-Host "Inversión inicial: $" + $InversionInicial
    Write-Host "Aporte mensual: $" + $AporteMensual
    Write-Host "Tasa anual: $TasaAnual%"
    Write-Host "Frecuencia de capitalización: $Frecuencia veces al año"
    Write-Host "Horizonte: $Years años"
    Write-Host ("Valor futuro estimado: $" + $VF_total)
    Write-Host "Archivo exportado a: $RutaExcel"
    Write-Host "-----------------------------"

    return $VF_total
}
#endregion

