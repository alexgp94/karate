({
    // Genera un nombre aleatorio
    randomName: function() {
        var firstNames = ['Ana','Bruno','Carlos','Diana','Elena','Fernando','Gabriela','Henrique'];
        var lastNames = ['Silva','Souza','Pereira','Oliveira','Costa','Almeida','Santos','Mendes'];
        var firstName = firstNames[Math.floor(Math.random() * firstNames.length)];
        var lastName = lastNames[Math.floor(Math.random() * lastNames.length)];

        return firstName + ' ' + lastName; // Ej: "Ana Santos"
    },

    // Genera email según la regla: Primera letra del nombre + Apellido + número aleatorio
    randomEmail: function(name) {
        // Si se pasa un nombre, usarlo; si no, generar uno
        if (!name) name = this.randomName();
        var parts = name.split(' ');  // ["Ana", "Santos"]
        var firstInitial = parts[0][0].toUpperCase(); // "A"
        var lastName = parts[1]; // "Santos"
        var randomNum = Math.floor(Math.random() * 1000); // número aleatorio 0-99
        return firstInitial + lastName + randomNum + '@test.com'; // "ASantos23@test.com"
    }
})
