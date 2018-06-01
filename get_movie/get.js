const fetch = require("node-fetch");
const fs = require("fs");
const imageDir = "./images";
const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'gkak2m7!',
    database: 'movie_hi'
});
connection.connect();

function query(...args) {
    return new Promise((resolve, reject) => {
        connection.query(...args, (err, rows) => {
            if (err) {
                // console.log(err.sql);
                resolve(err);
            }
            else resolve(rows);
        });
    });
}

let genre_url = "https://api.themoviedb.org/3/genre/movie/list?api_key=7198a7592a7c1af6584fd5ff314062ff&language=ko-KR";
let credit_url = "https://api.themoviedb.org/3/movie/";
let api_url = "https://api.themoviedb.org/3/discover/movie?api_key=7198a7592a7c1af6584fd5ff314062ff&language=ko-KR&sort_by=popularity.desc&include_adult=false&include_video=true&page=";
let poster_url = "https://image.tmdb.org/t/p/original";
let detail_url = "https://api.themoviedb.org/3/movie/";

let count = 1;
(async () => {
    const date = Date.now();

    // 장르
    try {
        let genreResult = await fetch(genre_url);
        genreResult = await genreResult.json();
        for (genre of genreResult.genres) {
            const a = await query(`INSERT INTO genre(id, genre) values(?, ?)`, [genre.id, genre.name]);
            //if(a === 'error') console.log(`INSERTION FAIL: ${genre.id} ${genre.name}`);
        }
    } catch(e) {
        // console.log(e.code);
    }
    const page = 1;

    for(let i = 1; i <= 10; i++) {
        let res = await fetch(api_url + i);
        res = await res.json();

        for(movie of res.results) {
            process.stdout.clearLine();
			process.stdout.cursorTo(0);
			process.stdout.write("downloading... " + count++ + "/" + 10);

            let directorId;
            let creditResult = await fetch(credit_url + movie.id + "/credits?api_key=7198a7592a7c1af6584fd5ff314062ff");
            creditResult = await creditResult.json();
            
            let detailResult = await fetch(detail_url + movie.id + "?api_key=7198a7592a7c1af6584fd5ff314062ff&language=ko-KR");
            detailResult = await detailResult.json();

            for(credit of creditResult.cast) {
                await query(`INSERT INTO actor(id, name) VALUES(?, ?)`, [credit.id, credit.name]);
            }

            for(credit of creditResult.crew) {
                if(credit.job === "Director") {
                    directorId = credit.id;
                    await query(`INSERT INTO director(id, name) VALUES(?, ?)`, [credit.id, credit.name]);
                }
            }

            const videos = await fetch(`https://api.themoviedb.org/3/movie/${movie.id}/videos?api_key=7198a7592a7c1af6584fd5ff314062ff`);
            let youtube = 'null';
            const videoResult = await videos.json();

            for(url of videoResult.results) {
                if(url.site === 'YouTube') {
                    youtube = url.key;
                }
            }
            await query(`INSERT INTO movie(id, title, original_title, description, director_id, poster_path, backdrop_path, runtime, small_backdrop_path, vote_count, vote_average, release_date, youtube) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [movie.id, movie.title, movie.original_title, movie.overview, directorId, (poster_url + movie.poster_path), (poster_url + movie.backdrop_path), detailResult.runtime, (poster_url + detailResult.backdrop_path),
                detailResult.vote_count, detailResult.vote_average, detailResult.release_date, youtube]);

            for(genre of movie.genre_ids) {
                await query(`INSERT INTO movie_genres(movie_id, genre_id) VALUES(?, ?)`,
                    [movie.id, genre]);
            }

            for(credit of creditResult.cast) {
                await query(`INSERT INTO movie_role(movie_id, actor_id, role_name) VALUES(?, ?, ?)`,
                    [movie.id, credit.id, credit.character]);
            }

            // let r = await fetch(poster_url + movie.poster_path);

            // const dest = fs.createWriteStream(imageDir + movie.poster_path);						
            // r.body.pipe(dest);
		}
    }
    console.log(`\n${(Date.now() - date)/1000}s`);
    process.exit();
})();
