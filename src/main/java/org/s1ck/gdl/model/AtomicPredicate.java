package org.s1ck.gdl.model;

/**
 * Created by niklas on 18.05.16.
 */
public class AtomicPredicate implements Predicate {
  private String variable;
  private String property;
  private String type;
  private String value;

  public String getVariable() {
    return variable;
  }

  public void setVariable(String variable) {
    this.variable = variable;
  }

  public String getProperty() {
    return property;
  }

  public void setProperty(String property) {
    this.property = property;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

  public String toString() {
    return variable + "." + property + " " + type + " " + value;
  }

  public String toString(int depth) {
    String indentation = "";
    for(int i=0;i<depth;i++){
      indentation += "    ";
    }
    return indentation + "[" + variable + "." + property + " " + type + " " +
      value + "]";
  }
}
