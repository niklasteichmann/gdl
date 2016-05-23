package org.s1ck.gdl.model;

/**
 * Created by niklas on 18.05.16.
 */
public interface Predicate {

  void setType(String type);

  String getType();

  String toString();

  String toString(int depth);
}
