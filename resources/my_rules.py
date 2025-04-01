from robot.parsing.model.statements import Documentation
from robocop.linter.rules import Rule, RuleSeverity, VisitorChecker

class TicketReferenceRule(Rule):
    """
    Rule for checking tivket reference in test case documentation.
    """
    name = "missing-ticket-reference-in-test-case-documentation"
    rule_id = "EX01"
    message = "Test Case Documentation section should contain the word 'FEATURE'."
    severity = RuleSeverity.INFO

class TicketReferenceInDocumentationChecker(VisitorChecker):
    """Checker for ensuring 'FEATURE' text is present in the Documentation section of Robot Framework test files."""
    ticket_id_reference: TicketReferenceRule

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
