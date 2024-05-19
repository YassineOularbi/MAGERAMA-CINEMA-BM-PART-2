package jee.javapack.dto;


import jee.javapack.beans.User;

public class UserDTO {
    private Integer id;
    private String userName;
    private String roleAU;

    public UserDTO(User user) {
        this.id = user.getId();
        this.userName = user.getUserName();
        this.roleAU = user.getRoleAU();
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

    public String getRoleAU() {
        return roleAU;
    }

    public void setRoleAU(String roleAU) {
        this.roleAU = roleAU;
    }
}
