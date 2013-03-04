// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.andrewswan.gamenight.domain.person;

import com.andrewswan.gamenight.domain.person.Person;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Person_Roo_Finder {
    
    public static TypedQuery<Person> Person.findPeopleByOpenIDEquals(String openID) {
        if (openID == null || openID.length() == 0) throw new IllegalArgumentException("The openID argument is required");
        EntityManager em = Person.entityManager();
        TypedQuery<Person> q = em.createQuery("SELECT o FROM Person AS o WHERE o.openID = :openID", Person.class);
        q.setParameter("openID", openID);
        return q;
    }
    
}