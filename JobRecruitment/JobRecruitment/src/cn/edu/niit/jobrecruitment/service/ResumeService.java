package cn.edu.niit.jobrecruitment.service;

import java.util.List;

import cn.edu.niit.jobrecruitment.model.Resume;
import cn.edu.niit.jobrecruitment.model.User;

public interface ResumeService extends BaseService<Resume> {

	/**
	 * 根据注册email查询用户简历
	 */
	public List<Resume> findMyResume(User user);
	
	/**
	 * 搜索所有公开的简历
	 */
	public List<Resume> findOpenResume(Resume resume);
}
