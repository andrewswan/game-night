/**
 * 
 */
package com.andrewswan.gamenight.domain.person;

import java.util.ArrayList;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

/**
 * @author Admin
 */
public class OpenIDUser extends User {

	// Constants
	private static final long serialVersionUID = 1L;
	
	// Properties
	private final Person person;

	/**
	 * Constructor
	 *
	 * @param person can't be <code>null</code>
	 */
	public OpenIDUser(final Person person) {
		super(person.getOpenID(), "ignored", true, true, true, true,
				new ArrayList<GrantedAuthority>());
		this.person = person;
	}

	/**
	 * Returns the {@link Person} who is this user
	 * 
	 * @return a non-<code>null</code> person
	 */
	public Person getPerson() {
		return person;
	}
}
