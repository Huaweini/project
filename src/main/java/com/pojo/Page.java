package com.pojo;

import java.io.Serializable;
import java.util.List;

public class Page<T> implements Serializable {
    private int page = 0;
    private int size = 10;
    private int total;
    private int offset;
    private List<T> res;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getRes() {
        return res;
    }

    public void setRes(List<T> res) {
        this.res = res;
    }


    public int getOffset() {
        return page * size;
    }
}
