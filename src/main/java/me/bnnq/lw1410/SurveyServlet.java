package me.bnnq.lw1410;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import me.bnnq.lw1410.models.enums.Gender;
import me.bnnq.lw1410.utils.Views;

@WebServlet(name = "surveyServlet", value = "/survey")
public class SurveyServlet extends HttpServlet
{
    @Override
    public void init()
    {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        Views.get(getServletContext(), "survey", request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));
        boolean subscribed = request.getParameter("subscribed") != null;
        Gender gender = Gender.valueOf(request.getParameter("gender"));

        request.setAttribute("fullName", fullName);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("email", email);
        request.setAttribute("age", age);
        request.setAttribute("subscribed", subscribed);
        request.setAttribute("gender", gender);

        if (fullName.length() < 3)
        {
            request.setAttribute("error", "Full name must be at least 3 characters long.");
        }
        else if (phoneNumber.length() < 10)
        {
            request.setAttribute("error", "Phone number must be at least 10 characters long.");
        }
        else if (email.length() < 5)
        {
            request.setAttribute("error", "Email must be at least 5 characters long.");
        }
        else if (age < 18)
        {
            request.setAttribute("error", "You must be at least 18 years old.");
        }

        Views.get(getServletContext(), "survey", request, response);
    }

    public void destroy()
    {

    }
}