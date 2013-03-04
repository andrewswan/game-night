// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.andrewswan.gamenight.web;

import com.andrewswan.gamenight.domain.club.Club;
import com.andrewswan.gamenight.domain.club.Membership;
import com.andrewswan.gamenight.domain.person.Person;
import com.andrewswan.gamenight.web.MembershipController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MembershipController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MembershipController.create(@Valid Membership membership, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, membership);
            return "membership/create";
        }
        uiModel.asMap().clear();
        membership.persist();
        return "redirect:/membership/" + encodeUrlPathSegment(membership.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MembershipController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Membership());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Person.countPeople() == 0) {
            dependencies.add(new String[] { "person", "people" });
        }
        if (Club.countClubs() == 0) {
            dependencies.add(new String[] { "club", "clubs" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "membership/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MembershipController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("membership", Membership.findMembership(id));
        uiModel.addAttribute("itemId", id);
        return "membership/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MembershipController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("memberships", Membership.findMembershipEntries(firstResult, sizeNo));
            float nrOfPages = (float) Membership.countMemberships() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("memberships", Membership.findAllMemberships());
        }
        addDateTimeFormatPatterns(uiModel);
        return "membership/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MembershipController.update(@Valid Membership membership, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, membership);
            return "membership/update";
        }
        uiModel.asMap().clear();
        membership.merge();
        return "redirect:/membership/" + encodeUrlPathSegment(membership.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MembershipController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Membership.findMembership(id));
        return "membership/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MembershipController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Membership membership = Membership.findMembership(id);
        membership.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/membership";
    }
    
    void MembershipController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("membership_datefrom_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("membership_dateto_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    void MembershipController.populateEditForm(Model uiModel, Membership membership) {
        uiModel.addAttribute("membership", membership);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("clubs", Club.findAllClubs());
        uiModel.addAttribute("people", Person.findAllPeople());
    }
    
    String MembershipController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
