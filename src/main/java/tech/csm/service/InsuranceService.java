package tech.csm.service;

import java.util.List;

import tech.csm.model.Insurance;

public interface InsuranceService {
	
	String createCropInsurance(Insurance insurance);
	List<Insurance> getAllInsurances();
	String deleteCropInsurance(Integer insuranceId);
	Insurance getInsuranceById(Integer insuranceId);

}
