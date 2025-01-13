from robot.parsing.model.statements import Documentation
from robocop.checkers import VisitorChecker
from robocop.rules import Rule, RuleSeverity

rules = {
    "9901": Rule(
        rule_id="9901",
        name="missing-ticket-reference-in-test-case-documentation",
        msg="The Test Case Documentation section should contain the word 'FEATURE'.",
        severity=RuleSeverity.INFO,
        docs="""
        Rule for checking that FEATURE text is present in test case documentation.
        """,
    )
}

class TicketReferenceInDocumentationChecker(VisitorChecker):
    """Checker for ensuring 'FEATURE' text is present in the Documentation section of Robot Framework test files."""
    reports = ("missing-ticket-reference-in-test-case-documentation",)

    def visit_TestCase(self, node):
        """Visit each TestCase node and check its Documentation section for the word 'FEATURE'."""
        documentation_found = False
        for child in node.body:
            if isinstance(child, Documentation):
                documentation_found = True
                if 'FEATURE' not in child.value:
                    self.report("missing-ticket-reference-in-test-case-documentation", node=child)
        if not documentation_found:
            self.report("missing-ticket-reference-in-test-case-documentation", node=node)
