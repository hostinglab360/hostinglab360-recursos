# Checklist: Migrar tu Sitio a Otro Hosting

Guía paso a paso para migrar tu sitio web a un nuevo proveedor de hosting sin perder datos ni tiempo de inactividad.

## 📋 Antes de Empezar

### Información a tener lista:

- [ ] Credenciales del hosting actual (cPanel/FTP)
- [ ] Credenciales del nuevo hosting
- [ ] Acceso a tu panel de dominio (DNS)
- [ ] Lista de cuentas de email activas
- [ ] Backup reciente (si existe)

**⏱️ Tiempo estimado:** 2-4 horas (dependiendo del tamaño del sitio)

---

## 📦 Fase 1: Backup Completo

### 1.1 Respaldar Archivos

**Opción A: Via cPanel File Manager**
- [ ] Acceder a cPanel → File Manager
- [ ] Seleccionar carpeta `public_html` (o `www`)
- [ ] Clic derecho → Compress → Crear archivo .zip
- [ ] Descargar el archivo .zip

**Opción B: Via FTP (recomendado para sitios grandes)**
- [ ] Usar FileZilla o WinSCP
- [ ] Conectar a tu hosting actual
- [ ] Descargar toda la carpeta `public_html`

**💡 Tip:** El backup completo puede pesar varios GB. Asegúrate de tener espacio en tu disco.

---

### 1.2 Respaldar Base de Datos

**Para WordPress, Joomla, PrestaShop, etc.:**

- [ ] Acceder a cPanel → phpMyAdmin
- [ ] Seleccionar tu base de datos
- [ ] Clic en "Export" (Exportar)
- [ ] Método: "Quick" (Rápido) está bien para la mayoría
- [ ] Formato: SQL
- [ ] Clic en "Go" (Ejecutar)
- [ ] Guardar el archivo `.sql`

**⚠️ Importante:** 
- Si el archivo SQL es > 50MB, puede dar problemas al importar. Considerá usar SSH/WP-CLI.
- Anota el nombre de la base de datos, usuario y contraseña (lo vas a necesitar)

---

### 1.3 Respaldar Emails (si usás cuentas del hosting)

**Si tenés cuentas de email importantes:**

- [ ] Configurar cliente de email (Thunderbird, Outlook)
- [ ] Descargar todos los emails vía IMAP
- [ ] O exportar desde Webmail (Roundcube/Horde)

**Alternativa:** Migrar primero, sincronizar después con IMAP.

---

### 1.4 Documentar Configuraciones

- [ ] Versión de PHP actual (cPanel → Select PHP Version)
- [ ] Extensiones PHP activas
- [ ] Cron jobs configurados (cPanel → Cron Jobs)
- [ ] Redirecciones (.htaccess)
- [ ] Certificado SSL (normalmente Let's Encrypt, se regenera en nuevo hosting)

---

## 🚀 Fase 2: Preparar el Nuevo Hosting

### 2.1 Configurar el Entorno

- [ ] Crear cuenta de hosting en el nuevo proveedor
- [ ] Acceder al cPanel del nuevo hosting
- [ ] Verificar versión de PHP compatible
- [ ] Activar extensiones PHP necesarias

---

### 2.2 Crear Base de Datos

- [ ] cPanel → MySQL Databases
- [ ] Crear nueva base de datos
- [ ] Crear usuario de base de datos
- [ ] Asignar usuario a la base de datos (All Privileges)
- [ ] **Anotar:** nombre de BD, usuario y contraseña (son diferentes a los del hosting anterior)

---

## 📤 Fase 3: Transferir Archivos y Base de Datos

### 3.1 Subir Archivos

**Opción A: Via cPanel File Manager (sitios pequeños < 500MB)**
- [ ] Acceder a nuevo hosting → cPanel → File Manager
- [ ] Ir a `public_html`
- [ ] Upload del archivo .zip del backup
- [ ] Clic derecho → Extract (Extraer)
- [ ] Eliminar el .zip después de extraer

**Opción B: Via FTP (recomendado)**
- [ ] Conectar FileZilla al nuevo hosting
- [ ] Subir todos los archivos a `public_html`
- [ ] Esperar a que termine (puede llevar 30 min - 2 horas)

---

### 3.2 Importar Base de Datos

- [ ] Nuevo hosting → cPanel → phpMyAdmin
- [ ] Seleccionar la base de datos nueva (recién creada)
- [ ] Clic en "Import"
- [ ] Seleccionar el archivo .sql del backup
- [ ] Clic en "Go"
- [ ] Esperar confirmación (puede tardar varios minutos)

**⚠️ Si da error "máximo tamaño de archivo":**
```bash
# Opción: dividir el archivo SQL
split -l 5000 backup.sql backup_part_

# O usar SSH/terminal:
mysql -u usuario -p nombre_bd < backup.sql
```

---

### 3.3 Actualizar Configuración de Base de Datos

**Para WordPress:**
- [ ] Editar archivo `wp-config.php` (vía File Manager o FTP)
- [ ] Actualizar:
```php
define('DB_NAME', 'nombre_bd_nuevo');
define('DB_USER', 'usuario_nuevo');
define('DB_PASSWORD', 'password_nuevo');
define('DB_HOST', 'localhost'); // generalmente localhost
```

**Para otros CMS (Joomla, PrestaShop):**
- [ ] Editar su archivo de configuración equivalente
- [ ] Actualizar credenciales de BD

---

## 🧪 Fase 4: Probar ANTES de Cambiar DNS

**⚠️ CRÍTICO:** Nunca cambies los DNS sin probar que el sitio funciona en el nuevo servidor.

### 4.1 Editar archivo hosts local

**Windows:**
- [ ] Abrir Notepad como Administrador
- [ ] Abrir archivo: `C:\Windows\System32\drivers\etc\hosts`
- [ ] Agregar línea:
```
123.45.67.89  tudominio.com www.tudominio.com
```
(Reemplazar `123.45.67.89` con la IP del nuevo servidor)

**Mac/Linux:**
- [ ] Editar `/etc/hosts` con sudo
```bash
sudo nano /etc/hosts
```

---

### 4.2 Verificar Funcionamiento

- [ ] Abrir navegador (modo incógnito)
- [ ] Visitar tu dominio
- [ ] Verificar:
  - [ ] Página principal carga correctamente
  - [ ] Imágenes se muestran
  - [ ] Enlaces internos funcionan
  - [ ] Formularios funcionan
  - [ ] Login al admin/panel funciona
  - [ ] Base de datos responde (posts, productos, etc.)

**WordPress específico:**
- [ ] Acceder a `/wp-admin`
- [ ] Verificar plugins activos
- [ ] Probar crear un post de prueba
- [ ] Ver el sitio en frontend

---

### 4.3 Configurar SSL en Nuevo Hosting

- [ ] cPanel → SSL/TLS Status
- [ ] Activar AutoSSL (Let's Encrypt)
- [ ] Esperar emisión del certificado (5-30 min)
- [ ] Verificar HTTPS funciona

**Para WordPress:**
- [ ] Actualizar URLs en Settings → General:
  - Site URL: `https://tudominio.com`
  - WordPress URL: `https://tudominio.com`

---

## 🌐 Fase 5: Cambiar DNS (Go Live)

### 5.1 Actualizar Registros DNS

**En tu proveedor de dominio (GoDaddy, Namecheap, Nic.ar, etc.):**

- [ ] Acceder al panel de gestión de DNS
- [ ] Actualizar registros **A** con la IP del nuevo servidor
  - Host: `@` → IP nueva
  - Host: `www` → IP nueva
- [ ] Verificar registro MX (email) si cambió
- [ ] **TTL:** Bajar a 300 segundos antes del cambio (opcional, para propagación rápida)

**💡 Tip:** Anota la IP antigua por si necesitás revertir.

---

### 5.2 Esperar Propagación DNS

- [ ] Esperar 1-24 horas para propagación completa
- [ ] Usar [WhatsMyDNS.net](https://whatsmydns.net) para verificar propagación mundial

**Durante la propagación:**
- Algunos usuarios verán hosting antiguo
- Otros verán el nuevo
- Es normal, no requiere acción

---

### 5.3 Verificar desde Diferentes Ubicaciones

- [ ] Verificar el sitio desde:
  - [ ] Tu conexión wifi
  - [ ] Conexión móvil (4G/5G)
  - [ ] VPN/proxy en otra ubicación

---

## 📧 Fase 6: Migrar Emails (si aplica)

### 6.1 Crear Cuentas de Email en Nuevo Hosting

- [ ] Nuevo hosting → cPanel → Email Accounts
- [ ] Crear las mismas cuentas que tenías
- [ ] Configurar forwarding si usabas

---

### 6.2 Migrar Emails Existentes

**Opción A: Sincronización IMAP**
- [ ] Cliente de email configurado con cuenta antigua
- [ ] Agregar cuenta nueva
- [ ] Arrastrar carpetas de antigua a nueva

**Opción B: Uso de herramienta de migración**
- Algunos hostings ofrecen herramientas de migración de email

---

## 🧹 Fase 7: Post-Migración

### 7.1 Verificación Final

- [ ] Todos los enlaces funcionan
- [ ] Formularios envían correctamente
- [ ] SSL activo y forzado (HTTP → HTTPS)
- [ ] Sitemap.xml accesible
- [ ] Robots.txt accesible
- [ ] Cron jobs configurados (si tenías)

---

### 7.2 Monitoreo

- [ ] Configurar UptimeRobot o similar
- [ ] Monitorear los primeros 7 días de cerca
- [ ] Revisar logs de errores (cPanel → Error Log)

---

### 7.3 Cancelar Hosting Antiguo

**⚠️ ESPERA AL MENOS 7 DÍAS** antes de cancelar el antiguo hosting:
- [ ] Verificar que todo funciona perfecto
- [ ] Asegurar que DNS propagó completamente
- [ ] Confirmar backups completos
- [ ] **Entonces sí**, proceder a cancelar hosting antiguo

---

## 🆘 Problemas Comunes y Soluciones

### "Error estableciendo conexión con la base de datos"
- ✅ Verificá `wp-config.php` (o archivo de config)
- ✅ Confirmá que usuario de BD tenga permisos
- ✅ Verificá que el nombre de BD sea correcto

### "Página en blanco" o "Error 500"
- ✅ Verificá permisos de archivos (644 para archivos, 755 para carpetas)
- ✅ Revisar error log de cPanel
- ✅ Verificar versión de PHP compatible

### "Imágenes rotas"
- ✅ Verificá que `wp-content/uploads` se haya transferido completo
- ✅ Para WordPress: usar plugin "Better Search Replace" para actualizar URLs

### "Email no funciona"
- ✅ Verificar registros MX apuntan al servidor correcto
- ✅ Confirmar cuentas de email creadas en nuevo hosting

---

## 🛠️ Herramientas Útiles

- **FileZilla**: Cliente FTP gratuito
- **Duplicator (WordPress)**: Plugin de migración automatizada
- **All-in-One WP Migration**: Migración simplificada para WordPress
- **WP-CLI**: Para migraciones avanzadas vía terminal
- **WhatsMyDNS.net**: Verificar propagación de DNS

---

## 💡 Consejo Final

**Hacelo en horario de bajo tráfico** (madrugada/fin de semana) para minimizar impacto en usuarios.

**Si no te sentís seguro:** Muchos proveedores de hosting ofrecen **servicio de migración gratuita**. Aprovechalo.

---

## 🔗 Migración Asistida

En [HostingLab360](https://hostinglab360.com.ar) evaluamos proveedores que ofrecen migración gratuita incluida.

👉 [Ver proveedores con migración gratis](https://hostinglab360.com.ar)

---

**Última actualización:** Enero 2026  
**Autor:** HostingLab360
