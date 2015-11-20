<?php include_once 'partials/header.php'; ?>
<div data-role="page">
    <div data-role="header">
        <h1>Restaurante "Lo Nuestro"</h1>
    </div>
    <div data-role="content">
        <?php echo validation_errors(); ?>

        <?php echo form_open(); ?>
        <label for="uname">Nombre de Usuario</label>
        <input type="text" name="uname" id="uname" placeholder="Usuario" required>

        <label for="upass">Contraseña</label>
        <input type="password" name="upass" id="upass" placeholder="contrasena" required>

        <input type="submit" value="Ingresar" data-role="button">
        </form>
    </div>
</div>
<?php include_once 'partials/footer.php'; ?>