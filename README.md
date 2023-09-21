<h2 align="left">
  CRUD Java Web
</h2>

<img src="https://github.com/ItamarJoire/crud-jsp-java/blob/master/src/template.png" height="600" align="center"/>


## 🛠 Configuração

1. Execute este comando para criar o banco, tabela e já inserir usuários

   ```sql
       CREATE TABLE IF NOT EXISTS `user` (
      `id` int(10) NOT NULL AUTO_INCREMENT,
      `name` varchar(100) NOT NULL,
      `email` varchar(100) NOT NULL,
      PRIMARY KEY (`id`)
      ) ENGINE=InnoDB  DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

      INSERT INTO `user` (`name`, `email`) VALUES
      ('João', 'joao@teste.com'),
      ('Bruna', 'bruna@teste.com'),
      ('Maria', 'maria@teste.com');
   ```

2. Coloque suas credencias no arquivo ***dao/UserDao*** para se conectar ao MySQL

   ```sh
     String url = "jdbc:mysql://localhost:3306/nome_do_banco";
     String username = "seu_usuario";
     String password = "sua_senha";
   ```

&nbsp;



## 🚀 Tecnologias

* [JSP](https://docs.oracle.com/javaee/5/tutorial/doc/bnagx.html)
* [Toomcat 8.5](https://tomcat.apache.org/download-80.cgi)
* [Tailwinds](https://tailwindcss.com/)
