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
  * @fileName : OrdersVO.java
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
public class OrdersVO extends Criteria {
	private int orderid;
	private int orderquantity;
	private String orderdate;
}
