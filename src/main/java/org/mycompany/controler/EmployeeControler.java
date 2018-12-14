package org.mycompany.controler;

import org.mycompany.model.Employee;
import org.mycompany.repository.EmployeeRepository;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class EmployeeControler {
    private EmployeeRepository employeeRepository;

    public EmployeeControler(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @PostMapping("/employees")
    @ResponseStatus(HttpStatus.CREATED)
    public void addEmployee(@RequestBody Employee employee) {
        employeeRepository.save(employee);
    }

    @GetMapping("/employees")
    public List<Employee> getEmployees() {
        return employeeRepository.findAll();
    }
}
