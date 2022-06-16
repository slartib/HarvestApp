package com.rkd.harvest;


import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Property;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node("Grower")
public class Grower
{
  @Id
  private final Integer id;
  @Property
  private final String name;
  @Property
  private final String city;
  @Property
  private final String state;
 // @Relationship
 // private

  public Grower(Integer id, String name, String city, String state)
  {
    this.id = id;
    this.name = name;
    this.city = city;
    this.state = state;
  }
}
