package com.h33.seckill.access;

import com.h33.seckill.domain.SeckillUser;

public class UserContext {

    private static final ThreadLocal<SeckillUser> userHolder = new ThreadLocal<SeckillUser>();

    public static void setUser(SeckillUser user) {
        userHolder.set(user);
    }

    public static SeckillUser getUser() {
        return userHolder.get();
    }
}
