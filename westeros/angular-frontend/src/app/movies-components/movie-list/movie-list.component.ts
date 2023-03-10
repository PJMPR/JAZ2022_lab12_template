import { Component, OnInit } from '@angular/core';
import { MovieSummary } from '../../contracts/movie-summary'
import { MovieService } from '../../movie.service'
import { Router } from '@angular/router';
import {SearchParams} from "../../contracts/search-params";
@Component({
  selector: 'app-movie-list',
  templateUrl: './movie-list.component.html',
  styleUrls: ['./movie-list.component.css']
})
export class MovieListComponent implements OnInit {

  pageSizes=[10,20,30];
  selectedPageSize = this.pageSizes[0];
  title:String;
  runtime:number;
  dateFrom:Date;
  dateTo:Date;
  searchParams=new SearchParams(1, 10);

  movies: MovieSummary[];

  constructor(private movieService: MovieService,
    private router: Router) { }

  ngOnInit(): void {
    this.getMovies();
  }

  private getMovies(){
    this.movieService.getMoviesList().subscribe(data => {
      this.movies = data;
    });
  }

  movieDetails(id: number){
    this.router.navigate(['movie-details', id]);
  }

  updateMovie(id: number){
    this.router.navigate(['update-movie', id]);
  }

  deleteMovie(id: number){
    this.movieService.deleteMovie(id).subscribe(data => {
      console.log(data);
      this.getMovies();
    })
  }


  performSearch(){
    this.movieService.searchMoviesList(this.searchParams).subscribe(data => {
      this.movies = data;
    });
  }
}
