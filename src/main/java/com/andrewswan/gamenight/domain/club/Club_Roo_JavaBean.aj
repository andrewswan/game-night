// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.andrewswan.gamenight.domain.club;

import com.andrewswan.gamenight.domain.club.Club;
import com.andrewswan.gamenight.domain.club.Membership;
import com.andrewswan.gamenight.domain.person.Person;
import java.util.Date;
import java.util.Set;

privileged aspect Club_Roo_JavaBean {
    
    public String Club.getName() {
        return this.name;
    }
    
    public void Club.setName(String name) {
        this.name = name;
    }
    
    public Date Club.getDateAdded() {
        return this.dateAdded;
    }
    
    public void Club.setDateAdded(Date dateAdded) {
        this.dateAdded = dateAdded;
    }
    
    public Person Club.getAddedBy() {
        return this.addedBy;
    }
    
    public void Club.setAddedBy(Person addedBy) {
        this.addedBy = addedBy;
    }
    
    public Set<Membership> Club.getMembers() {
        return this.members;
    }
    
    public void Club.setMembers(Set<Membership> members) {
        this.members = members;
    }
    
}
