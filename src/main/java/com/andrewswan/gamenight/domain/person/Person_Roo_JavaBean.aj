// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.andrewswan.gamenight.domain.person;

import com.andrewswan.gamenight.domain.club.Membership;
import com.andrewswan.gamenight.domain.person.Person;
import java.util.Date;
import java.util.Set;

privileged aspect Person_Roo_JavaBean {
    
    public String Person.getName() {
        return this.name;
    }
    
    public void Person.setName(String name) {
        this.name = name;
    }
    
    public String Person.getOpenID() {
        return this.openID;
    }
    
    public void Person.setOpenID(String openID) {
        this.openID = openID;
    }
    
    public Date Person.getDateRegistered() {
        return this.dateRegistered;
    }
    
    public void Person.setDateRegistered(Date dateRegistered) {
        this.dateRegistered = dateRegistered;
    }
    
    public Set<Membership> Person.getMemberships() {
        return this.memberships;
    }
    
    public void Person.setMemberships(Set<Membership> memberships) {
        this.memberships = memberships;
    }
    
}