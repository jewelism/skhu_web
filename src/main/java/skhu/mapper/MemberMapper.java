package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import skhu.model.User;

public interface MemberMapper {
   List<User> selectByGisu(int selgisu);
   List<User> selectSearch(@Param("selgisu")int selgisu,@Param("searchsel") int searchsel,@Param("searchtxt") String searchtxt);
   List<User> selectByUid(String uid);
   void updateMng(@Param("uid")String uid,@Param("ustatus")String ustatus, @Param("u_id")String u_id, @Param("u_status")String u_status);
}