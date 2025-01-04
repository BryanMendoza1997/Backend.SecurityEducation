using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Backend.SecurityEducation.Modelo.Modelos;

namespace Backend.SecurityEducation.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class IdentidadController : ControllerBase
    {
        private readonly ILogger<IdentidadController> _logger;
        private readonly IConfiguration _configuration;

        public IdentidadController(ILogger<IdentidadController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }

        [HttpPost]
        [Route("Token")]
        public string ObtenerToken(UsuarioModelo usuario)
        {
            JwtSecurityTokenHandler tokenHandler = new JwtSecurityTokenHandler();
            byte[] bytekey = Encoding.UTF8.GetBytes(_configuration["EncryptionKey"]);
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
    }
}
