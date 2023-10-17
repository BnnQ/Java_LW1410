package me.bnnq.lw1410;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import me.bnnq.lw1410.utils.Views;

@WebServlet(name = "quoteServlet", value = "/quote")
public class QuoteServlet extends HttpServlet
{
    private String quote;
    private String author;

    @Override
    public void init()
    {
        quote = "Any fool can write code that a computer can understand. Good programmers write code that humans can \n" +
                "understand";

        author = "Martin Fowler";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        request.setAttribute("quote", quote);
        request.setAttribute("author", author);

        Views.get(getServletContext(), "quote", request, response);
    }

    public void destroy()
    {

    }
}