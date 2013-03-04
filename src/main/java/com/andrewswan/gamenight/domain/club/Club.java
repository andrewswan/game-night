package com.andrewswan.gamenight.domain.club;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;

import com.andrewswan.gamenight.domain.person.OpenIDUser;
import com.andrewswan.gamenight.domain.person.Person;

@Entity
@RooJavaBean
@RooToString
@Table(uniqueConstraints = @UniqueConstraint(columnNames = "name"))
@UniqueClubName(message = "{name.unique}")
@RooJpaActiveRecord(finders = "findClubsByNameLike")
public class Club implements com.andrewswan.gamenight.domain.Entity<Long> {

    @Size(min = 1, max = 50)
    private String name;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateAdded;

    @NotNull
    @ManyToOne(targetEntity = Person.class)
    @JoinColumn
    private Person addedBy;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "club")
    private Set<Membership> members = new HashSet<Membership>();

    /**
     * Constructor
     */
    public Club() {
    	this.dateAdded = new Date();
    }

    @Transactional
    public void persist() {
        if (this.entityManager == null) {
        	this.entityManager = entityManager();
        }
        
        // Get the current user
        final Authentication authentication =
        	SecurityContextHolder.getContext().getAuthentication();
        final OpenIDUser user = (OpenIDUser) authentication.getPrincipal();
        final Person person = user.getPerson();
        
        // Added By
        this.addedBy = person;
        
        // Date Added
        this.dateAdded = new Date();
        
        // First Member
        final Membership membership = new Membership();
        membership.setClub(this);
        membership.setDateFrom(new Date());
        membership.setManager(true);
		membership.setPerson(person);
        this.members.add(membership);
        
        this.entityManager.persist(this);
    }
    
	@Override
	public String toString() {
		return name;
	}
}
