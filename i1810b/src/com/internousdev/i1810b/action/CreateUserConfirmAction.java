package com.internousdev.i1810b.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.i1810b.dao.UserInfoDAO;
import com.internousdev.i1810b.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class CreateUserConfirmAction extends ActionSupport implements SessionAware {

	private String familyName;
	private String firstName;
	private String familyNameKana;
	private String firstNameKana;
	private String sex;
	private String email;
	private String loginID;
	private String password;

	private List<String> familyNameErrorMessageList = new ArrayList<String>();
	private List<String> firstNameErrorMessageList = new ArrayList<String>();
	private List<String> familyNameKanaErrorMessageList = new ArrayList<String>();
	private List<String> firstNameKanaErrorMessageList = new ArrayList<String>();
	private List<String> emailErrorMessageList = new ArrayList<String>();
	private List<String> loginIdErrorMessageList = new ArrayList<String>();
	private List<String> passwordErrorMessageList = new ArrayList<String>();

	private List<String> sexList = new ArrayList<String>();
	private Map<String, Object> session;

	public String execute(){

		String result = "login";
		try{

			//sessinが切れてたらホームへ
			if(!session.containsKey("logined")){
					result = "login";
					return result;
			}

			result = ERROR;
			InputChecker inputChecker = new InputChecker();

			//ログインIDの重複を確認
			UserInfoDAO UserInfoDao = new UserInfoDAO();
			if(UserInfoDao.checkDuplication(loginID)){
				loginIdErrorMessageList.add("このログインIDは既に使用されています。");
				loginIdErrorMessageList.add("別のログインIDを入力してください。");
				session.put("loginIdErrorMessageList", loginIdErrorMessageList);
				return result;
			}

			session.put("familyName", familyName);
			session.put("firstName", firstName);
			session.put("familyNameKana", familyNameKana);
			session.put("firstNameKana", firstNameKana);
			session.put("sex", sex);
			session.put("email", email);
			session.put("loginID", loginID);
			session.put("password", password);

			familyNameErrorMessageList = inputChecker.doCheck("姓", familyName, 1, 16, true, true, true, false, false, false, false);
			firstNameErrorMessageList = inputChecker.doCheck("名", firstName, 1, 16, true, true, true, false, false, false, false);
			familyNameKanaErrorMessageList = inputChecker.doCheck("姓ふりがな", familyNameKana, 1, 16, false, false, true, false, false, false, false);
			firstNameKanaErrorMessageList = inputChecker.doCheck("名ふりがな", firstNameKana, 1, 16, false, false, true, false, false, false, false);
			emailErrorMessageList = inputChecker.doCheck("メールアドレス", email, 14, 32, true, false, false, true, true, false, false);
			loginIdErrorMessageList = inputChecker.doCheck("ログインID", loginID, 1, 8, true, false, false, true, false, false, false);
			passwordErrorMessageList = inputChecker.doCheck("パスワード", password, 1, 16, true, false, false, true, false, false, false);

			if(familyNameErrorMessageList.size()==0
			&& firstNameErrorMessageList.size()==0
			&& familyNameKanaErrorMessageList.size()==0
			&& firstNameKanaErrorMessageList.size()==0
			&& emailErrorMessageList.size()==0
			&& loginIdErrorMessageList.size()==0
			&& passwordErrorMessageList.size()==0) {
				result = SUCCESS;
			}else {
				session.put("familyNameErrorMessageList", familyNameErrorMessageList);
				session.put("firstNameErrorMessageList", firstNameErrorMessageList);
				session.put("familyNameKanaErrorMessageList", familyNameKanaErrorMessageList);
				session.put("firstNameKanaErrorMessageList", firstNameKanaErrorMessageList);
				session.put("emailErrorMessageList", emailErrorMessageList);
				session.put("loginIdErrorMessageList", loginIdErrorMessageList);
				session.put("passwordErrorMessageList", passwordErrorMessageList);
				result = ERROR;
			}

		}catch(Exception e){
			result = "login";
			return result;
		}
		return result;
	}

	public List<String> getSexList() {
		return sexList;
	}

	public void setSexList(List<String> sexList) {
		this.sexList = sexList;
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getFamilyNameKana() {
		return familyNameKana;
	}

	public void setFamilyNameKana(String familyNameKana) {
		this.familyNameKana = familyNameKana;
	}

	public String getFirstNameKana() {
		return firstNameKana;
	}

	public void setFirstNameKana(String firstNameKana) {
		this.firstNameKana = firstNameKana;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<String> getFamilyNameErrorMessageList() {
		return familyNameErrorMessageList;
	}

	public void setFamilyNameErrorMessageList(List<String> familyNameErrorMessageList) {
		this.familyNameErrorMessageList = familyNameErrorMessageList;
	}

	public List<String> getFirstNameErrorMessageList() {
		return firstNameErrorMessageList;
	}

	public void setFirstNameErrorMessageList(List<String> firstNameErrorMessageList) {
		this.firstNameErrorMessageList = firstNameErrorMessageList;
	}

	public List<String> getFamilyNameKanaErrorMessageList() {
		return familyNameKanaErrorMessageList;
	}

	public void setFamilyNameKanaErrorMessageList(List<String> familyNameKanaErrorMessageList) {
		this.familyNameKanaErrorMessageList = familyNameKanaErrorMessageList;
	}

	public List<String> getFirstNameKanaErrorMessageList() {
		return firstNameKanaErrorMessageList;
	}

	public void setFirstNameKanaErrorMessageList(List<String> firstNameKanaErrorMessageList) {
		this.firstNameKanaErrorMessageList = firstNameKanaErrorMessageList;
	}

	public List<String> getEmailErrorMessageList() {
		return emailErrorMessageList;
	}

	public void setEmailErrorMessageList(List<String> emailErrorMessageList) {
		this.emailErrorMessageList = emailErrorMessageList;
	}

	public List<String> getLoginIdErrorMessageList() {
		return loginIdErrorMessageList;
	}

	public void setLoginIdErrorMessageList(List<String> loginIdErrorMessageList) {
		this.loginIdErrorMessageList = loginIdErrorMessageList;
	}

	public List<String> getPasswordErrorMessageList() {
		return passwordErrorMessageList;
	}

	public void setPasswordErrorMessageList(List<String> passwordErrorMessageList) {
		this.passwordErrorMessageList = passwordErrorMessageList;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}

