package jee.javapack.beans;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "username")
    private String userName;
    @Column(name = "user_mail")
    private String userMail;
    @Column(name = "user_password")
    private String password;
    @Column(name = "user_role")
    private String roleAU;

    public User() {
    }

    public User(Integer id, String userName, String userMail, String password, String roleAU) {
        this.id = id;
        this.userName = userName;
        this.userMail = userMail;
        this.password = password;
        this.roleAU = roleAU;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserMail() {
        return userMail;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleAU() {
        return roleAU;
    }

    public void setRoleAU(String roleAU) {
        this.roleAU = roleAU;
    }
}
