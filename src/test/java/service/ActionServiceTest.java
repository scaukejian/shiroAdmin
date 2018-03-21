package service;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.yuezhi.ws.http.vo.ActionVO;
import com.yuezhi.ws.service.ActionService;
import service.base.ServiceTestBase;

public class ActionServiceTest extends ServiceTestBase {

	Logger logger = LoggerFactory.getLogger(ActionServiceTest.class);

	@Autowired
	private ActionService actionService;

	/**
	 * 分页查询
	 */
	@Test
	public void getActionByUrl() {
		ActionVO action = actionService
				.getActionByUrl("/pages/action/action-list.jsp");
		logger.info(action.toString());
	}

	@Test
	public void getLocation() {
		String action = actionService
				.getLocation("/pages/action/action-list.jsp");
		logger.info(action.toString());
	}

}
