/**
 * @description Find all functions longer than 10 lines
 * @kind problem
 * @id javascript/one-length
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is longer than 10 lines.
 */
predicate isMoreTenLong(Function f) {
 exists(FunctionNode func |
    func.getNumLines() > 10 and
    f = func.getName()
  )
}

from Function function
where isMoreTenLong(function)
select function, "is longer than 10 lines"