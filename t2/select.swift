//
//  ViewController.swift
//  t2
//
//  Created by 李伯阳  Lok’Tar Ogar on 16/7/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class select: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet weak var q: UITextField!

    @IBOutlet weak var w: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表
        //db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        db.execute("create table if not exdsts tuser(uid integer primary key,uname varchar(20),email varchar(20),mobile varchar(20),address varchar(20))")
        //db.execute("create table if not exists tuser(uid integer primary key,uname varchar(20),email varchar(20),mobile varchar(20),address vatchar(20))")
        //print("fffff")
        //如果有数据则加载
        //initUser()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func selectname(sender: AnyObject) {
        select()
        q.resignFirstResponder()
        
    }
    
    func select()
    {
        let value = q.text!
        let data = db.query("select * from tuser where mobile='\(value)'")
        for var i=0; i < data.count;i++
        {
            //获取最后一行数据显示
            var user = data[i]
            w.text! += " 用户名："+String(user["uname"]!)  + "电话："+String(user["mobile"]!)+"邮箱："+String(user["email"]!)+"\n"
            w.text! += "地址： "+String(user["address"]!)+"\n"
            //print( "\n")
            
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
