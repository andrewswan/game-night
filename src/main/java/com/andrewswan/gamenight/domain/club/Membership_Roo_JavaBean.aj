// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.andrewswan.gamenight.domain.club;

import com.andrewswan.gamenight.domain.club.Club;
import com.andrewswan.gamenight.domain.club.Membership;
import com.andrewswan.gamenight.domain.person.Person;
import java.util.Date;

privileged aspect Membership_Roo_JavaBean {
    
    public Person Membership.getPerson() {
        return this.person;
    }
    
    public void Membership.setPerson(Person person) {
        this.person = person;
    }
    
    public Club Membership.getClub() {
        return this.club;
    }
    
    public void Membership.setClub(Club club) {
        this.club = club;
    }
    
    public Date Membership.getDateFrom() {
        return this.dateFrom;
    }
    
    public void Membership.setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }
    
    public Date Membership.getDateTo() {
        return this.dateTo;
    }
    
    public void Membership.setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }
    
    public Boolean Membership.getManager() {
        return this.manager;
    }
    
    public void Membership.setManager(Boolean manager) {
        this.manager = manager;
    }
    
}