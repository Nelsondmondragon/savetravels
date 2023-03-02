package com.codingdojo.savetravel.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

@Data
@Table
@Entity(name = "_expenses")
@RequiredArgsConstructor
public class Expense {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "Name not null.")
    @Size(min = 1, message = "Name not empty")
    private String name;

    @NotNull(message = "Vendor not null.")
    @Size(min = 1, message = "Vendor not empty")
    private String vendor;

    @NotNull(message = "Amount not null.")
    private double amount;


    @NotNull(message = "Description not null.")
    @Size(min = 1, message = "Description not empty")
    private String description;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
}
