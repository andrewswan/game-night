package com.andrewswan.gamenight.domain.club;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.andrewswan.gamenight.domain.person.Person;

@Entity
@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Membership {

    @NotNull
    @ManyToOne(targetEntity = Person.class)
    @JoinColumn
    private Person person;

    @NotNull
    @ManyToOne(targetEntity = Club.class)
    @JoinColumn
    private Club club;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateFrom;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateTo;

    @NotNull
    private Boolean manager;
}
