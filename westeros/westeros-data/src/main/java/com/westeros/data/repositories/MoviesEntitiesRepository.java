package com.westeros.data.repositories;

import com.westeros.data.model.Movie;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Transactional
@Repository
@RequiredArgsConstructor
public class MoviesEntitiesRepository implements IMoviesEntitiesRepository {

    private final EntityManager entityManager;

    public List<Movie> getAll(){
        return entityManager
                .createQuery("SELECT m FROM Movie m WHERE m.id>0", Movie.class)
                .setMaxResults(10)
                .setFirstResult(2)
                .getResultList();
    }
 }
