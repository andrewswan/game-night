// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.andrewswan.gamenight.domain.club;

import com.andrewswan.gamenight.domain.club.Membership;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Membership_Roo_Jpa_Entity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Membership.id;
    
    @Version
    @Column(name = "version")
    private Integer Membership.version;
    
    public Long Membership.getId() {
        return this.id;
    }
    
    public void Membership.setId(Long id) {
        this.id = id;
    }
    
    public Integer Membership.getVersion() {
        return this.version;
    }
    
    public void Membership.setVersion(Integer version) {
        this.version = version;
    }
    
}
