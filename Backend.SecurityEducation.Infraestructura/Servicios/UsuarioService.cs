using Backend.SecurityEducation.AccesoDatos.Interna;
using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using System.Security.Claims;
using System.Security.Cryptography;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;

namespace Backend.SecurityEducation.Infraestructura.Servicios
{
    public class UsuarioService : IUsuarioService
    {
        private readonly Usuario _usuario;

        public UsuarioService(Usuario usuario)
        {
            _usuario = usuario;
        }

        public async Task<RespuestaGeneralModelo> InsertarUsuarioAsync(string nombre, string correo, DateTime fechaNacimiento, string ocupacion, string pais, string clave)
        {
            string salt = GenerateSalt();
            string enmascararClave = HashPasswordWithSalt(clave, salt);

            UsuarioDto datosUsuario = new UsuarioDto()
            {
                Nombre = nombre,
                Correo = correo,
                FechaNacimiento = fechaNacimiento,
                Ocupacion = ocupacion,
                Pais = pais,
                Clave = enmascararClave
            };

            return await _usuario.RegistrarUsuarioAsync(datosUsuario, salt);
        }

        public async Task<IList<int>> ObtenerUsuariosAsync()
        {
            return await _usuario.ConsultarUsuariosAsync();
        }

        public async Task<bool> InicializarActividadesAsync(int codigoUsuario)
        {
            return await _usuario.InicializarActividadesAsync(codigoUsuario);
        }

        public string HashPasswordWithSalt(string password, string salt)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                string saltedPassword = password + salt;
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(saltedPassword));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }

        public string GenerateSalt(int size = 16)
        {
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buffer = new byte[size];
            rng.GetBytes(buffer);
            return Convert.ToBase64String(buffer);
        }

        public async Task<UsuarioModelo> IniciarSesion(string usuario, string clave, string claveRsa)
        {
            string codigo = await _usuario.ObtenerLlaveAsync(usuario);

            if(string.IsNullOrEmpty(codigo))
            {
                UsuarioModelo datosUsuario = new UsuarioModelo()
                {
                    Exito = false,
                    Mensaje = "Error al iniciar sesion"
                };
                return datosUsuario;
            }
            else
            {
                string enmascararClave = HashPasswordWithSalt(clave, codigo);
                UsuarioModelo datosUsuario = await _usuario.IniciarSesionAsync(usuario, enmascararClave);
                if (datosUsuario.Exito && string.IsNullOrEmpty(datosUsuario.Mensaje))
                {

                    datosUsuario.Token = ObtenerToken(datosUsuario, claveRsa);
                    datosUsuario.CodigoUsuario = string.Empty;
                }
                return datosUsuario;
            }
        }

        private string ObtenerToken(UsuarioModelo usuario, string claveRsa)
        {
            JwtSecurityTokenHandler tokenHandler = new JwtSecurityTokenHandler();
            byte[] bytekey = Encoding.UTF8.GetBytes(claveRsa);
            DateTime nowUtc = DateTime.UtcNow;

            SecurityTokenDescriptor tokenDescription = new SecurityTokenDescriptor
            {
                Subject = new System.Security.Claims.ClaimsIdentity(new Claim[]
                {
                        new Claim(ClaimTypes.Name, usuario.Correo),
                        new Claim(ClaimTypes.Dsa, usuario.CodigoUsuario),
                        new Claim(ClaimTypes.Role, usuario.Rol),
                }),
                NotBefore = nowUtc,
                Expires = nowUtc.AddMinutes(30),
                IssuedAt = nowUtc,
                Issuer = "http://localhost:5235",
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(bytekey), SecurityAlgorithms.HmacSha256Signature)
            };
            SecurityToken token = tokenHandler.CreateToken(tokenDescription);
            string tokenString = tokenHandler.WriteToken(token);
            return tokenString;
        }

        public async Task<ConsultaUsuario> ValidarUsuarioAsync(string correo)
        {
            return(await _usuario.ValidarUsuarioAsync(correo));
        }

        public async Task<IList<ConsultarUsuariosModelo>> ConsultarUsuariosAsync()
        {
            return await _usuario.ObtenerUsuariosAsync();
        }

    }
}
