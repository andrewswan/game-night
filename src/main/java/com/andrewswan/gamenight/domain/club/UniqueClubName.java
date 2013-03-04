package com.andrewswan.gamenight.domain.club;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.ConstraintValidator;

@Constraint(validatedBy = UniqueClubNameValidator.class)
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface UniqueClubName {

	public abstract String message() default
		"{com.andrewswan.gamenight.domain.club.Club.name.unique.message}";
	
	public abstract Class<?>[] groups() default {};
	
	public abstract Class<? extends ConstraintValidator<UniqueClubName, Club>>[]
        payload() default {};
}
