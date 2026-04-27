<?php 
include __DIR__ . '/../db.php'; 

// CHANGE THESE TWO FOR EACH FILE
$class_id = 8; 
$class_name = 'Ranger'; 

// Fetch subclass names and their submission counts
$query = "SELECT s.name, COUNT(cs.id) as total 
          FROM subclasses s 
          LEFT JOIN character_submissions cs ON s.id = cs.subclass_id 
          WHERE s.class_id = $class_id 
          GROUP BY s.id 
          ORDER BY s.id ASC";

$result = $conn->query($query);

$labels = [];
$counts = [];

while($row = $result->fetch_assoc()) {
    $labels[] = $row['name'];
    $counts[] = (int)$row['total'];
}

// Query for Race Popularity in this class
$race_query = "SELECT r.name, COUNT(cs.id) as total 
               FROM character_submissions cs
               JOIN races r ON cs.race_id = r.id
               WHERE cs.class_id = $class_id 
               GROUP BY r.id 
               ORDER BY total DESC";

$race_result = $conn->query($race_query);

$race_labels = [];
$race_counts = [];

while($row = $race_result->fetch_assoc()) {
    $race_labels[] = $row['name'];
    $race_counts[] = (int)$row['total'];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo $class_name; ?> Stats</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { font-family: sans-serif; background: #f4f4f9; padding: 40px; }
        .container { max-width: 800px; margin: auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { text-align: center; color: #d92121; }
    </style>
</head>
<body>
    <h4><a href="../index.html">Return Home</a></h4>
    <div class="container">
        <h1><?php echo $class_name; ?> Subclass Popularity</h1>
        <canvas id="subclassChart"></canvas>
        <h2>Popular Races for <?php echo $class_name; ?>s</h2>
        <canvas id="raceChart" height="100"></canvas>
    </div>

    <script>
        const ctx = document.getElementById('subclassChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: <?php echo json_encode($labels); ?>,
                datasets: [{
                    label: 'Total Submissions',
                    data: <?php echo json_encode($counts); ?>,
                    backgroundColor: 'rgba(217, 33, 33, 0.7)',
                    borderColor: 'rgba(217, 33, 33, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                indexAxis: 'y',
                scales: { x: { beginAtZero: true, ticks: { stepSize: 1 } } }
            }
        });

        const raceCtx = document.getElementById('raceChart').getContext('2d');
        new Chart(raceCtx, {
            type: 'bar',
            data: {
                labels: <?php echo json_encode($race_labels); ?>,
                datasets: [{
                    label: 'Characters',
                    data: <?php echo json_encode($race_counts); ?>,
                    backgroundColor: 'rgba(33, 150, 243, 0.7)', // Blue color to distinguish from subclasses
                    borderColor: 'rgba(33, 150, 243, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                indexAxis: 'y',
                scales: { x: { beginAtZero: true, ticks: { stepSize: 1 } } }
            }
        });
    </script>

    
    
</body>
</html>