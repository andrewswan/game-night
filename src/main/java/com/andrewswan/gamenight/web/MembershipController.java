package com.andrewswan.gamenight.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.andrewswan.gamenight.domain.club.Membership;

@RooWebScaffold(path = "membership", formBackingObject = Membership.class)
@RequestMapping("/membership/**")
@Controller
public class MembershipController {
}
