package tech.csm.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name="t_insurance")
public class Insurance implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5284333810799216737L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="insurance_id")
	private Integer insuranceId;
	
	@Column(name="farmer_name")
	private String farmerName;
	
	@Column(name="aadhar_no")
	private String aadharNo;
	
	private String address;
	
	@Column(name="father_name")
	private String fatherName;
	
	@Column(name="farmer_category")
	private String farmerCategory;
	
	@ManyToOne
	@JoinColumn(name="crop_id")
	private Crop crop;

}
