package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Insurance;
import tech.csm.repo.InsuranceRepo;

@Service
public class InsuranceServiceImpl implements InsuranceService {

	@Autowired
	private InsuranceRepo insuranceRepo;

	@Override
	public String createCropInsurance(Insurance insurance) {
	    Insurance existingInsurance = insuranceRepo.findByAadhaarNoAndCrop(insurance.getAadharNo(), insurance.getCrop());

	    if (existingInsurance == null) {
	        Insurance savedInsurance = insuranceRepo.save(insurance);
	        return "Crop Insurance created with id " + savedInsurance.getInsuranceId();
	    } else {
	        return "Duplicate Aadhaar found for the selected crop";
	    }
	}

	@Override
	public List<Insurance> getAllInsurances() {
		return insuranceRepo.findAll();
	}

	@Override
	public String deleteCropInsurance(Integer insuranceId) {
		Insurance insurance = insuranceRepo.findById(insuranceId).get();
		
		if(insurance != null) {
			insuranceRepo.delete(insurance);
		}
		return "Insurance deleted";
	}

	@Override
	public Insurance getInsuranceById(Integer insuranceId) {
		return insuranceRepo.findById(insuranceId).get();
	}

}
