//
//  ViewController.swift
//  t2
//
//  Created by 李伯阳  Lok’Tar Ogar on 16/7/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var db:SQLiteDB!
    var temp=""

    @IBOutlet weak var txtUname: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtyou: UITextField!
    @IBOutlet weak var txtdi: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表
        //db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //db.execute("create table if not exists user(uid integer primary key,uname varchar(20),email varchar(20),address varchar ,mobile varchar(20) )")
        db.execute("create table if not exists tuser(uid integer primary key,uname varchar(20),email varchar(20),address varchar ,mobile varchar(20) )")
        print("fffff")
        //如果有数据则加载
        //initUser()

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    @IBAction func Delete(sender: AnyObject) {
        deletetable()
        
    }
    @IBAction func chax(sender: AnyObject) {
        initUser()
    }
    
    func initUser() {
        let data = db.query("select * from tuser")
        if data.count > 0
        {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            txtUname.text = user["uname"] as? String
            txtMobile.text = user["mobile"] as? String
            txtyou.text = user["email"] as? String
            txtdi.text = user["address"] as? String
        }
    }
    
    func deletetable()
    {
        
       //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "delete from tuser"
        //print ("aaaaaaaa")
        //print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)

    }
    func saveUser()
    {
        let uname = self.txtUname.text!
        let mobile = self.txtMobile.text!
        let you = self.txtyou.text!
        let address = self.txtdi.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into tuser(uname,email,address,mobile) values('\(uname)','\(you)','\(address)','\(mobile)')"
        print ("aaaaaaaa")
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

