# Blogs/Publicaciones/Mensajes I

Cree los archivos migration así como los modelos para la aplicación anterior.
rails g model Blog name:string description:text
rails g model Post title:string content:text blog:references
rails g model Message author:string message:text post:references
rails db:migrate

Implemente las siguientes validaciones:
1.	Requerir el nombre y la descripción para el blog.
validates :name, :description, presence: true

2.	Requerir el título y el contenido de las publicaciones (post). El título tiene que ser de al menos 7 caracteres de longitud.
validates :title, :content, presence: true
validates :title, length: { is: 7 }

3.	Requerir el autor y el mensaje para los mensajes. El mensaje de tener al menos 15 caracteres de longitud.
validates :author, :message, presence: true
validates :message, length: { is: 15 }

Usando la consola:
1.	Cree 5 nuevos blogs.
Blog.create(name:"ESPN", description:"Contenido deportivo")
Blog.create(name:"HBO", description:"Contenido cinematografico")
Blog.create(name:"MTV", description:"Contenido musical")
Blog.create(name:"TVN", description:"Contenido nacional")
Blog.create(name:"CNN", description:"Contenido internacional")

2.	Cree varias publicaciones para cada blog.
blog = Blog.first
blog.posts.create(title:'titular deportivo', content:'contenido deportivo')
primer_blog = Blog.first
primer_blog.posts.create([{title:"segundo titulo deportivo", content:"segundo contenido deportivo"}, {title:"tercer titulo deportivo", content:"tercer contenido deportivo"}])

blog = Blog.find(3)
blog.posts.create([{title:"primer titulo musical", content:"primer contenido musical"}, {title:"segundo titulo musical", content:"segundo contenido musical"}, {title:"tercer titulo musical", content:"tercer contenido musical"}])

blog = Blog.find(4)
blog.posts.create([{title:"primer titulo nacional", content:"primer contenido nacional"}, {title:"segundo titulo nacional", content:"segundo contenido nacional"}, {title:"tercer titulo nacional", content:"tercer contenido nacional"}])

blog = Blog.find(5)
blog.posts.create([{title:"primer titulo internacional", content:"primer contenido internacional"}, {title:"segundo titulo internacional", content:"segundo contenido internacional"}, {title:"tercer titulo internacional", content:"tercer contenido internacional"}])

3.	Cree varios mensajes para la primer publicación.
post = Post.find(1)
post.messages.create([{author:"Autor 1", message:"Mensaje numero 1"}, {author:"Autor 2", message:"Mensaje numero 2"}, {author:"Autor 3", message:"Mensaje numero 3"}])

4.	Obtener todas las publicaciones para el primer blog.
blog = Blog.first
blog.posts

5.	Obtener todas las publicaciones para el último blog (ordenadas por titulo en orden descendiente).
blog = Blog.last
blog.posts.order("title DESC")

6.	Actualizar el título de la primera publicación.
post = Post.first
post.title = "primer titulo deportivo actualizado"
post.save

7.	Eliminar la tercera publicación (haga que el modelo borre automáticamente todos los mensajes asociados con la tercera publicación cuando la elimines).
*Se crean messages para la tercera publicación:
post = Post.find(3)
post.messages.create([{author:"Autor 1", message:"Mensaje numero 1"}, {author:"Autor 2", message:"Mensaje numero 2"}, {author:"Autor 3", message:"Mensaje numero 3"}])

*Se modifica modelo:
class Post < ApplicationRecord
...
has_many :messages, dependent: :destroy
...
end

*Se elimina post y mensajes asociados a el:
post = Post.find(3)
post.destroy

8.	Obtener todos los blog.
Blog.all

9.	Obtener todos los blog con id menor a 5.
Blog.where("id < 5")