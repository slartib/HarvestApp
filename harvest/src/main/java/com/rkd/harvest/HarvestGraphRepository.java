package com.rkd.harvest;

import org.springframework.data.neo4j.repository.Neo4jRepository;

public interface HarvestGraphRepository extends Neo4jRepository<Grower, Integer>
{
}
