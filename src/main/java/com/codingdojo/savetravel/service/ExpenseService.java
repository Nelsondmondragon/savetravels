package com.codingdojo.savetravel.service;

import com.codingdojo.savetravel.model.Expense;
import com.codingdojo.savetravel.repository.ExpenseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ExpenseService {

    private final ExpenseRepository expenseRepository;


    public List<Expense> findAll() {
        return this.expenseRepository.findAll();


    }


    public Expense save(Expense expense) {
        return this.expenseRepository.save(expense);
    }

    public Expense findById(long id) {
        return this.expenseRepository.findById(id).orElseThrow(() -> new RuntimeException("Id expense not exists"));
    }

    public void deleteById(long id) {
        Expense expense = this.findById(id);
        this.expenseRepository.deleteById(id);
    }
}
