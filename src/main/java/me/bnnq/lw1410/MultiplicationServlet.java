package me.bnnq.lw1410;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import me.bnnq.lw1410.utils.Views;

@WebServlet(name = "multiplicationServlet", value = "/multiplication")
public class MultiplicationServlet extends HttpServlet
{
    @Override
    public void init()
    {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        Views.get(getServletContext(), "multiplicationTable", request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        int number = Integer.parseInt(request.getParameter("number"));
        String[] results = new String[9];
        for (int i = 1; i <= 9; i++)
        {
            results[i - 1] = String.format("%d * %d = %d", number, i, number * i);
        }
        request.setAttribute("tableResults", results);

        Views.get(getServletContext(), "multiplicationTable", request, response);
    }

    public void destroy()
    {

    }

}