/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.isp.web1;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import jakarta.persistence.CascadeType;
import javax.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author 207380
 */
@Entity
@Table(name = "medcard")
@NamedQueries({
    @NamedQuery(name = "Medcard.findAll", query = "SELECT m FROM Medcard m"),
    @NamedQuery(name = "Medcard.findById", query = "SELECT m FROM Medcard m WHERE m.id = :id"),
    @NamedQuery(name = "Medcard.findByNumber", query = "SELECT m FROM Medcard m WHERE m.number = :number"),
    @NamedQuery(name = "Medcard.findByDateOfIssue", query = "SELECT m FROM Medcard m WHERE m.dateOfIssue = :dateOfIssue"),
    @NamedQuery(name = "Medcard.findByDateOfLastRequest", query = "SELECT m FROM Medcard m WHERE m.dateOfLastRequest = :dateOfLastRequest"),
    @NamedQuery(name = "Medcard.findByDateOfTheNextVisit", query = "SELECT m FROM Medcard m WHERE m.dateOfTheNextVisit = :dateOfTheNextVisit"),
    @NamedQuery(name = "Medcard.findByAnamnesis", query = "SELECT m FROM Medcard m WHERE m.anamnesis = :anamnesis"),
    @NamedQuery(name = "Medcard.findByRecommendations", query = "SELECT m FROM Medcard m WHERE m.recommendations = :recommendations")})
public class Medcard implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "number")
    private Integer number;
    @Column(name = "date_of_issue")
    @Temporal(TemporalType.DATE)
    private Date dateOfIssue;
    @Column(name = "date_of_last_request")
    @Temporal(TemporalType.DATE)
    private Date dateOfLastRequest;
    @Column(name = "date_of_the_next_visit")
    @Temporal(TemporalType.DATE)
    private Date dateOfTheNextVisit;
    @Column(name = "anamnesis")
    private String anamnesis;
    @Column(name = "recommendations")
    private String recommendations;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "medcardId")
    private Collection<Patient> patientCollection;

    public Medcard() {
    }

    public Medcard(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Date getDateOfIssue() {
        return dateOfIssue;
    }

    public void setDateOfIssue(Date dateOfIssue) {
        this.dateOfIssue = dateOfIssue;
    }

    public Date getDateOfLastRequest() {
        return dateOfLastRequest;
    }

    public void setDateOfLastRequest(Date dateOfLastRequest) {
        this.dateOfLastRequest = dateOfLastRequest;
    }

    public Date getDateOfTheNextVisit() {
        return dateOfTheNextVisit;
    }

    public void setDateOfTheNextVisit(Date dateOfTheNextVisit) {
        this.dateOfTheNextVisit = dateOfTheNextVisit;
    }

    public String getAnamnesis() {
        return anamnesis;
    }

    public void setAnamnesis(String anamnesis) {
        this.anamnesis = anamnesis;
    }

    public String getRecommendations() {
        return recommendations;
    }

    public void setRecommendations(String recommendations) {
        this.recommendations = recommendations;
    }

    public Collection<Patient> getPatientCollection() {
        return patientCollection;
    }

    public void setPatientCollection(Collection<Patient> patientCollection) {
        this.patientCollection = patientCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Medcard)) {
            return false;
        }
        Medcard other = (Medcard) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.isp.web1.Medcard[ id=" + id + " ]";
    }
    
}
