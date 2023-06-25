package com.saltmarket.note.model.vo;

import java.sql.Date;

public class Note {
	
	// 필드부
	
	private int NoteNo;// NOTE_NO	NUMBER
	private int ReceiverId;// RECEIVER_ID	NUMBER
	private int SenderId;// SENDER_ID	NUMBER
	private Date SendTime;// SEND_TIME	DATE
	private String MessageTitle;// MESSAGE_TITLE	VARCHAR2(100 BYTE)
	private String MessageContent;// MESSAGE_CONTENT	VARCHAR2(2000 BYTE)
	private String DeleteState;// DELETE_STATUS	CHAR(1 BYTE)
	
	// 생성자부
	
	public Note() {
		super();
	}

	public Note(int noteNo, int receiverId, int senderId, Date sendTime, String messageTitle, String messageContent,
			String deleteState) {
		super();
		NoteNo = noteNo;
		ReceiverId = receiverId;
		SenderId = senderId;
		SendTime = sendTime;
		MessageTitle = messageTitle;
		MessageContent = messageContent;
		DeleteState = deleteState;
	}

	
	
	// 메소드부
	
	public int getNoteNo() {
		return NoteNo;
	}

	public void setNoteNo(int noteNo) {
		NoteNo = noteNo;
	}

	public int getReceiverId() {
		return ReceiverId;
	}

	public void setReceiverId(int receiverId) {
		ReceiverId = receiverId;
	}

	public int getSenderId() {
		return SenderId;
	}

	public void setSenderId(int senderId) {
		SenderId = senderId;
	}

	public Date getSendTime() {
		return SendTime;
	}

	public void setSendTime(Date sendTime) {
		SendTime = sendTime;
	}

	public String getMessageTitle() {
		return MessageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		MessageTitle = messageTitle;
	}

	public String getMessageContent() {
		return MessageContent;
	}

	public void setMessageContent(String messageContent) {
		MessageContent = messageContent;
	}

	public String getDeleteState() {
		return DeleteState;
	}

	public void setDeleteState(String deleteState) {
		DeleteState = deleteState;
	}

	@Override
	public String toString() {
		return "Note [NoteNo=" + NoteNo + ", ReceiverId=" + ReceiverId + ", SenderId=" + SenderId + ", SendTime="
				+ SendTime + ", MessageTitle=" + MessageTitle + ", MessageContent=" + MessageContent + ", DeleteState="
				+ DeleteState + "]";
	}
	
	
}
