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
  <div class="container">
    <div>
    <img v-bind:src="state.imageURL" >
    </div>
    <div>
      <h2>{{state.original_title}}</h2>
      <p>{{state.overview}}</p>
    </div>
    <button class="button" @click="clickButton">What are we watching tonight?</button>
  </div>
</template>

<style scoped>

.container {
  font-family: arial;
  font-size: 24px;
  margin: 25px;
  width: 80vh;
  height: 100vh;
}

img {
  border: 5px solid #555;
}


.button {

  background-color: #555555; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 24px;
}
</style>
