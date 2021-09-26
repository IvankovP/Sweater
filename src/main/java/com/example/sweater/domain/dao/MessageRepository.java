package com.example.sweater.domain.dao;

import com.example.sweater.domain.entity.Message;
import org.springframework.data.repository.CrudRepository;

public interface MessageRepository extends CrudRepository<Message, Integer> {
    Iterable<Message> findByTag(String tag);
}
