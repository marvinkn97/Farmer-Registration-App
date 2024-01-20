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
@Table(name="t_crop")
public class Crop implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6313865573474632937L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="crop_id")
	private Integer cropId;
	private String cropName;
	
	@ManyToOne
	@JoinColumn(name="season_id")
	private Season season;
}
