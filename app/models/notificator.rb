class Notificator < ActionMailer::Base
  
    def new_registered_user(user)
        recipients   "webmaster@nofallacy.net"
        bcc          User.admins.collect {|a| a.email}
        from         "webmaster@nofallacy.net"
        subject      "[nofallacy.net] Newly registered user !"
        body         :user => user
    end

    def new_fallacy(fallacy)
        recipients   "webmaster@nofallacy.net"
        bcc          User.notified_users.collect {|a| a.email}
        from         "webmaster@nofallacy.net"
        subject      "[nofallacy.net] New fallacy posted !"
        body         :fallacy => fallacy
    end

    def new_topic(topic)
        recipients   "webmaster@nofallacy.net"
        bcc          User.notified_users.collect {|a| a.email}
        from         "webmaster@nofallacy.net"
        subject      "[nofallacy.net] New topic posted !"
        body         :topic => topic
    end

end
