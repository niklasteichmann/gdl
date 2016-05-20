package org.s1ck.gdl.model;

/**
 * Created by niklas on 18.05.16.
 */
public class UnaryPredicate implements Predicate{

  private String variable;
  private String property;
  private String relation;
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

  public String getRelation() {
    return relation;
  }

  public void setRelation(String relation) {
    this.relation = relation;
  }

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }
}
