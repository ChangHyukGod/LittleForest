/**
 * 
 */
package com.simplecoding.repositoryexam.controller.basic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
  * @fileName : AllgameController.java
  * @author : KTE
  * @since : 2024. 9. 27. 
  * description :
  */
@Controller
public class AllgameController {
	@GetMapping("/allgame")
	public String allgame()	{
		return "basic/allgame";
	}
}
