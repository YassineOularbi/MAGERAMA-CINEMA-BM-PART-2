package jee.javapack.dto;



public class UserDTO {
    private Integer id;
    private String userName;
    private String roleAU;

    public UserDTO(Integer id, String userName, String roleAU) {
        this.id = id;
        this.userName = userName;
        this.roleAU = roleAU;
    }

    public UserDTO() {
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
