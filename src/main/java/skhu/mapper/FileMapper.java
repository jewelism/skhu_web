package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import skhu.model.File;

public interface FileMapper {
    List<File> r_file_selectByArticleId(int r_id);
    File r_file_selectByArticleId2(int r_id);
    File r_file_selectById(int f_id);
    void r_file_insert(File file);
    void r_file_delete(int f_id);
    void r_file_deleteByArticleId(int r_id);
}