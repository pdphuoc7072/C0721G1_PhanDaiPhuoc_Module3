import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculateDiscountServlet", value = "/display-discount")
public class CalculateDiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_description = request.getParameter("product_description");
        float list_price = Float.parseFloat(request.getParameter("list_price"));
        float discount_percent = Float.parseFloat(request.getParameter("discount_percent"));

        float discount_amount = (float) (list_price * discount_percent * 0.01);
        float discount_price = list_price - discount_amount;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h3>Product Description: " + product_description + "</h3><br>");
        writer.println("<h3>List Price: " + list_price + "</h3><br>");
        writer.println("<h3>Discount Percent: " + discount_percent + "</h3><br>");
        writer.println("<h3>Discount Amount: " + discount_amount + "</h3><br>");
        writer.println("<h3>Discount Price: " + discount_price + "</h3><br>");
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
