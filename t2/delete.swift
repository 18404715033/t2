//
//  ViewController.swift
//  t2
//
//  Created by 李伯阳  Lok’Tar Ogar on 16/7/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class delete: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet weak var y: UITextField!
    @IBOutlet weak var x: UITextView!
    
    
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
    
    
    @IBAction func deletename(sender: AnyObject) {
        delete()
        y.resignFirstResponder()
    }
 
    
    func delete()
    {
        let value = y.text!
        let sql = "delete from tuser where uname='\(value)'"
        let result = db.execute(sql)
        print(result)
    }
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
