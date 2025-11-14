package com.example.ecomm.model;

import jakarta.persistence.*;

@Entity
@Table(name = "media_links")
public class MediaLink {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;  // e.g. "Lord Ganesha"
    private String link;  // e.g. "https://open.spotify.com/..."
    private String type;  // ✅ new field: "audio" or "video"

    public MediaLink() {}

    public MediaLink(String name, String link, String type) {
        this.name = name;
        this.link = link;
        this.type = type;
    }

    // ✅ Getters and Setters
    public Long getId() { return id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getLink() { return link; }
    public void setLink(String link) { this.link = link; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}
