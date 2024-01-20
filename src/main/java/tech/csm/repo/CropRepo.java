package tech.csm.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tech.csm.model.Crop;

@Repository
public interface CropRepo extends JpaRepository<Crop, Integer> {

    @Query("SELECT c FROM Crop c WHERE c.season.seasonId = :sid")
    List<Crop> findBySeasonId(@Param("sid") Integer seasonId);

}
