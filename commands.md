git grep "string"
git blame index.html
git pull --rebase
git checkout --theirs/--ours index.html => elegir con que fichero quedarse, descartando los cambios del otro completamente. O tambien puedes editarlo manualmente y volver a hacer un commit.
git reset --hard HEAD~1 =>Borrar el primer commit y apuntar HEAD hacia el commit anterior. Pero esto no bora el commit fisicamente. Para eso hay que hacer git push --force.

git --amend para modificar el mensaje del ultimo commit 

git tag -a vx.x .m "string"
git push --tags

puedes hacer checkouts de ramas, commits y tags.

en github projects puedes encontrar una lista de #TODO

telegram bot para que te notifique de los push pull issues que hay (muy util)

hooks => se ejecutan cada vez que cierto evento de ejecuta, puedes añadir por ejemplo añadir mensajes a los commits (como el autor) automaticamente sin tener que escribirlo siempre.


git reflog --relative-date => parar mirar los commits relativos hace una fecha (por ejemplo los commits de hace dos dias)
