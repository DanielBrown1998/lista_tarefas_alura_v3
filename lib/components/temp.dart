// FutureBuilder<List<Task>>(
//             future: TaskDao().findAll(),
//             builder: (context, snapshot) {
//               List<Task>? items = snapshot.data;
//               switch (snapshot.connectionState) {
//                 case ConnectionState.none:
//                   return Center(
//                     child: Column(
//                       children: [
//                         CircularProgressIndicator(),
//                         Text("Carregando...")
//                       ],
//                     ),
//                   );
//                 case ConnectionState.waiting:
//                   return Center(
//                     child: Column(
//                       children: [
//                         CircularProgressIndicator(),
//                         Text("Carregando...")
//                       ],
//                     ),
//                   );
//                 case ConnectionState.active:
//                   return Center(
//                     child: Column(
//                       children: [
//                         CircularProgressIndicator(),
//                         Text("Carregando...")
//                       ],
//                     ),
//                   );
//                 case ConnectionState.done:
//                   if (snapshot.hasData && items != null) {
//                     if (items.isNotEmpty) {
//                       return ListView.builder(
//                           itemCount: items.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final Task tarefa = items[index];
//                             return tarefa;
//                           });
//                     }
//                     return Center(
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.error_outline,
//                             size: 128,
//                           ),
//                           Text(
//                             "Não há tarefas",
//                             style: TextStyle(fontSize: 32),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                   return Text("ERROR! tarefas não carregadas");
//               }
//             })