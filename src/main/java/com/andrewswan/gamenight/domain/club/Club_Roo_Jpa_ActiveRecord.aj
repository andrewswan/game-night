// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.andrewswan.gamenight.domain.club;

import com.andrewswan.gamenight.domain.club.Club;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Club_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Club.entityManager;
    
    public static final EntityManager Club.entityManager() {
        EntityManager em = new Club().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Club.countClubs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Club o", Long.class).getSingleResult();
    }
    
    public static List<Club> Club.findAllClubs() {
        return entityManager().createQuery("SELECT o FROM Club o", Club.class).getResultList();
    }
    
    public static Club Club.findClub(Long id) {
        if (id == null) return null;
        return entityManager().find(Club.class, id);
    }
    
    public static List<Club> Club.findClubEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Club o", Club.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Club.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Club attached = Club.findClub(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Club.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Club.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Club Club.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Club merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
