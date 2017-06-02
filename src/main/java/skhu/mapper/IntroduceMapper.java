package skhu.mapper;

import skhu.model.Greeting;
import skhu.model.Introduce;


public interface IntroduceMapper {
   void update(String introduce);
   Introduce select();
   void g_update(Greeting greeting);
   Greeting g_select(int r_id);
   void g_insert(Greeting greeting);
}