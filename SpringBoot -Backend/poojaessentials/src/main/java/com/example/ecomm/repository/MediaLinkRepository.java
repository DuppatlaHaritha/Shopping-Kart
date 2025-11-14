package com.example.ecomm.repository;

import com.example.ecomm.model.MediaLink;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface MediaLinkRepository extends JpaRepository<MediaLink, Long> {
    List<MediaLink> findByType(String type); // ✅ Added for filtering
}
