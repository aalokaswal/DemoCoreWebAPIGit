using DemoCoreWebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoCoreWebAPI.EmployeeData
{
    public class MockEmployeeData : IEmployeeData
    {
        List<Employee> employees = new List<Employee>()
        {
            new Employee{Id = Guid.NewGuid(), Name="Alok"},
            new Employee{Id = Guid.NewGuid(), Name="Aniket"}
        };

        public Employee AddEmployee(Employee employee)
        {
            throw new NotImplementedException();
        }

        public void DeleteEmployee(Employee employee)
        {
            throw new NotImplementedException();
        }

        public Employee EditEmployee(Employee employee)
        {
            throw new NotImplementedException();
        }

        public Employee GetEmployee(Guid id)
        {
            throw new NotImplementedException();
        }

        public List<Employee> GetEmployees()
        {
            return employees;
        }
    }
}
