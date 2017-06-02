package skhu.mapper;

import skhu.model.PaginationM;
import skhu.model.User;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User selectByLoginId(String u_loginId);
    User selectByStatus(@Param("u_cNumber")int u_cNumber,@Param("u_status")String u_status);
    List<User> selectAll();
    User selectForEmail(@Param("u_loginId")String id,@Param("u_email")String email);
    void update(@Param("u_loginId")String id,@Param("u_count") boolean count,@Param("u_password") String u_password);
    void myUpdate(User user);
    void userUpdateByAdmin(User user);
    List<User> selectPage(PaginationM paginationM);
    int selectCount(PaginationM paginationM);
    void registerUser(User user);
}

