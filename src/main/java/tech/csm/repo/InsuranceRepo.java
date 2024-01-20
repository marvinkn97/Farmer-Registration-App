package tech.csm.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tech.csm.model.Crop;
import tech.csm.model.Insurance;

@Repository
public interface InsuranceRepo extends JpaRepository<Insurance, Integer> {
    @Query("SELECT i FROM Insurance i WHERE i.aadharNo = :aadharNo AND i.crop = :crop")
    Insurance findByAadhaarNoAndCrop(@Param("aadharNo") String aadharNo, @Param("crop") Crop crop);
}
