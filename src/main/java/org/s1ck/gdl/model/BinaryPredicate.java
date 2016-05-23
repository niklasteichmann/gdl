package org.s1ck.gdl.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by niklas on 18.05.16.
 */
public class BinaryPredicate implements Predicate{

  private List<Predicate> children;
  private String type;

  public BinaryPredicate(){
    this.children = new ArrayList<>();
  }

  public List<Predicate> getChildren() {
    return children;
  }

  public void setChildren(List<Predicate> children) {
    this.children = children;
  }

  public void addChild(Predicate child) {
    this.children.add(child);
  }


  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String toString() {
    String string = type + "[";
    for(Predicate child : children) {
      string += "\n" + child.toString(1);
    }
    string += "\n]";
    return  string;
  }

  public String toString(int depth){
    String indentation = "";
    for(int i=0;i<depth;i++){
      indentation += "    ";
    }
    String string = indentation + type + "[";
    for(Predicate child : children) {
      string += "\n" + child.toString(depth + 1);
    }
    string += "\n" + indentation + "]";
    return  string;
  }
}
