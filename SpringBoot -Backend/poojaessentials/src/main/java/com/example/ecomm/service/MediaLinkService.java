package com.example.ecomm.service;

import com.example.ecomm.model.MediaLink;
import com.example.ecomm.repository.MediaLinkRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MediaLinkService {

    private final MediaLinkRepository repo;

    public MediaLinkService(MediaLinkRepository repo) {
        this.repo = repo;
    }

    public List<MediaLink> getAllLinks() {
        return repo.findAll();
    }

    public List<MediaLink> getLinksByType(String type) {
        return repo.findByType(type); // ✅ Filtered by type (audio/video)
    }

    public MediaLink save(MediaLink link) {
        return repo.save(link);
    }
}
