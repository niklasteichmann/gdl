package org.s1ck.gdl.model;

/**
 * Created by niklas on 18.05.16.
 */
public class UnaryPredicate implements Predicate{

  private String type;
  private Predicate child;

  @Override
  public String getType() {
    return type;
  }

  @Override
  public void setType(String type) {
    this.type = type;
  }

  public Predicate getChild() {
    return child;
  }

  public void setChild(Predicate child) {
    this.child = child;
  }

  @Override
  public String toString(){
    return "\n" + type + "[\n" + child.toString(1) + "\n]";
  }

  public String toString(int depth){
    String indentation = "";
    for(int i=0;i<depth;i++){
      indentation += "    ";
    }
    return indentation + type + "[\n"
         + child.toString(depth + 1) + "\n"
         + indentation + "]";
  }
}
