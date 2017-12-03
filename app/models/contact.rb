class Contact < Mail::Base
	attribute :name, 	:validate => true
	attribute :email,	:validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message

	def headers
		{
			:subject => "contact",
			:to => "stephenj.me@gmail.com",
			:from => %("#{name}" <#{email}>)
		}
	end
end
