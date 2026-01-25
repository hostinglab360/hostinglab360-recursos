<?php
/**
 * Benchmark de Velocidad PHP - HostingLab360
 * Prueba el rendimiento del servidor ejecutando operaciones comunes
 * 
 * Uso: Subir este archivo a tu hosting y acceder vía navegador
 *      https://tu-sitio.com/benchmark-php.php
 */

// Configuración
$iterations = 100000; // Número de iteraciones para cada prueba

// Función para formatear tiempo
function formatTime($seconds) {
    return number_format($seconds * 1000, 2) . ' ms';
}

// Colores para HTML
$style = "
<style>
    body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif; max-width: 900px; margin: 40px auto; padding: 20px; background: #f5f5f5; }
    .container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
    h1 { color: #2c3e50; border-bottom: 3px solid #3498db; padding-bottom: 10px; }
    h2 { color: #34495e; margin-top: 30px; }
    .result { background: #ecf0f1; padding: 15px; margin: 10px 0; border-left: 4px solid #3498db; border-radius: 4px; }
    .result strong { color: #2c3e50; }
    .excellent { border-left-color: #27ae60; background: #d5f4e6; }
    .good { border-left-color: #f39c12; background: #ffeaa7; }
    .poor { border-left-color: #e74c3c; background: #ffcccb; }
    .summary { background: #3498db; color: white; padding: 20px; margin-top: 30px; border-radius: 4px; }
    .summary h3 { margin-top: 0; }
    table { width: 100%; border-collapse: collapse; margin: 20px 0; }
    th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
    th { background: #34495e; color: white; }
    .footer { margin-top: 30px; text-align: center; color: #7f8c8d; font-size: 14px; }
    .badge { display: inline-block; padding: 5px 10px; border-radius: 3px; font-size: 12px; font-weight: bold; }
    .badge-excellent { background: #27ae60; color: white; }
    .badge-good { background: #f39c12; color: white; }
    .badge-poor { background: #e74c3c; color: white; }
</style>
";

echo "<!DOCTYPE html><html><head><meta charset='UTF-8'><title>Benchmark PHP - HostingLab360</title>$style</head><body>";
echo "<div class='container'>";
echo "<h1>🧪 Benchmark de Rendimiento PHP</h1>";
echo "<p><strong>Servidor:</strong> " . $_SERVER['SERVER_SOFTWARE'] . "</p>";
echo "<p><strong>PHP Version:</strong> " . PHP_VERSION . "</p>";
echo "<p><strong>Iteraciones por prueba:</strong> " . number_format($iterations) . "</p>";
echo "<hr>";

// Array para almacenar resultados
$results = [];

// ============================================
// PRUEBA 1: Operaciones Matemáticas
// ============================================
echo "<h2>📊 1. Operaciones Matemáticas</h2>";
$start = microtime(true);
$result = 0;
for ($i = 0; $i < $iterations; $i++) {
    $result += sqrt($i) * pi() / 2;
}
$mathTime = microtime(true) - $start;
$results['math'] = $mathTime;

$class = $mathTime < 0.1 ? 'excellent' : ($mathTime < 0.3 ? 'good' : 'poor');
echo "<div class='result $class'>";
echo "<strong>Tiempo:</strong> " . formatTime($mathTime) . "<br>";
echo "<strong>Evaluación:</strong> " . ($mathTime < 0.1 ? '✅ Excelente' : ($mathTime < 0.3 ? '⚠️ Bueno' : '❌ Lento'));
echo "</div>";

// ============================================
// PRUEBA 2: Manipulación de Strings
// ============================================
echo "<h2>📝 2. Manipulación de Strings</h2>";
$start = microtime(true);
$string = "HostingLab360 - Análisis de hosting web argentino";
for ($i = 0; $i < $iterations / 10; $i++) {
    $processed = strtoupper($string);
    $processed = str_replace('HOSTING', 'WEB', $processed);
    $processed = substr($processed, 0, 20);
    $length = strlen($processed);
}
$stringTime = microtime(true) - $start;
$results['string'] = $stringTime;

$class = $stringTime < 0.05 ? 'excellent' : ($stringTime < 0.15 ? 'good' : 'poor');
echo "<div class='result $class'>";
echo "<strong>Tiempo:</strong> " . formatTime($stringTime) . "<br>";
echo "<strong>Evaluación:</strong> " . ($stringTime < 0.05 ? '✅ Excelente' : ($stringTime < 0.15 ? '⚠️ Bueno' : '❌ Lento'));
echo "</div>";

// ============================================
// PRUEBA 3: Arrays y Loops
// ============================================
echo "<h2>🔢 3. Arrays y Loops</h2>";
$start = microtime(true);
$array = range(1, 1000);
for ($i = 0; $i < $iterations / 100; $i++) {
    $filtered = array_filter($array, function($num) {
        return $num % 2 == 0;
    });
    $mapped = array_map(function($num) {
        return $num * 2;
    }, $filtered);
    $sum = array_sum($mapped);
}
$arrayTime = microtime(true) - $start;
$results['array'] = $arrayTime;

$class = $arrayTime < 0.08 ? 'excellent' : ($arrayTime < 0.2 ? 'good' : 'poor');
echo "<div class='result $class'>";
echo "<strong>Tiempo:</strong> " . formatTime($arrayTime) . "<br>";
echo "<strong>Evaluación:</strong> " . ($arrayTime < 0.08 ? '✅ Excelente' : ($arrayTime < 0.2 ? '⚠️ Bueno' : '❌ Lento'));
echo "</div>";

// ============================================
// PRUEBA 4: I/O de Archivos
// ============================================
echo "<h2>💾 4. Lectura/Escritura de Archivos</h2>";
$testFile = 'benchmark_test_' . time() . '.txt';
$testData = str_repeat("HostingLab360 testing file I/O performance.\n", 1000);

$start = microtime(true);
for ($i = 0; $i < 50; $i++) {
    file_put_contents($testFile, $testData);
    $read = file_get_contents($testFile);
}
@unlink($testFile); // Limpiar archivo de prueba
$ioTime = microtime(true) - $start;
$results['io'] = $ioTime;

$class = $ioTime < 0.05 ? 'excellent' : ($ioTime < 0.15 ? 'good' : 'poor');
echo "<div class='result $class'>";
echo "<strong>Tiempo:</strong> " . formatTime($ioTime) . "<br>";
echo "<strong>Evaluación:</strong> " . ($ioTime < 0.05 ? '✅ Excelente (probablemente SSD)' : ($ioTime < 0.15 ? '⚠️ Bueno' : '❌ Lento (posiblemente HDD)'));
echo "</div>";

// ============================================
// PRUEBA 5: Funciones y Recursión
// ============================================
echo "<h2>🔄 5. Funciones y Recursión</h2>";

function fibonacci($n) {
    if ($n <= 1) return $n;
    return fibonacci($n - 1) + fibonacci($n - 2);
}

$start = microtime(true);
for ($i = 0; $i < 100; $i++) {
    $fib = fibonacci(15);
}
$recursionTime = microtime(true) - $start;
$results['recursion'] = $recursionTime;

$class = $recursionTime < 0.1 ? 'excellent' : ($recursionTime < 0.3 ? 'good' : 'poor');
echo "<div class='result $class'>";
echo "<strong>Tiempo:</strong> " . formatTime($recursionTime) . "<br>";
echo "<strong>Evaluación:</strong> " . ($recursionTime < 0.1 ? '✅ Excelente' : ($recursionTime < 0.3 ? '⚠️ Bueno' : '❌ Lento'));
echo "</div>";

// ============================================
// RESUMEN Y PUNTUACIÓN
// ============================================
$totalTime = array_sum($results);
$avgTime = $totalTime / count($results);

echo "<div class='summary'>";
echo "<h3>📈 Resumen General</h3>";

echo "<table>";
echo "<tr><th>Prueba</th><th>Tiempo</th><th>Rating</th></tr>";
foreach ($results as $test => $time) {
    $rating = $time < 0.1 ? "<span class='badge badge-excellent'>Excelente</span>" : 
              ($time < 0.3 ? "<span class='badge badge-good'>Bueno</span>" : 
               "<span class='badge badge-poor'>Lento</span>");
    $testName = ucfirst($test);
    echo "<tr><td>$testName</td><td>" . formatTime($time) . "</td><td>$rating</td></tr>";
}
echo "<tr style='font-weight: bold; background: rgba(255,255,255,0.1);'>";
echo "<td>TOTAL</td><td>" . formatTime($totalTime) . "</td><td></td>";
echo "</tr>";
echo "</table>";

// Puntuación global
if ($avgTime < 0.1) {
    $globalRating = "⭐⭐⭐⭐⭐ EXCEPCIONAL";
    $recommendation = "Servidor de alto rendimiento. Excelente para aplicaciones exigentes.";
} elseif ($avgTime < 0.2) {
    $globalRating = "⭐⭐⭐⭐ EXCELENTE";
    $recommendation = "Muy buen rendimiento. Ideal para sitios profesionales y e-commerce.";
} elseif ($avgTime < 0.3) {
    $globalRating = "⭐⭐⭐ BUENO";
    $recommendation = "Rendimiento aceptable para sitios pequeños y medianos.";
} else {
    $globalRating = "⭐⭐ REGULAR";
    $recommendation = "Rendimiento por debajo del ideal. Considerá actualizar tu plan u optimizar.";
}

echo "<p style='font-size: 18px; margin-top: 20px;'><strong>Rating Global:</strong> $globalRating</p>";
echo "<p>$recommendation</p>";
echo "</div>";

// ============================================
// INFORMACIÓN ADICIONAL DEL SERVIDOR
// ============================================
echo "<h2>ℹ️ Información del Sistema</h2>";
echo "<table>";
echo "<tr><th>Parámetro</th><th>Valor</th></tr>";
echo "<tr><td>Sistema Operativo</td><td>" . PHP_OS . "</td></tr>";
echo "<tr><td>Arquitectura</td><td>" . php_uname('m') . "</td></tr>";
echo "<tr><td>Memory Limit</td><td>" . ini_get('memory_limit') . "</td></tr>";
echo "<tr><td>Max Execution Time</td><td>" . ini_get('max_execution_time') . " segundos</td></tr>";
echo "<tr><td>Upload Max Filesize</td><td>" . ini_get('upload_max_filesize') . "</td></tr>";
echo "<tr><td>Post Max Size</td><td>" . ini_get('post_max_size') . "</td></tr>";

// Extensiones clave
$extensions = ['mysqli', 'pdo', 'gd', 'curl', 'mbstring', 'zip', 'xml'];
$loaded = [];
foreach ($extensions as $ext) {
    $loaded[$ext] = extension_loaded($ext) ? '✅ Sí' : '❌ No';
}
echo "<tr><td colspan='2'><strong>Extensiones PHP:</strong></td></tr>";
foreach ($loaded as $ext => $status) {
    echo "<tr><td>&nbsp;&nbsp;&nbsp;$ext</td><td>$status</td></tr>";
}
echo "</table>";

// Footer
echo "<div class='footer'>";
echo "<p>🧪 <strong>HostingLab360</strong> - Análisis técnico de hosting web argentino</p>";
echo "<p>🌐 <a href='https://hostinglab360.com.ar' target='_blank'>hostinglab360.com.ar</a> | ";
echo "🐙 <a href='https://github.com/hostinglab360/hostinglab360-recursos' target='_blank'>GitHub</a></p>";
echo "<p style='font-size: 12px; color: #95a5a6;'>Benchmark ejecutado el " . date('Y-m-d H:i:s') . "</p>";
echo "</div>";

echo "</div>"; // container
echo "</body></html>";
?>
