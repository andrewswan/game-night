/**
 * 
 */
package com.andrewswan.gamenight.domain;

import java.lang.annotation.Annotation;
import java.util.List;

import javax.persistence.Query;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * JSR-303 style validator that checks an entity is unique in a given way.
 * 
 * @author Admin
 */
public abstract class UniquenessValidator<A extends Annotation, T extends Entity<?>>
	implements ConstraintValidator<A, T>
{
	@Override
	public void initialize(final A constraintAnnotation) {
		// Empty
	}

	@Override
	public boolean isValid(
		final T entity, final ConstraintValidatorContext context)
	{
		@SuppressWarnings("unchecked")
		final List<T> matches = getMatchesQuery(entity).getResultList();
		for (final T match : matches) {
			if (!match.getId().equals(entity.getId())) {
				// This match is not the entity being checked
				return false;
			}
		}
		return true;
	}

	/**
	 * Subclasses must return a query that finds potential matches to the given
	 * entity
	 * 
	 * @param entity can't be <code>null</code>, might be transient
	 * @return a non-<code>null</code> query
	 */
	protected abstract Query getMatchesQuery(T entity);
}
