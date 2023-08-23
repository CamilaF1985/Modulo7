document.addEventListener("DOMContentLoaded", function() {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener("change", function() {
            checkboxes.forEach(function(otherCheckbox) {
                if (otherCheckbox !== checkbox) {
                    otherCheckbox.disabled = checkbox.checked;
                }
            });
        });
    });

    function updateTimers() {
        var now = new Date();

        var contadorElements = document.querySelectorAll(".contador");

        contadorElements.forEach(function(contadorElement) {
            var fechaIngresoString = contadorElement.getAttribute("data-fechaIngreso");
            var estado = contadorElement.getAttribute("data-estado");

            if (estado === "Despachado") {
                var fechaDespachoString = contadorElement.getAttribute("data-fechaDespacho");
                var fechaIngreso = new Date(fechaIngresoString);
                var fechaDespacho = new Date(fechaDespachoString);
                var tiempoTranscurrido = fechaDespacho - fechaIngreso; // Diferencia en milisegundos

                var segundos = Math.floor(tiempoTranscurrido / 1000) % 60;
                var minutos = Math.floor(tiempoTranscurrido / (1000 * 60)) % 60;
                var horas = Math.floor(tiempoTranscurrido / (1000 * 60 * 60));

                // Formatear el tiempo en "hh:mm:ss" solo si es positivo
                if (horas >= 0 && minutos >= 0 && segundos >= 0) {
                    var formattedHoras = horas.toString().padStart(2, "0");
                    var formattedMinutos = minutos.toString().padStart(2, "0");
                    var formattedSegundos = segundos.toString().padStart(2, "0");

                    contadorElement.textContent = `${formattedHoras}:${formattedMinutos}:${formattedSegundos}`;
                } else {
                    contadorElement.textContent = "Despachado"; // Si el tiempo es negativo
                }
            } else {
                var fechaIngreso = new Date(fechaIngresoString);
                var tiempoTranscurrido = now - fechaIngreso; // Diferencia en milisegundos

                var segundos = Math.floor(tiempoTranscurrido / 1000) % 60;
                var minutos = Math.floor(tiempoTranscurrido / (1000 * 60)) % 60;
                var horas = Math.floor(tiempoTranscurrido / (1000 * 60 * 60));

                // Asegurar que los valores de horas, minutos y segundos tengan dos dígitos
                var formattedHoras = horas.toString().padStart(2, "0");
                var formattedMinutos = minutos.toString().padStart(2, "0");
                var formattedSegundos = segundos.toString().padStart(2, "0");

                contadorElement.textContent = `${formattedHoras}:${formattedMinutos}:${formattedSegundos}`;
            }
        });
    }

    updateTimers();
    // Actualizar los contadores cada segundo 
    setInterval(updateTimers, 1000);
});








