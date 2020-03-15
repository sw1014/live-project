package util;

public class Page {
    int start;
    int count;
    int total;
    String param;

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Page(int start, int count) {
        super();
        this.start = start;
        this.count = count;
    }

    public boolean isHasPreviouse() {
        return start != 0;

    }

    public boolean isHasNext() {
        return start != getLast();
    }

    public int getTotalPage() {
        int totalPage;
        // 假设总数�?50，是能够�?5整除的，那么就有10�?
        if (0 == total % count)
            totalPage = total / count;
            // 假设总数�?51，不能够�?5整除的，那么就有11�?
        else
            totalPage = total / count + 1;

        if (0 == totalPage)
            totalPage = 1;
        return totalPage;

    }

    public int getLast() {
        int last;
        // 假设总数�?50，是能够�?5整除的，那么�?后一页的�?始就�?45
        if (0 == total % count)
            last = total - count;
            // 假设总数�?51，不能够�?5整除的，那么�?后一页的�?始就�?50
        else
            last = total - total % count;

        last = last < 0 ? 0 : last;
        return last;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

}
