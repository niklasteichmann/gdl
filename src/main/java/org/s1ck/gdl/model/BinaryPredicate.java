package org.s1ck.gdl.model;

/**
 * Created by niklas on 18.05.16.
 */
public class BinaryPredicate implements Predicate{

  private Predicate leftSide;
  private Predicate rightSide;
  private String relation;

  public Predicate getLeftSide() {
    return leftSide;
  }

  public void setLeftSide(Predicate leftSide) {
    this.leftSide = leftSide;
  }

  public Predicate getRightSide() {
    return rightSide;
  }

  public void setRightSide(Predicate rightSide) {
    this.rightSide = rightSide;
  }

  public String getRelation() {
    return relation;
  }

  public void setRelation(String relation) {
    this.relation = relation;
  }
}
