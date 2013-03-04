package com.andrewswan.gamenight.domain.person;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.andrewswan.gamenight.domain.club.Membership;

@Entity
@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findPeopleByOpenIDEquals" })
@Table(uniqueConstraints = { @UniqueConstraint(columnNames = "name"), @UniqueConstraint(columnNames = "openID") })
public class Person {

    @NotNull
    @Size(min = 1, max = 40)
    private String name;

    @NotNull
    @Size(min = 1, max = 200)
    private String openID;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateRegistered;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "person")
    private Set<Membership> memberships = new HashSet<Membership>();

    @Transactional
    public void persist() {
        if (this.entityManager == null) {
            this.entityManager = entityManager();
        }
        if (this.dateRegistered == null) {
            this.dateRegistered = new Date();
        }
        this.entityManager.persist(this);
    }

    @Override
    public String toString() {
        if (StringUtils.hasText(name)) {
            return name;
        }
        return openID;
    }
}
