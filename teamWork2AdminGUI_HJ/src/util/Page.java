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
        // ÂÅáËÆæÊÄªÊï∞Êò?50ÔºåÊòØËÉΩÂ§üË¢?5Êï¥Èô§ÁöÑÔºåÈÇ£‰πàÂ∞±Êúâ10È°?
        if (0 == total % count)
            totalPage = total / count;
            // ÂÅáËÆæÊÄªÊï∞Êò?51Ôºå‰∏çËÉΩÂ§üË¢?5Êï¥Èô§ÁöÑÔºåÈÇ£‰πàÂ∞±Êúâ11È°?
        else
            totalPage = total / count + 1;

        if (0 == totalPage)
            totalPage = 1;
        return totalPage;

    }

    public int getLast() {
        int last;
        // ÂÅáËÆæÊÄªÊï∞Êò?50ÔºåÊòØËÉΩÂ§üË¢?5Êï¥Èô§ÁöÑÔºåÈÇ£‰πàÊú?Âêé‰∏ÄÈ°µÁöÑÂº?ÂßãÂ∞±Êò?45
        if (0 == total % count)
            last = total - count;
            // ÂÅáËÆæÊÄªÊï∞Êò?51Ôºå‰∏çËÉΩÂ§üË¢?5Êï¥Èô§ÁöÑÔºåÈÇ£‰πàÊú?Âêé‰∏ÄÈ°µÁöÑÂº?ÂßãÂ∞±Êò?50
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
