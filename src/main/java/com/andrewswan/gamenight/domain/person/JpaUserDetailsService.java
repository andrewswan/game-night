/**
 * 
 */
package com.andrewswan.gamenight.domain.person;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.MessageSource;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;


/**
 * A {@link UserDetailsService} that retrieves the users via JPA
 * 
 * @author Admin
 */
@Component
@Transactional
public class JpaUserDetailsService implements UserDetailsService {
	
	// Constants
	protected static final Log LOGGER =
		LogFactory.getLog(JpaUserDetailsService.class);
	
	private static final String UNKNOWN_MESSAGE_CODE = "person.unknown";
	
	// Properties
	private final MessageSource messageSource;
	
	/**
	 * Constructor
	 *
	 * @param messageSource can't be <code>null</code>
	 */
	public JpaUserDetailsService(final MessageSource messageSource) {
		Assert.notNull(messageSource);
		this.messageSource = messageSource;
		LOGGER.debug("MessageSource is a " + messageSource.getClass());
	}

	@Override
	public UserDetails loadUserByUsername(final String username)
		throws UsernameNotFoundException
	{
		LOGGER.debug("Checking username '" + username + "'");
		final List<Person> people =
			Person.findPeopleByOpenIDEquals(username).getResultList();
		final Person person;
		if (people.isEmpty()) {
			// Unknown user; register them as a new user
			person = addUser(username);
			LOGGER.debug("Added new user with OpenID = " + username);
		}
		else {
			// Known user
			Assert.state(people.size() == 1,
					people.size() + " users with OpenID = " + username);
			person = people.get(0);
			LOGGER.debug("Found existing user with OpenID = " + username);
		}
		return new OpenIDUser(person);
	}

	/**
	 * Adds a Person with the given OpenID
	 * 
	 * @param openID
	 * @return the added person
	 */
	private Person addUser(final String openID) {
		Assert.hasText(openID, "OpenID can't be blank");
		final Person person = new Person();
		person.setName("(no name)");	// TODO translate
//		person.setName(messageSource.getMessage(
//			UNKNOWN_MESSAGE_CODE, null, LocaleContextHolder.getLocale()));
		person.setOpenID(openID);
		person.persist();
		return person;
	}
}
