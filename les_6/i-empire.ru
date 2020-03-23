server {
	listen 80;
	listen [::]:80;

	server_name i-empire.ru;


	location / {
	 if ($http_User = ""){
             return 404 "Page not found";
         }
             return 200 "Hi $http_User";
        }

}
