# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create({first_name: 'Luke', last_name: 'Skywaker', email: 'luke@gmail.com', password: '12345678', password_confirmation: '12345678'})
u2 = User.create({first_name: 'James', last_name: 'Bond', email: 'bond@gmail.com', password: '12345678', password_confirmation: '12345678'})
u3 = User.create({first_name: 'Donald', last_name: 'Tramp',  email: 'tramp@gmail.com', password: '12345678', password_confirmation: '12345678'})
u4 = User.create({first_name: 'Grey', last_name: 'FORD',  email: 'grey@gmail.com', password: '12345678', password_confirmation: '12345678'})
c1 = Chatroom.create({user: u1, title: '1st awesome room'})
m1 = Message.create({body: 'hello world', chatroom: c1, user: u1})
ms1 = MessageStatus.create(message: m1, status: 'delivered', user: u1)
ms2 = MessageStatus.create(message: m1, status: 'unread', user: u2)
ms3 = MessageStatus.create(message: m1, status: 'unread', user: u3)
cp1 = ChatroomParticipant.create({user: u1, chatroom: c1})
cp2 = ChatroomParticipant.create({user: u2, chatroom: c1})
cp3 = ChatroomParticipant.create({user: u3, chatroom: c1})
