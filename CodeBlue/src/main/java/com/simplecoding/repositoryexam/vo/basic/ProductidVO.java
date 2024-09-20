/**
 * 
 */
package com.simplecoding.repositoryexam.vo.basic;



import com.simplecoding.repositoryexam.vo.common.Criteria;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
  * @fileName : ProductidVO.java
  * @author : KTE
  * @since : 2024. 9. 20. 
  * description :
  */
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@SuppressWarnings("serial")
public class ProductidVO extends Criteria {
	private int productid;
	private String productname;
	private int price;
}
