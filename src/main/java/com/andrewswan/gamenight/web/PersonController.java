package com.andrewswan.gamenight.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.andrewswan.gamenight.domain.person.Person;

@RooWebScaffold(path = "person", formBackingObject = Person.class)
@RequestMapping("/person/**")
@Controller
public class PersonController {
}
