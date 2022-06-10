window.onload = () => {
    const gamesForm = document.getElementById("games");

    gamesForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const formDataGames = new FormData(this);
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "DB.php");
        xhr.responseType = 'json';
        xhr.send(formDataGames);

        xhr.onload = () => {
            document.getElementById("content").innerHTML = xhr.response;
        }
    })

    const playerForm = document.getElementById("player");

    playerForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const formDataPlayer = new FormData(this);
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "DB.php");
        xhr.responseType = 'document';
        xhr.send(formDataPlayer);

        xhr.onload = () => {
            document.getElementById("content").innerHTML = xhr.responseXML.body.innerHTML;
        }
    })

    const leagueForm = document.getElementById("league");

    leagueForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const formDataLeague = new FormData(this);

        fetch("DB.php", {
            method: "post",
            body: formDataLeague
        }).then(function (response){
            return response.text();
        }).then(function (text) {
            document.getElementById("content").innerHTML = text;
        }).catch(function (error) {
            console.error(error);
        });
    })
}


