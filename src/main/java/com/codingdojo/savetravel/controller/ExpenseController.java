package com.codingdojo.savetravel.controller;

import com.codingdojo.savetravel.model.Expense;
import com.codingdojo.savetravel.service.ExpenseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
public class ExpenseController {

    private final ExpenseService expenseService;

    @GetMapping("/expenses")
    public String getSave(@ModelAttribute("expense") Expense expense, HttpSession session) {

        session.setAttribute("expenses", this.expenseService.findAll());
        return "expenses.jsp";
    }


    @GetMapping("/expenses/edit/{id}")
    public String getEdit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("expense", expenseService.findById(id));
        return "expensesedit.jsp";
    }

    @GetMapping("/expenses/{id}")
    public String getById(@PathVariable Long id, Model model) {
        model.addAttribute("expense", expenseService.findById(id));
        return "expensesview.jsp";
    }


    @PostMapping("/expenses")
    public String save(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
        if (result.hasErrors()) {
//            System.out.println("dddd");
//            System.out.println(result.);
            return "expenses.jsp";
        }
        System.out.println("No error");

        this.expenseService.save(expense);
//        session.setAttribute("expenses", this.expenseService.findAll());
        return "redirect:/expenses";
    }

    @PutMapping("/expenses/{id}")
    public String edit(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
        if (result.hasErrors()) {
            System.out.println("dddddddddd");
            return "expensesedit.jsp";
        } else {
            expenseService.save(expense);
            return "redirect:/expenses";
        }
    }

    @DeleteMapping("expenses/{id}")
    public String deleteById(@PathVariable Long id) {
        this.expenseService.deleteById(id);
        return "redirect:/expenses";
    }
}
