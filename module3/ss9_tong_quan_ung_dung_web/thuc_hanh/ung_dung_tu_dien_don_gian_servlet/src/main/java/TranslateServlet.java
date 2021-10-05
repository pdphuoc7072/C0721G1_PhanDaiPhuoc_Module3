import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TranslateServlet", value = "/translate")
public class TranslateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("red", "Màu đỏ");
        dictionary.put("one", "Một");
        dictionary.put("car", "Xe ô tô");
        dictionary.put("blue", "Màu xanh nước biển");

        String search = request.getParameter("text_search");

        PrintWriter writer = response.getWriter();

        writer.println("<html>");
        String result = dictionary.get(search);

        if (result != null) {
            writer.println("Word: " + search + "<br>");
            writer.println("Vietnamese: " + result);
        } else {
            writer.println("Not found");
        }
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
