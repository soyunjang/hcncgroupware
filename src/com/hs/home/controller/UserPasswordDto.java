package com.hs.home.controller;

import com.sun.istack.internal.NotNull;

public class UserPasswordDto {

    private String password1;
    private String password2;

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    @Override
    public String toString() {
        return "UserPasswordDto{" +
                "password1='" + password1 + '\'' +
                ", password2='" + password2 + '\'' +
                '}';
    }
}
