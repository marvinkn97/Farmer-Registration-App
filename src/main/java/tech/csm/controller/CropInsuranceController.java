package tech.csm.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletResponse;
import tech.csm.model.Crop;
import tech.csm.model.Insurance;
import tech.csm.model.Season;
import tech.csm.service.CropService;
import tech.csm.service.InsuranceService;
import tech.csm.service.SeasonService;

@Controller
public class CropInsuranceController {

	@Autowired
	private SeasonService seasonService;

	@Autowired
	private CropService cropService;

	@Autowired
	private InsuranceService insuranceService;

	@GetMapping("/getform")
	public String getRegistrationForm(Model model) {
		List<Season> seasonList = seasonService.getAllSeasons();
		List<Insurance> insuranceList = insuranceService.getAllInsurances();

		model.addAttribute("seasons", seasonList);
		model.addAttribute("insurances", insuranceList);

		return "regform";
	}

	@GetMapping("/getCropsBySeasonId")
	public void getCropsBySeasonId(@RequestParam("seasonId") Integer seasonId, HttpServletResponse response) {
		List<Crop> cropList = cropService.getAllCropsBySeasonId(seasonId);

		response.setContentType("text/html");

		System.out.println(cropList);
		try {

			String res = "<option value='0'>--select--</option>";

			for (Crop c : cropList) {
				res += "<option value='" + c.getCropId() + "'>" + c.getCropName() + "</option>";
			}

			response.getWriter().println(res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@PostMapping("/saveInsurance")
	public String saveInsurance(@ModelAttribute Insurance insurance, RedirectAttributes redirectAttributes) {

		if (insurance == null) {
			redirectAttributes.addFlashAttribute("msg", "Invalid insurance data");
			return "redirect:/getform";
		}

		String msg = insuranceService.createCropInsurance(insurance);
		redirectAttributes.addFlashAttribute("msg", msg);

		return "redirect:/getform";
	}
	
	
	@GetMapping("/deleteInsurance")
	public String deleteInsurance(@RequestParam("insuranceId") Integer id,  RedirectAttributes redirectAttributes ) {
		String msg = insuranceService.deleteCropInsurance(id);
		redirectAttributes.addFlashAttribute("msg", msg);
		
		return "redirect:/getform";
	}
	
}
