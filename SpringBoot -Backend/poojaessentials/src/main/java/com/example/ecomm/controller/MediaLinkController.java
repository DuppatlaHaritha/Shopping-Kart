package com.example.ecomm.controller;

import com.example.ecomm.model.MediaLink;
import com.example.ecomm.service.MediaLinkService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/media")
public class MediaLinkController {

    private final MediaLinkService service;

    public MediaLinkController(MediaLinkService service) {
        this.service = service;
    }

    // Get all links
    @GetMapping
    public List<MediaLink> getAllLinks() {
        return service.getAllLinks();
    }

    // ✅ Get links by type (audio/video)
    @GetMapping("/{type}")
    public List<MediaLink> getLinksByType(@PathVariable String type) {
        return service.getLinksByType(type.toLowerCase());
    }

    // Add new link
    @PostMapping
    public MediaLink addLink(@RequestBody MediaLink link) {
        return service.save(link);
    }
}
