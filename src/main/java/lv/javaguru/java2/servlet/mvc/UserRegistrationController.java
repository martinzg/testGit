package lv.javaguru.java2.servlet.mvc;

import lv.javaguru.java2.database.DBException;
import lv.javaguru.java2.database.UserDAO;
import lv.javaguru.java2.database.jdbc.UserDAOImpl;
import lv.javaguru.java2.domain.User;

import javax.servlet.http.HttpServletRequest;

public class UserRegistrationController implements MVCController {

    @Override
    public MVCModel processRequestGet(HttpServletRequest req) {
        return new MVCModel("/UserRegistration.jsp", null, null);
    }

    @Override
    public MVCModel processRequestPost(HttpServletRequest req) {

        User user = new User();
        getRegistrationFormInput(user, req);

        UserDAO userDAO = new UserDAOImpl();

        try {
            if (userDAO.getIdByEmail(req.getParameter("email")) == null) {
                if (req.getParameter("password").equals(req.getParameter("confirm password"))){
                    userDAO.create(user);
                    return new MVCModel("/Redirect.jsp", "/java2/login", "User registered successfully!");
                }
                else {
                    return new MVCModel("/UserRegistration.jsp", null, "'Password' and 'Confirm Password' do not match!");
                }
            }
            else{
                return new MVCModel("/UserRegistration.jsp", null, "User with such email already exists!");
            }
        }
        catch (DBException e) {
            throw new RuntimeException(e);
        }

    }

    private void getRegistrationFormInput(User user, HttpServletRequest req){
        user.setFirstName(req.getParameter("firstname"));
        user.setLastName(req.getParameter("lastname"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
    }

}