# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password")
              
User.create!( name: "ナンバーワン",
              email: "sample1@email.com",
              password: "password",
              password_confirmation: "password")
              
Task.create!( name: "テスト１",
              description: "詳細テスト１",
              user_id: "1")