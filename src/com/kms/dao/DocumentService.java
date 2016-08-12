package com.kms.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.kms.hibernate.util.HibernateUtil;
import com.kms.vo.Post;
import com.kms.vo.User;


public class DocumentService {

	public boolean load(Post post){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.saveOrUpdate(post);		
			 tx.commit();
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return true;
	}

    
    public List<Post> getListOfPostsByUserName(String userName){
        List<Post> list = new ArrayList<Post>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Post where userName='"+userName+"'").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }    
    
    public List<Post> getListOfPosts(){
        List<Post> list = new ArrayList<Post>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Post").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
    public int deletePostByPostLoc(String postLoc){
        Session session = HibernateUtil.openSession();
        Transaction tx = null; 
        int result=-3;
        try {
            tx = session.getTransaction();
            tx.begin();
            
            Query query = session.createQuery("delete Post where postId="+postLoc+"");
             
            result = query.executeUpdate();
                                   
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
        
    }
    
}
