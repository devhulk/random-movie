<script setup>
import { reactive } from 'vue'

const state = reactive({

imgURL: "",
randomPage: 0,
original_title: "",
overview: "",

})
// Set API endpoint URL and API key
const baseImageURL = "https://image.tmdb.org/t/p/w500/"
const endpointUrl = "https://api.themoviedb.org/3/discover/movie";
const apiKey = import.meta.env.VITE_TMDBKEY;




async function clickButton() {

  state.randomPage = Math.floor(Math.random() * 500) + 1;
  const apiUrl = `${endpointUrl}?api_key=${apiKey}&language=en-US&sort_by=popularity.desc&page=${state.randomPage}`;
   
  await fetch(apiUrl)
    .then(response => response.json())
    .then(data => {
      // Retrieve a random movie from the results
      let randomResults = Math.floor(Math.random() * data.results.length)
      const randomMovie = data.results[randomResults];
      state.imageURL = `${baseImageURL}${randomMovie.backdrop_path}`
      state.original_title = randomMovie.original_title
      state.overview = randomMovie.overview
    })
    .catch(error => console.error(error));

}

</script>

<template>
  <div>
    <div class="container">
      <img v-bind:src="state.imageURL" >
        <h2 id="header">{{state.original_title}}</h2>
        <p id="description">{{state.overview}}</p>
      <button class="button" @click="clickButton">What are we watching tonight?</button>
    </div>

  </div>
</template>

<style scoped>

#background-video {
  width: 100vw;
  height: 100vh;
  object-fit: cover;
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  z-index: -1;
}
.container {
  font-family: roboto;
  font-size: 24px;
  margin: 25px;
  width: 40vh;
  height: 100vh;
  text-align: center;
}


p {

}

img {
  border: 5px solid #555;
  width: 40vh;
}


.button {

  text-align: center;
  background-color: #555555; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 24px;
  margin-top: 20px;
  width: 40vh;
}
</style>
