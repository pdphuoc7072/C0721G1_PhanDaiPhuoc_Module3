import java.util.Scanner;

public class Test {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Tìm nghiệm của phương trình bậc 2: ax2 + bx + c = 0\n");
        System.out.print("Hãy nhập a: ");
        double a = Double.parseDouble(scanner.nextLine());
        System.out.print("Hãy nhập b: ");
        double b = Double.parseDouble(scanner.nextLine());
        System.out.print("Hãy nhập c: ");
        double c = Double.parseDouble(scanner.nextLine());
        QuadraticEquation quadraticEquation = new QuadraticEquation(a, b, c);
        quadraticEquation.getRoot();
    }
}
