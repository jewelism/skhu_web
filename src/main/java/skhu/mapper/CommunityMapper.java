 package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import skhu.model.Board;
import skhu.model.Comment;
import skhu.model.File;
import skhu.model.Notice;

import skhu.model.Pagination;

public interface CommunityMapper{
   List<Notice> selectAll(Pagination pagination);
   int selectCount(Pagination pagination);
   Notice selectById(String id);
   void insert_file(File file);
   List<File> select_file_byn_Id(String id);
   File select_file_byf_Id(String id);
   void notice_Delete(String n_id);
   void file_delete(String id);
   int max();
   void notice_update(@Param("n_id") String id,
         @Param("n_title")String title,@Param("n_content")String content);
   void notice_insert
   (@Param("n_writerId")String id,@Param("n_writerName")String name,
         @Param("n_title")String title,@Param("n_content")String content,@Param("n_file")boolean file);
   int search_file(String id);
   int count_n(int id);
   void notice_file(int id);
   void n_ch(String id);
   void comment_insert(Comment comment);
   List<Comment> notice_comment(String id);
   List<Comment> board_comment(String id);
   int max_nid ();
   void delete_comment(String id);
   void n_c(@Param("id")int id,@Param("content")String content);
   List<Comment> coment_list(String id);
   void count(int id);
   void count_d(String id);
   
   List<Board> board_selectAll(Pagination pagination);
   int board_selectCount(Pagination pagination);
   Board board_selectById(String id);
   void board_insert_file(File file);
   List<File> board_select_file_byb_Id(String id);
   void board_Delete(String b_id);
   void board_file_delete(String id);
   int board_max();
   void board_update(@Param("b_id") String id,
         @Param("b_title")String title,@Param("b_content")String content);
   void board_insert
   (@Param("b_writerId")String id,@Param("b_writerName")String name,
         @Param("b_title")String title,@Param("b_content")String content,@Param("b_file")boolean file);
   int search_bfile(String id);
   int count_b(int id);
   void board_file(int id);
   void b_ch(String id);
   void b_comment_insert(Comment comment);
   List<Comment> b_coment_list(String id);
   void count_bb(int id);
   void count_bd(String id);
   void board_insert_ad
   (@Param("b_aid")String id,@Param("b_writerName")String name,
         @Param("b_title")String title,@Param("b_content")String content,@Param("b_file")boolean file);
}