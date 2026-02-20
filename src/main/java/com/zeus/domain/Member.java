package com.zeus.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import lombok.Data;


@Data
public class Member implements Serializable {

	private static final long serialVersionUID = 582999266267533096L;
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private boolean enabled;
	private Date regDate;
	private Date updDate;
	private List<MemberAuth> authList;

}
