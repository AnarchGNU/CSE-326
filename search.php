<!DOCTYPE html>
<html lang="en">

  <head>
    <?php require_once 'includes/head.php'; ?>

    <!-- Title -->
    <title>PyFlicks - Find New Movies</title>
  </head>

  <body>

    <header>
      <?php require_once 'includes/header.php'; ?>
    </header>

    <main>
      <div>
        <form action="results.php" method="get">
          <h4> Search for</h4>
          <input type="text" placeholder="Search" name="search"> <br>

          <h4>Search by</h4>
          <input type="radio" name="searchBy" value="Title" group='by' checked>Title 
          <input type="radio" name="searchBy" value="Actor" group='by'>Actor
          <input type="radio" name="searchBy" value="Producer" group='by'>Producer <br>

          <h4>Search Type</h4>
          <input type="radio" name="Stype" value="Exact" group="type" checked> Exact Match
          <input type="radio" name="Stype" value="Partial" group="type"> Partial Match <br>

        </form>
      </div>
    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>
  
  </body>
</html>