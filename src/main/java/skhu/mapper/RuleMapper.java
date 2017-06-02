package skhu.mapper;

import java.util.List;
import skhu.model.Rule;
import skhu.model.Pagination;

public interface RuleMapper {
    Rule selectById(int id);
    void insert(Rule rule);
    void updater_num(int id);
    List<Rule> selectPage(Pagination pagination);
    int selectCount(Pagination pagination);
    void delete(int id);
    void updateRule(Rule rule);
    int Rule_max();
}