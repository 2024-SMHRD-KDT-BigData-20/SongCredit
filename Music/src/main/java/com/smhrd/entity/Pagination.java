package com.smhrd.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Pagination {
	private int page;
	private int startPage;
	private int endPage;
	private int totalCount;
	private int frontPage;
	private int backPage;
	private int size = 5;
	private boolean prev; // 페이징 이전 버튼 활성화 여부
	private boolean next; // 페이징 다음 버튼 활성화 여부
	private int displayPageNum = 10;
	private int perPageNum = 10;
	private int tempEndPage;
	
	public int getTempEndPage() {
		return tempEndPage;
	}

	public void setTempEndPage(int tempEndPage) {
		this.tempEndPage = tempEndPage;
	}
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getFrontPage() {
		return frontPage;
	}

	public void setFrontPage(int frontPage) {
		this.frontPage = frontPage;
	}

	public int getBackPage() {
		return backPage;
	}

	public void setBackPage(int backPage) {
		this.backPage = backPage;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        
        pagingData();
	 }
	 
	 private void pagingData() {
	    frontPage = 1;
	    backPage = totalCount;
 	    endPage = (int) (Math.ceil( getPage() / (double) size ) * size );
	    // endPage = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 개수) * 화면에 보여질 페이지 번호의 개수
	    startPage = (endPage - size ) + 1;
	    // startPage = (끝 페이지 번호 - 화면에 보여질 페이지 번호의 개수) + 1
	    
	    tempEndPage = (int) (Math.ceil(totalCount / (double) displayPageNum ));    
	    if(endPage > tempEndPage) {
	        endPage = tempEndPage;
	    }
	    // 마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의개수
	    
	    prev = startPage == 1 ? false : true;    
	    // 이전 버튼 생성 여부 = 시작 페이지 번호가 1과 같으면 false, 아니면 true
	    next = endPage * this.perPageNum >= totalCount ? false : true;
	    // 다음 버튼 생성 여부 = 끝 페이지 번호 * 한 페이지당 보여줄 게시글의 개수가 총 게시글의 수보다
	    // 크거나 같으면 false, 아니면 true
	}

	public void setPage(int page) {
		// TODO Auto-generated method stub
		this.page = page;
	}
	
	public int getPage() {
		return page;
	}
	
}
