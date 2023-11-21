/**
 * @description Find tests that call the function pressActionKey
 * @kind problem
 * @id javascript/two-press-key
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
* Holds if `caller` contains a call to `pressActionKey`.
*/
predicate calls(Function caller) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getACallee().getCalleeName() = "pressActionKey"
  )
}

from Function test, Function callee
where isTest(test) and
      calls(test)
select callee, "calls function pressActionKey"