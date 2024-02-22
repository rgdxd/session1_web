/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.isp.web1;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(path = "/companyregistration")
public class PatientController {

    @Autowired
    private PatRepository patRepository;
    @Autowired
    private McardRepository mcardRepository;
    @Autowired
    private PolicyRepository policyRepository;

    @GetMapping(path = "/all")
   public @ResponseBody List<Patient> getAllPatient() {
      List patientList = new ArrayList();
      for (Patient p: patRepository.findAll()){
          Medcard mcard = p.getMedcardId();
          Policy pol = p.getPolicyId();
          patientList.add(mcard); 
          patientList.add(pol);      
      }
      return patientList;
  }
    

    @GetMapping(path = "/formreg")
    public ModelAndView home() {
        return new ModelAndView("formreg");
    }

    @PostMapping(path = "/add")
    public @ResponseBody
    String addPatient(@RequestParam(name = "photo") String photo, @RequestParam(name = "surname") String surname, @RequestParam(name = "name") String name,
            @RequestParam(name = "patronymic") String patronymic, @RequestParam(name = "passnum") String passnum,
            @RequestParam(name = "passser") String passser, @RequestParam(name = "datebith") String datebith,
            @RequestParam(name = "gender") String gender, @RequestParam(name = "address") String address,
            @RequestParam(name = "phonenumber") String phonenumber, @RequestParam(name = "email") String email,
            @RequestParam(name = "medcardnum") String medcardnum, @RequestParam(name = "date_of_issue") String date_of_issue,
            @RequestParam(name = "date_of_last") String date_of_last, @RequestParam(name = "date_of_next") String date_of_next,
            @RequestParam(name = "anamnesis") String anamnesis, @RequestParam(name = "recommendations") String recommendatioins,
            @RequestParam(name = "policynum") String policynum, @RequestParam(name = "end_date") String end_date) {
        Patient pat = new Patient();
        pat.setPhoto(photo);
        pat.setSurname(surname);
        pat.setName(name);
        pat.setPatronymic(patronymic);
        pat.setPassportNumber(Integer.parseInt(passnum));
        pat.setPassportSeries(Integer.parseInt(passser));
        DateFormat format = new java.text.SimpleDateFormat("yyyy-mm-dd");
        try {
            pat.setDateOfBith(format.parse(datebith));
        } catch (ParseException ex) {
            Logger.getLogger(PatientController.class.getName()).log(Level.SEVERE, null, ex);
        }
        pat.setGender(gender);
        pat.setAddress(address);
        pat.setPhonenumber(phonenumber);
        pat.setEmail(email);
        Medcard medcard = new Medcard();
        medcard.setNumber(Integer.parseInt(medcardnum));
        try {
            medcard.setDateOfIssue(format.parse(date_of_issue));
        } catch (ParseException ex) {
            Logger.getLogger(PatientController.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            medcard.setDateOfLastRequest(format.parse(date_of_last));
        } catch (ParseException ex) {
            Logger.getLogger(PatientController.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            medcard.setDateOfTheNextVisit(format.parse(date_of_next));
        } catch (ParseException ex) {
            Logger.getLogger(PatientController.class.getName()).log(Level.SEVERE, null, ex);
        }
        medcard.setAnamnesis(anamnesis);
        medcard.setRecommendations(recommendatioins);
        mcardRepository.save(medcard);
        pat.setMedcardId(medcard);
        
        Policy pol = new Policy();
        pol.setNumber(Integer.parseInt(policynum));
        try {
            pol.setEndDate(format.parse(end_date));
        } catch (ParseException ex) {
            Logger.getLogger(PatientController.class.getName()).log(Level.SEVERE, null, ex);
        }
        policyRepository.save(pol);
        pat.setPolicyId(pol);
        patRepository.save(pat);
        System.out.println("норм");
        return "пациент добавлен";
        
    }
}
