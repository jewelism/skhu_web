package skhu.mapper;

import java.util.List;
import skhu.model.R_UpdateId;
import skhu.model.R_DropUser;

public interface RequestMapper {
	R_UpdateId selectRequestId(String ru_id);
	R_UpdateId alreadyRequest(String u_id);
	R_DropUser alreadyRequestDrop(String u_id);
	List<R_UpdateId> RequestIdList1();
	List<R_UpdateId> RequestIdList2();
	void okRequestId(R_UpdateId r_updateId);
	void noRequestId(R_UpdateId r_updateId);
	void delRequestId(R_UpdateId r_updateId);
	
	R_DropUser selectRequestDrop(String rd_id);
	void insert(R_UpdateId r_updateId);
	void insertDrop(R_DropUser r_dropUser);
	List<R_DropUser> RequestDropList1();
	List<R_DropUser> RequestDropList2();
	void okRequestDrop(R_DropUser r_dropUser);
	void noRequestDrop(R_DropUser r_dropUser);
	void delRequestDrop(R_DropUser r_dropUser);
	void delDropComplete(R_DropUser r_dropUser);
}
