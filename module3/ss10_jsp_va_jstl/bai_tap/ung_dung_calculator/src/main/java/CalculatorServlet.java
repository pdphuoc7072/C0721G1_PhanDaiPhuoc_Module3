import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstNumber = Double.parseDouble(request.getParameter("first_number"));
        double secondNumber = Double.parseDouble(request.getParameter("second_number"));
        char operator = request.getParameter("operator").charAt(0);
        PrintWriter writer = response.getWriter();
        try {
            double total = Calculator.calculate(firstNumber, secondNumber, operator);
            writer.println("<html>");
            writer.println("<h1>Result: </h1>");
            writer.println("<h3>" + firstNumber + " " + operator + " " + secondNumber + " = " + total + "</h3>");
            writer.println("</html>");
        } catch (Exception e) {
            writer.println("<html>");
            writer.println("<h3>" + e.getMessage() + "</h3>");
            writer.println("</html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
