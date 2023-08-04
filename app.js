const express = require('express');
const app = express();
const path = require('path');
const PORT = 3030;

/* Configuraciones */
app.use(express.static(path.join(__dirname, 'public')));

/* Rutas */
app.get('/', (req, res) => res.sendFile(path.join(__dirname, 'views', 'index.html')));
app.get('/productDetail', (req, res) => res.sendFile(path.join(__dirname, 'views', 'productDetail.html')));
//app.get('/productCart',(req,res) => res.sendFile(path.join(__dirname,'views','productCart.html')));
//app.get('/register',(req,res) => res.sendFile(path.join(__dirname,'views','register.html')));
//app.get('/login',(req,res) => res.sendFile(path.join(__dirname,'views','login.html')));
app.get('/header', (req, res) => res.sendFile(path.join(__dirname, 'views', 'partials', 'header.html')));


/* PARTIALS */
app.get("/register", (req, res) => res.sendFile(path.join(__dirname, "views", "partials", "register.html")));
app.get("/login", (req, res) => res.sendFile(path.join(__dirname, "views", "partials", "login.html")));
app.get("/footer", (req, res) => res.sendFile(path.join(__dirname, "views", "partials", "footer.html")));


app.listen(PORT, () => console.log('Servidor corriendo en http://localhost:' + PORT));