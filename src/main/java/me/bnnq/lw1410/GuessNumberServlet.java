package me.bnnq.lw1410;

import java.io.*;
import java.util.Objects;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import me.bnnq.lw1410.models.enums.GuessNumberAction;
import me.bnnq.lw1410.utils.Views;

@WebServlet(name = "guessNumber", value = "/guess")
public class GuessNumberServlet extends HttpServlet
{
    @Override
    public void init()
    {
        left = 0;
        right = 100;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        Views.get(getServletContext(), "guessNumber", request, response);
    }

    private int left;
    private int right;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String currentNumberParameter = request.getParameter("currentNumber");
        int number = Integer.parseInt(Objects.equals(currentNumberParameter, "") ? "50" : currentNumberParameter);
        GuessNumberAction action = GuessNumberAction.valueOf(request.getParameter("action"));

        if (action == GuessNumberAction.MORE)
        {
            left = number + 1;
        }
        else if (action == GuessNumberAction.LESS)
        {
            right = number - 1;
        }
        else if (action == GuessNumberAction.EQUALS)
        {
            left = right = number;
            request.setAttribute("result", number);
        }

        request.setAttribute("currentNumber", (left + right) / 2);
        Views.get(getServletContext(), "guessNumber", request, response);
    }

    public void destroy()
    {

    }
}